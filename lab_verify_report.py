#!/usr/bin/env python3
"""
lab_verify_report.py — parse the JMH JSON from a decode-shape run, check the
measured numbers against the pre-registered findings, and write a dated Markdown
report.

Invoked by run_lab.sh; can also be run by hand on any run directory:

    python3 lab_verify_report.py --run-dir reports/run-2026-05-30_120000 \
                                 --report reports/decode-shape-report-X.md

Exit code: 0 if no check FAILED, 1 otherwise. Checks that lack their input data
(e.g. perfnorm when perf was locked) are SKIPPED, not failed.

The bands below are "does the phenomenon reproduce" tolerances, not exact-number
asserts: the effects are large (5x, 1.45x step, 15 vs 1.57 insns/value), so a
wide band still catches a real regression while tolerating run-to-run noise and a
different-but-related host.
"""
import argparse
import json
import os
import re
import sys

# ---- expected anchors (this-host article numbers, for the report text) -------
ART = {
    "vec_insns": 1.57,      # vector int-lane, widths <= 25
    "vec_insns_w26": 2.88,  # vector long-lane, width 26
    "scalar_insns": 15.2,   # generic scalar, flat
    "widen_insns_w8": 3.0,  # scalar-widen w8: lean scalar (~3 insns/value), not SIMD
    "kernel_step": 1.45,    # vector throughput w25 -> w26
    "vec_over_generic": 4.8,  # vector / generic, flat ~5x
}


def load(path):
    if not os.path.exists(path):
        return []
    try:
        with open(path) as f:
            return json.load(f)
    except (json.JSONDecodeError, OSError):
        return []


def read_env(run_dir):
    env = {}
    p = os.path.join(run_dir, "env.txt")
    if os.path.exists(p):
        for line in open(p):
            line = line.strip()
            if "=" in line:
                k, v = line.split("=", 1)
                env[k] = v
    return env


def index_thrpt(records):
    """(width:int, decoder:str) -> throughput score (values/us)."""
    d = {}
    for r in records:
        if r.get("mode") != "thrpt":
            continue
        p = r.get("params", {})
        w, dec = p.get("bitWidth"), p.get("decoder")
        if w is None or dec is None:
            continue
        d[(int(w), dec)] = r["primaryMetric"]["score"]
    return d


def insns_per_value(rec):
    # JMH puts profiler counters in a TOP-LEVEL `secondaryMetrics` (sibling of
    # `primaryMetric`), not under primaryMetric. perfnorm's per-op instruction
    # count is the "instructions" key there.
    sm = rec.get("secondaryMetrics", {}) or {}
    # exact 'instructions', then a no-suffix variant, then any match
    for want in (lambda k: k.lower() == "instructions",
                 lambda k: "instructions" in k.lower() and ":" not in k,
                 lambda k: "instructions" in k.lower()):
        for k in sm:
            if want(k):
                return sm[k].get("score")
    return None


def index_perf(records):
    """(width:int, decoder:str) -> instructions/value."""
    d = {}
    for r in records:
        p = r.get("params", {})
        w, dec = p.get("bitWidth"), p.get("decoder")
        if w is None or dec is None:
            continue
        v = insns_per_value(r)
        if v is not None:
            d[(int(w), dec)] = v
    return d


class Checks:
    def __init__(self):
        self.rows = []  # (name, status, detail)

    def add(self, name, status, detail):
        self.rows.append((name, status, detail))

    def passed(self, name, cond, detail):
        self.add(name, "PASS" if cond else "FAIL", detail)

    def skip(self, name, detail):
        self.add(name, "SKIP", detail)

    def warn(self, name, detail):
        self.add(name, "WARN", detail)

    @property
    def n_fail(self):
        return sum(1 for _, s, _ in self.rows if s == "FAIL")


def fmt(x):
    return "n/a" if x is None else f"{x:.2f}"


def run_checks(on, off, perf, perf_off, c):
    # 1. substrate free: scalar-array ~ scalar-segment at every common width
    pairs = [(w, on[(w, "scalar-array")], on[(w, "scalar-segment")])
             for (w, dec) in on if dec == "scalar-array" and (w, "scalar-segment") in on]
    if pairs:
        worst = max(abs(a - s) / a for _, a, s in pairs)
        ww = max(pairs, key=lambda t: abs(t[1] - t[2]) / t[1])[0]
        status = "PASS" if worst < 0.08 else "WARN"
        c.add("Substrate is free (byte[] vs MemorySegment)", status,
              f"max rel. diff {worst*100:.1f}% (width {ww}); expected within noise")
    else:
        c.skip("Substrate is free", "scalar-array/scalar-segment not both present")

    # 2. vector is a clear win over generic at a mid irregular width
    midw = next((w for w in (13, 9, 17) if (w, "vector-segment") in on and (w, "scalar-array") in on), None)
    if midw:
        ratio = on[(midw, "vector-segment")] / on[(midw, "scalar-array")]
        c.passed(f"Vector >> generic scalar (w{midw})", 3.5 <= ratio <= 6.5,
                 f"vector/generic = {ratio:.2f}x (expected ~{ART['vec_over_generic']}x)")
    else:
        c.skip("Vector >> generic scalar", "vector/scalar-array not present at a mid width")

    # 3. kernel-switch step at w26 (vector w25 -> w26)
    if (25, "vector-segment") in on and (26, "vector-segment") in on:
        step = on[(25, "vector-segment")] / on[(26, "vector-segment")]
        c.passed("Kernel-switch step at w26", step > 1.20,
                 f"vector w25/w26 = {step:.2f}x (expected ~{ART['kernel_step']}x)")
    else:
        c.skip("Kernel-switch step at w26", "vector not present at w25 and w26")

    # 4. the backfire: parquet-scalar slower than generic at wide irregular widths
    bf = [w for w in (17, 25) if (w, "parquet-scalar") in on and (w, "scalar-array") in on]
    if bf:
        details = []
        ok = True
        for w in bf:
            pq, nv = on[(w, "parquet-scalar")], on[(w, "scalar-array")]
            ok = ok and pq < nv
            details.append(f"w{w}: parquet {pq:.0f} vs generic {nv:.0f}")
        c.passed("Parquet scalar specialization backfires (wide widths)", ok,
                 "; ".join(details) + " (parquet should be < generic)")
    else:
        c.skip("Parquet scalar backfires", "parquet-scalar/scalar-array not present at w17/w25")

    # 5. SuperWord changes scalar-widen at w8 (a regression) but not the generic scalar (ON vs OFF)
    #    NB: this is a throughput *change*, not autovectorization — Run 4 confirms no SIMD is emitted.
    if off and (8, "scalar-widen") in on and (8, "scalar-widen") in off \
            and (8, "scalar-array") in on and (8, "scalar-array") in off:
        wi_on, wi_off = on[(8, "scalar-widen")], off[(8, "scalar-widen")]
        ar_on, ar_off = on[(8, "scalar-array")], off[(8, "scalar-array")]
        widen_moves = abs(wi_on - wi_off) / wi_on > 0.05
        generic_flat = abs(ar_on - ar_off) / ar_on < 0.04
        reg = " (SuperWord ON is a regression here)" if wi_off > wi_on else ""
        c.passed("SuperWord changes scalar-widen at w8, not the generic scalar", widen_moves and generic_flat,
                 f"widen ON {wi_on:.0f} / OFF {wi_off:.0f}{reg}; "
                 f"generic ON {ar_on:.0f} / OFF {ar_off:.0f} (flat)")
    else:
        c.skip("SuperWord changes scalar-widen at w8, not the generic scalar", "SuperWord ON/OFF data incomplete at w8")

    # ---- mechanism checks (perfnorm) ----
    if not perf:
        for n in ("Vector path is genuinely SIMD (insns/value)",
                  "Generic scalar is genuinely scalar (insns/value)",
                  "scalar-widen w8 is lean scalar, not SIMD (insns/value)",
                  "Vector kernel-switch costs instructions (w26)",
                  "Parquet scalar is NOT autovectorized (insns/value)",
                  "Parquet scalar insns unchanged ON vs OFF (confirms not autovectorized)",
                  "SuperWord gives no instruction reduction for scalar-widen at w16 (unlike w8)"):
            c.skip(n, "no perfnorm data (perf locked or --no-env)")
        return

    # 6. vector genuinely SIMD
    vw = next((w for w in (13, 5, 9, 17) if (w, "vector-segment") in perf), None)
    if vw is not None:
        v = perf[(vw, "vector-segment")]
        c.passed("Vector path is genuinely SIMD (insns/value)", v <= 2.0,
                 f"vector w{vw} = {fmt(v)} insns/value (expected ~{ART['vec_insns']})")
    else:
        c.skip("Vector path is genuinely SIMD", "no vector perfnorm sample")

    # 7. generic genuinely scalar
    sw = next((w for w in (5, 9, 13, 17, 26) if (w, "scalar-array") in perf), None)
    if sw is not None:
        v = perf[(sw, "scalar-array")]
        c.passed("Generic scalar is genuinely scalar (insns/value)", 12.0 <= v <= 18.0,
                 f"scalar-array w{sw} = {fmt(v)} insns/value (expected ~{ART['scalar_insns']})")
    else:
        c.skip("Generic scalar is genuinely scalar", "no scalar-array perfnorm sample")

    # 8. scalar-widen w8 is a lean scalar loop (~3 insns/value) — NOT SIMD (Run 4: no vpmovzx)
    if (8, "scalar-widen") in perf:
        v = perf[(8, "scalar-widen")]
        c.passed("scalar-widen w8 is lean scalar, not SIMD (insns/value)", 2.3 <= v <= 4.2,
                 f"scalar-widen w8 = {fmt(v)} insns/value (expected ~{ART['widen_insns_w8']}); "
                 "lean, but Run 4 shows it is scalar, not auto-vectorized")
    else:
        c.skip("scalar-widen w8 is lean scalar, not SIMD (insns/value)", "no scalar-widen perfnorm sample at w8")

    # 9. vector kernel switch costs instructions (w26 > w<=25)
    if (26, "vector-segment") in perf and vw is not None:
        v26, vlo = perf[(26, "vector-segment")], perf[(vw, "vector-segment")]
        c.passed("Vector kernel-switch costs instructions (w26)", v26 > vlo * 1.4,
                 f"vector w26 {fmt(v26)} vs w{vw} {fmt(vlo)} insns/value "
                 f"(expected ~{ART['vec_insns_w26']} vs ~{ART['vec_insns']})")
    else:
        c.skip("Vector kernel-switch costs instructions", "no vector perfnorm at w26")

    # 10. parquet NOT autovectorized, grows with width
    pqs = sorted(w for (w, dec) in perf if dec == "parquet-scalar")
    if len(pqs) >= 2:
        lo, hi = pqs[0], pqs[-1]
        vlo, vhi = perf[(lo, "parquet-scalar")], perf[(hi, "parquet-scalar")]
        c.passed("Parquet scalar is NOT autovectorized (insns/value)",
                 vlo >= 6.0 and vhi > vlo,
                 f"parquet w{lo} {fmt(vlo)} -> w{hi} {fmt(vhi)} insns/value "
                 f"(scalar range 8-23, growing with width)")
    else:
        c.skip("Parquet scalar is NOT autovectorized", "insufficient parquet perfnorm samples")

    # 11. parquet instruction count unchanged ON vs OFF -> direct proof it is not autovectorized
    pq_pairs = [(w, perf[(w, "parquet-scalar")], perf_off[(w, "parquet-scalar")])
                for w in sorted(w for (w, d) in perf_off if d == "parquet-scalar")
                if (w, "parquet-scalar") in perf]
    if pq_pairs:
        worst = max(abs(a - b) for _, a, b in pq_pairs)
        c.passed("Parquet scalar insns unchanged ON vs OFF (confirms not autovectorized)",
                 worst <= 0.5,
                 "; ".join(f"w{w} ON {a:.2f}/OFF {b:.2f}" for w, a, b in pq_pairs)
                 + f" (max |delta| {worst:.2f}; SuperWord makes no difference)")
    else:
        c.skip("Parquet scalar insns unchanged ON vs OFF (confirms not autovectorized)",
               "no parquet-scalar SuperWord-OFF perfnorm data")

    # 12. SuperWord gives no instruction reduction for scalar-widen at w16 (unlike w8).
    # NB: this shows the absence of a counter-level *benefit*, not the absence of any
    # vector transformation; what C2 emits at w16 would need assembly to characterize.
    if (16, "scalar-widen") in perf and (16, "scalar-widen") in perf_off:
        on16, off16 = perf[(16, "scalar-widen")], perf_off[(16, "scalar-widen")]
        c.passed("SuperWord gives no instruction reduction for scalar-widen at w16 (unlike w8)",
                 abs(on16 - off16) <= 0.5,
                 f"w16 scalar-widen ON {on16:.2f}/OFF {off16:.2f} "
                 f"(|delta| {abs(on16 - off16):.2f}); SuperWord does not reduce the count at w16, "
                 "unlike w8 (2.64 off, 3.01 on). Byte-alignment alone does not yield a baseline as lean as w8.")
    else:
        c.skip("SuperWord gives no instruction reduction for scalar-widen at w16 (unlike w8)",
               "no scalar-widen w16 ON/OFF perfnorm data")


# ---- report rendering --------------------------------------------------------
def thrpt_table(on, off):
    widths = sorted({w for (w, _) in on})
    decoders = ["scalar-array", "scalar-segment", "scalar-widen", "parquet-scalar", "vector-segment"]
    head = "| width | " + " | ".join(decoders) + " |"
    sep = "|" + "------:|" * (len(decoders) + 1)
    lines = [head, sep]
    for w in widths:
        cells = [str(w)]
        for d in decoders:
            v = on.get((w, d))
            cells.append("-" if v is None else f"{v:.0f}")
        lines.append("| " + " | ".join(cells) + " |")
    return "\n".join(lines)


def perf_table(perf):
    if not perf:
        return "_no perfnorm data (perf counters locked, or run with --no-env)._"
    widths = sorted({w for (w, _) in perf})
    decoders = ["scalar-array", "scalar-widen", "parquet-scalar", "vector-segment"]
    head = "| width | " + " | ".join(decoders) + " |"
    sep = "|" + "------:|" * (len(decoders) + 1)
    lines = [head, sep]
    for w in widths:
        cells = [str(w)]
        for d in decoders:
            v = perf.get((w, d))
            cells.append("-" if v is None else f"{v:.2f}")
        lines.append("| " + " | ".join(cells) + " |")
    return "\n".join(lines)


# ---- machine-code (assembly / perfasm) structural checks ---------------------
# These are a different KIND of check from the numeric ones above: they grep the
# emitted C2 machine code and the perfasm cycle attribution, not JSON tolerances.
# They guard the JDK-25-specific narrative: if a future JDK actually auto-vectorizes
# the widening loop (emits vpmovzx*), check 13 fails and flags that the article's
# machine-code account no longer holds on that JDK. Inputs live in run-dir/asm/,
# produced by Run 4 of run_lab.sh (needs a JDK 25-compatible hsdis). Missing inputs
# are SKIPPED, not failed (a --no-env / hsdis-less run still verifies everything else).
def _read_text(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as f:
            return f.read()
    except OSError:
        return None


def _c2_std_region(asm, method_sig="ScalarWidenDecoder::decode ("):
    """The C2 (tier-4) standard compile of the given method: from its header to the
    next 'Compiled method'. That is the steady-state hot loop the throughput benchmark
    executes. The '(c2)' guard is essential: a lower-tier C1 compile of the same method
    may be dumped first and carries none of the SuperWord unrolling, so matching on the
    bare method name would read the wrong region."""
    lines = asm.splitlines()
    start = next((i for i, ln in enumerate(lines)
                  if ln.startswith("Compiled method (c2)") and method_sig in ln), None)
    if start is None:
        # No C2 standard compile dumped; fall back to any C2 compile (e.g. OSR @).
        start = next((i for i, ln in enumerate(lines)
                      if ln.startswith("Compiled method (c2)")), None)
    if start is None:
        return asm  # no C2 compile at all; fall back to the whole extract
    end = next((j for j in range(start + 1, len(lines))
                if lines[j].startswith("Compiled method")), len(lines))
    return "\n".join(lines[start:end])


def _vmovd_cycle_share(perfasm_text):
    """Sum of sampled-cycle percentages on lines whose instruction is vmovd."""
    return sum(float(m.group(1))
               for ln in perfasm_text.splitlines()
               for m in [re.match(r"\s*([0-9]+\.[0-9]+)%.*\bvmovd\b", ln)] if m)


def run_asm_checks(asm_dir, did_setup, c):
    keys = ["widen8-on", "widen8-off", "widen16-on", "widen16-off"]
    asm = {k: _read_text(os.path.join(asm_dir, f"{k}.decode.asm")) for k in keys}

    # 13. The widening loops are never auto-vectorized: no SIMD widening opcode.
    if all(asm[k] is not None for k in keys):
        region = {k: _c2_std_region(asm[k]) for k in keys}
        simd = {k: len(re.findall(r"vpmovzx", region[k], re.IGNORECASE)) for k in keys}
        c.passed("Widening loops emit no SIMD widening (no vpmovzx*) at w8/w16, SuperWord on/off",
                 all(v == 0 for v in simd.values()),
                 "vpmovzx in C2 hot loop: " + ", ".join(f"{k}={simd[k]}" for k in keys)
                 + "; all zero confirms C2 does not auto-vectorize the widening loop on this JDK.")

        # 14. SuperWord changes the width-8 code shape: GPR-XMM round trips appear.
        v8on = len(re.findall(r"\bvmovd\b", region["widen8-on"], re.IGNORECASE))
        v8off = len(re.findall(r"\bvmovd\b", region["widen8-off"], re.IGNORECASE))
        c.passed("SuperWord adds GPR-XMM transfers to the width-8 hot loop (code-shape change)",
                 v8off <= 3 and v8on >= 8,
                 f"vmovd in C2 hot loop: w8 OFF {v8off} (housekeeping only), ON {v8on} "
                 "(values routed through XMM); ON is the slower configuration.")
    else:
        for nm in ("Widening loops emit no SIMD widening (no vpmovzx*) at w8/w16, SuperWord on/off",
                   "SuperWord adds GPR-XMM transfers to the width-8 hot loop (code-shape change)"):
            c.skip(nm, "no disassembly in run-dir/asm (hsdis missing or Run 4 skipped)")

    # 15. The cycle cost of those transfers is asymmetric: dominant at w8, minor at w16.
    pa8 = _read_text(os.path.join(asm_dir, "perfasm-widen8-on.txt"))
    pa16 = _read_text(os.path.join(asm_dir, "perfasm-widen16-on.txt"))
    name15 = "XMM-transfer cycle cost is asymmetric: dominant at w8, minor at w16"
    if pa8 and pa16:
        s8, s16 = _vmovd_cycle_share(pa8), _vmovd_cycle_share(pa16)
        c.passed(name15, s8 >= 20.0 and s16 <= 10.0,
                 f"perfasm cycles on vmovd: w8 ON ~{s8:.0f}% (substantial), w16 ON ~{s16:.1f}% (minor); "
                 "the same static anomaly is performance-dominant at w8, nearly irrelevant at w16.")
    elif not did_setup:
        c.skip(name15, "perfasm needs perf (env not tuned)")
    else:
        c.skip(name15, "no perfasm output in run-dir/asm")

    # 16. Positive control: the SAME vectorizer vectorizes a homogeneous int loop but
    # not the byte->int widening. Isolates the def-use element-size rule as the cause.
    homog = _read_text(os.path.join(asm_dir, "homog.decode.asm"))
    name16 = "Positive control: SuperWord vectorizes the homogeneous loop but not the widening"
    if homog is not None and asm.get("widen8-on") is not None:
        vpaddd = len(re.findall(r"\bvpaddd\b", _c2_std_region(homog, "Diag::homog ("), re.IGNORECASE))
        widen_simd = len(re.findall(r"vpmovzx", _c2_std_region(asm["widen8-on"]), re.IGNORECASE))
        c.passed(name16, vpaddd > 0 and widen_simd == 0,
                 f"homogeneous int+int loop: {vpaddd} vpaddd (vectorized); width-8 widening: "
                 f"{widen_simd} vpmovzx (not vectorized). Same machine and pipeline; only the implicit "
                 "byte-to-int widening fails SuperWord's vector def-use compatibility check.")
    else:
        c.skip(name16, "no homog/widen disassembly in run-dir/asm")


def render(env, on, off, perf, perf_off, c):
    mark = {"PASS": "PASS", "FAIL": "**FAIL**", "WARN": "WARN", "SKIP": "skip"}
    grade = {"quick": "smoke (NOT citable)",
             "default": "reproduction / CI (NOT the article's measurement of record)",
             "full": "article-grade (matches RESULTS.md: 3 forks, 5+5 iters)",
             "publication": "publication-grade (3 forks, long warmup)"}.get(
                 env.get("profile", ""), env.get("profile", "?"))
    nfail = c.n_fail
    nwarn = sum(1 for _, s, _ in c.rows if s in ("WARN", "SKIP"))
    if nfail:
        verdict = f"**{nfail} check(s) did NOT reproduce.** See the table below."
    elif nwarn:
        verdict = "All checks reproduced (some skipped/with caveats: perfnorm or off-run data missing)."
    else:
        verdict = "All checks reproduced."

    check_lines = ["| check | status | detail |", "|---|---|---|"]
    for name, status, detail in c.rows:
        check_lines.append(f"| {name} | {mark[status]} | {detail} |")

    parts = [
        f"# decode-shape — reproduction report",
        "",
        f"- **Run:** `{env.get('stamp','?')}`  |  profile: `{env.get('profile','?')}` "
        f"(forks={env.get('forks','?')}, "
        f"warmup={env.get('warmup','?')}x{env.get('warmup_t','?')}s, "
        f"measure={env.get('iters','?')}x{env.get('meas_t','?')}s)",
        f"- **Grade:** {grade}",
        f"- **Host:** {env.get('host','?')}  |  CPU: {env.get('cpu','?')}",
        f"- **Kernel:** {env.get('kernel','?')}  |  governor at run: `{env.get('governor','?')}`  "
        f"|  perf_event_paranoid: `{env.get('paranoid','?')}`  |  env tuned: `{env.get('env_tuned','?')}`",
        f"- **JDK:** {env.get('jdk','?')}",
        f"- **Repo:** commit `{env.get('git_commit','?')}` on `{env.get('git_branch','?')}` "
        f"(working tree dirty: `{env.get('git_dirty','?')}`)",
        "",
        "## Verdict",
        "",
        verdict,
        "",
        "## Checks",
        "",
        "\n".join(check_lines),
        "",
        "## Throughput (values/µs, higher is better) — SuperWord ON",
        "",
        thrpt_table(on, off),
        "",
        "## Mechanism — perfnorm (instructions/value; ~15 scalar, ~3 lean scalar, ~1.6 SIMD)",
        "",
        perf_table(perf),
        "",
        "## Notes",
        "",
        "- `parquet-scalar` runs on a `byte[]` substrate (Parquet's real `unpack8Values`); "
        "read its *instructions/value* and its *shape across widths*, not its absolute "
        "throughput against the `MemorySegment` rows.",
        "- `scalar-widen` only applies to byte-aligned widths 8/16; it is absent (`-`) elsewhere.",
        (("- `scalar-widen` SuperWord OFF (insns/value): "
          + ", ".join(f"w{w} {perf_off[(w, d)]:.2f}" for (w, d) in sorted(perf_off) if d == "scalar-widen")
          + " — vs the ON values above; the OFF speedup at the counter level.")
         if any(d == "scalar-widen" for (_, d) in perf_off) else
         "- perfnorm primary *throughput* is ignored on purpose (Cnt is tiny there); only the "
         "stable secondary counters (instructions/value, IPC, cache loads) are read."),
        (("- `parquet-scalar` SuperWord OFF (insns/value): "
          + ", ".join(f"w{w} {perf_off[(w, d)]:.2f}" for (w, d) in sorted(perf_off) if d == "parquet-scalar")
          + " — equal to the ON values above: SuperWord makes no difference, so the per-width "
          "routine is genuinely scalar, not autovectorized.")
         if any(d == "parquet-scalar" for (_, d) in perf_off) else ""),
        "- Bands are reproduction tolerances, not exact-number asserts; precise numbers are "
        "Zen-4-specific. The `w26` kernel-switch edge is 512-bit-species-specific (on a 256-bit "
        "host widths 26-32 fall to scalar fallback). See `RESULTS.md`.",
        "",
    ]
    return "\n".join(parts)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--run-dir", required=True)
    ap.add_argument("--report", required=True)
    args = ap.parse_args()

    env = read_env(args.run_dir)
    on = index_thrpt(load(os.path.join(args.run_dir, "thrpt-on.json")))
    # scalar-widen runs in a separate invocation (its only valid widths are 8/16),
    # so merge it back into the ON map. Old runs with widen in thrpt-on.json still
    # work (the extra file is simply absent).
    on.update(index_thrpt(load(os.path.join(args.run_dir, "thrpt-on-widen.json"))))
    off = index_thrpt(load(os.path.join(args.run_dir, "thrpt-off.json")))
    perf = {}
    perf.update(index_perf(load(os.path.join(args.run_dir, "perfnorm-main.json"))))
    perf.update(index_perf(load(os.path.join(args.run_dir, "perfnorm-w8.json"))))
    perf_off = index_perf(load(os.path.join(args.run_dir, "perfnorm-w8-off.json")))
    perf_off.update(index_perf(load(os.path.join(args.run_dir, "perfnorm-parquet-off.json"))))

    if not on:
        sys.stderr.write("ERROR: no throughput data in thrpt-on.json — cannot verify.\n")
        with open(args.report, "w") as f:
            f.write("# decode-shape report\n\nNo throughput data was produced; the run failed.\n")
        return 1

    c = Checks()
    run_checks(on, off, perf, perf_off, c)
    run_asm_checks(os.path.join(args.run_dir, "asm"), env.get("env_tuned") == "1", c)

    with open(args.report, "w") as f:
        f.write(render(env, on, off, perf, perf_off, c))

    # console summary
    for name, status, detail in c.rows:
        print(f"  [{status:4}] {name} — {detail}")
    print(f"\n  {sum(1 for _,s,_ in c.rows if s=='PASS')} pass, "
          f"{c.n_fail} fail, "
          f"{sum(1 for _,s,_ in c.rows if s=='WARN')} warn, "
          f"{sum(1 for _,s,_ in c.rows if s=='SKIP')} skip")
    return 1 if c.n_fail else 0


if __name__ == "__main__":
    sys.exit(main())
