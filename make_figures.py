#!/usr/bin/env python3
"""
Generate the three figures for "Unpacking Parquet" as SVGs, straight from
the decode-shape publication run JSON, using matplotlib.

Numeric data points are read from the run JSON. A few annotation labels are
editorial and tied to this publication run: the per-regime gap ranges in
Figure 2 ("gap 1.3-1.65x" etc., which span the default-vs-fastest scalar
configurations) and the flatness note. Regenerating against a different run
updates the plotted points but not those hand-set labels.

    # one-time:  python3 -m venv .venv && . .venv/bin/activate && pip install matplotlib
    python make_figures.py <run-dir> [out-dir]

<run-dir>  a reports/run-<stamp>/ directory (publication-grade run, commit 14c6b5b)
out-dir    where to write the SVGs (default: ./images)

English labels; decimals use a period (the figures' own convention).
"""
import json
import os
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

# ---- palette -----------------------------------------------------------------
C_VECTOR = "#2563eb"   # explicit Vector
C_NAIVE  = "#6b7280"   # naive scalar
C_PARQ   = "#ea580c"   # parquet per-width
C_FLOOR  = "#0f766e"   # best autovectorizable scalar floor
C_MUTED  = "#6b7280"

plt.rcParams.update({
    "font.family": "sans-serif",
    "font.sans-serif": ["DejaVu Sans"],
    "font.size": 11,
    "axes.titlesize": 13.5,
    "axes.titleweight": "600",
    "axes.labelsize": 11,
    "axes.edgecolor": "#374151",
    "axes.linewidth": 1.0,
    "svg.fonttype": "path",
    "figure.dpi": 100,
})


def style(ax):
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.grid(axis="y", color="#e5e7eb", linewidth=1, zorder=0)
    ax.set_axisbelow(True)


# ---- data loading ------------------------------------------------------------
def load(run_dir, name):
    p = os.path.join(run_dir, name)
    if not os.path.exists(p):
        return []
    with open(p) as f:
        return json.load(f)


def thrpt(records):
    d = {}
    for r in records:
        if r.get("mode") != "thrpt":
            continue
        p = r.get("params", {})
        if "bitWidth" in p and "decoder" in p:
            d[(int(p["bitWidth"]), p["decoder"])] = r["primaryMetric"]["score"]
    return d


def thrpt_err(records):
    d = {}
    for r in records:
        if r.get("mode") != "thrpt":
            continue
        p = r.get("params", {})
        if "bitWidth" in p and "decoder" in p:
            e = r["primaryMetric"].get("scoreError", 0)
            d[(int(p["bitWidth"]), p["decoder"])] = 0.0 if e != e else (e or 0.0)  # NaN -> 0
    return d


def insns(records):
    d = {}
    for r in records:
        p = r.get("params", {})
        sm = r.get("secondaryMetrics", {}) or {}
        if "bitWidth" in p and "decoder" in p and "instructions" in sm:
            d[(int(p["bitWidth"]), p["decoder"])] = sm["instructions"]["score"]
    return d


def save(fig, out_dir, name):
    os.makedirs(out_dir, exist_ok=True)
    p = os.path.join(out_dir, name)
    fig.savefig(p, format="svg", bbox_inches="tight")
    plt.close(fig)
    print("wrote", p)


# =============================================================================
# Figure 1 — instructions per value (the mechanism)
# =============================================================================
def figure1(perf, out):
    widths = [5, 9, 13, 17, 25, 26]
    fig, ax = plt.subplots(figsize=(8.2, 4.7))
    style(ax)
    parq = [perf[(w, "parquet-scalar")] for w in widths]
    naive = [perf[(w, "scalar-array")] for w in widths]
    vec = [perf[(w, "vector-segment")] for w in widths]

    ax.plot(widths, parq, "-o", color=C_PARQ, lw=2.4, ms=6, label="parquet (specialized)", zorder=3)
    ax.plot(widths, naive, "-o", color=C_NAIVE, lw=2.4, ms=6, label="generic (scalar)", zorder=3)
    ax.plot(widths, vec, "-o", color=C_VECTOR, lw=2.4, ms=6, label="vector (explicit)", zorder=3)

    ax.annotate(f"{parq[-1]:.2f}", (widths[-1], parq[-1]), xytext=(6, 2),
                textcoords="offset points", color=C_PARQ, fontsize=10, weight="600")
    ax.annotate(f"flat {naive[2]:.1f}", (13, naive[2]), xytext=(0, 8),
                textcoords="offset points", color=C_NAIVE, fontsize=10, ha="center")
    ax.annotate(f"{vec[1]:.2f} through w25", (9, vec[1]), xytext=(0, -16),
                textcoords="offset points", color=C_VECTOR, fontsize=10, ha="center")
    ax.annotate(f"{vec[-1]:.2f}", (26, vec[-1]), xytext=(6, -2),
                textcoords="offset points", color=C_VECTOR, fontsize=10, weight="600")

    ax.set_title("Instructions per value: the vector is flat, Parquet's scalar grows")
    ax.set_xlabel("bit width")
    ax.set_ylabel("instructions / value")
    ax.set_xticks(widths)
    ax.set_xticklabels([f"w{w}" for w in widths])
    ax.set_ylim(0, 25)
    ax.legend(frameon=False, loc="center left", fontsize=10.5)
    save(fig, out, "fig2-insns-per-value.svg")  # file number = editorial order in the article (backfire=1, insns=2, floor=3)


# =============================================================================
# Figure 2 — the scalar floor descends by degrees; the vector stays flat
# =============================================================================
def figure2(on, off, err, out):
    # exemplar widths: two aligned (w8, w16) and one irregular (w13, the text's
    # headline example). The irregular bar uses w13 so its clearance is exactly the
    # 4.7x cited in the body (9453/1993), not w17's 4.6x.
    regimes = ["w8\n(aligned)", "w16\n(aligned)", "w13\n(irregular)"]
    kv = [(8, "vector-segment"), (16, "vector-segment"), (13, "vector-segment")]
    kf = [(8, "scalar-widen"), (16, "scalar-widen"), (13, "scalar-array")]
    vec = [on[k] for k in kv]
    flo = [off[k] if k in off else on[k] for k in kf]
    vece = [err.get(k, 0.0) for k in kv]
    floe = [err.get(k, 0.0) for k in kf]
    # each gap is computed against a different scalar baseline; name it so the
    # bars are not mistaken for one continuous "vector vs scalar" ratio.
    ratios = ["gap 1.3-1.65×\n(vs widening scalar)",
              "gap 2.4-2.65×\n(vs widening scalar)",
              "gap 4.7×\n(vs generic scalar)"]

    fig, ax = plt.subplots(figsize=(8.2, 4.9))
    style(ax)
    x = np.arange(len(regimes))
    bw = 0.36
    ekw = {"elinewidth": 1.1, "capthick": 1.1}
    ax.bar(x - bw / 2, vec, bw, yerr=vece, capsize=3, color=C_VECTOR,
           ecolor="#1e3a8a", error_kw=ekw, label="vector (explicit)", zorder=3)
    ax.bar(x + bw / 2, flo, bw, yerr=floe, capsize=3, color=C_FLOOR,
           ecolor="#134e4a", error_kw=ekw, label="scalar baseline (per regime)", zorder=3)

    for xi, v, e in zip(x - bw / 2, vec, vece):
        ax.annotate(f"{v:.0f}", (xi, v + e), xytext=(0, 3), textcoords="offset points",
                    ha="center", fontsize=10, color=C_VECTOR, weight="600")
    for xi, v, e in zip(x + bw / 2, flo, floe):
        ax.annotate(f"{v:.0f}", (xi, v + e), xytext=(0, 3), textcoords="offset points",
                    ha="center", fontsize=10, color=C_FLOOR, weight="600")
    for xi, v, e, r in zip(x, vec, vece, ratios):
        ax.annotate(r, (xi, v + e), xytext=(0, 20), textcoords="offset points",
                    ha="center", fontsize=10.5, weight="700", color="#111827")

    ax.set_title("The scalar slows by degrees; the vector stays flat")
    ax.set_ylabel("throughput (values/µs)")
    ax.set_xticks(x)
    ax.set_xticklabels(regimes)
    ax.set_ylim(0, max(vec) * 1.38)
    ax.legend(frameon=False, loc="upper center", bbox_to_anchor=(0.5, -0.20),
              ncol=2, fontsize=10.5)
    fig.text(0.5, -0.05,
             "The blue bars vary within run noise (w16 ±550): the vector's flatness is "
             "in instructions/value (1.57), not in absolute throughput.",
             ha="center", fontsize=9.5, color=C_MUTED)
    save(fig, out, "fig3-scalar-floor.svg")


# =============================================================================
# Figure 3 — Parquet's per-width specialization falls below the naive scalar
# =============================================================================
def figure3(on, out):
    widths = [5, 8, 9, 13, 16, 17, 24, 25, 26, 32]
    parq = [on[(w, "parquet-scalar")] for w in widths]
    naive = sum(on[(w, "scalar-array")] for w in widths) / len(widths)

    fig, ax = plt.subplots(figsize=(8.2, 4.7))
    style(ax)
    ax.axhline(naive, ls="--", color=C_NAIVE, lw=2, zorder=2,
               label=f"generic scalar (flat ~{int(naive)})")
    ax.plot(widths, parq, "-o", color=C_PARQ, lw=2.4, ms=6,
            label="parquet (specialized)", zorder=3)
    ax.fill_between(widths, parq, naive, where=[p < naive for p in parq],
                    color=C_PARQ, alpha=0.12, interpolate=True, zorder=1)

    ax.annotate(f"w8: {parq[1]:.0f}", (8, parq[1]), xytext=(0, 8),
                textcoords="offset points", ha="center", color=C_PARQ, fontsize=10, weight="600")
    for w in (17, 25):
        v = parq[widths.index(w)]
        ax.annotate(f"w{w}: {v:.0f}", (w, v), xytext=(0, -16), textcoords="offset points",
                    ha="center", color=C_PARQ, fontsize=10, weight="600")

    ax.set_title("The backfire: Parquet's specialized scalar drops below the generic scalar")
    ax.set_xlabel("bit width")
    ax.set_ylabel("throughput (values/µs)")
    ax.set_xticks(widths)
    ax.set_ylim(0, 5200)
    ax.legend(frameon=False, loc="upper right", fontsize=10.5)
    fig.text(0.5, -0.02,
             "Pays off at the small, aligned widths (w8, w16); at the wide, irregular widths "
             "it does more work per value and, not vectorized, drops below the generic scalar.",
             ha="center", fontsize=10, color=C_MUTED)
    save(fig, out, "fig1-parquet-backfire.svg")


def main():
    if len(sys.argv) < 2:
        sys.exit("usage: make_figures.py <run-dir> [out-dir]")
    run_dir = sys.argv[1]
    out_dir = sys.argv[2] if len(sys.argv) > 2 else "images"
    on = thrpt(load(run_dir, "thrpt-on.json"))
    on.update(thrpt(load(run_dir, "thrpt-on-widen.json")))
    off = thrpt(load(run_dir, "thrpt-off.json"))
    err = thrpt_err(load(run_dir, "thrpt-on.json"))
    err.update(thrpt_err(load(run_dir, "thrpt-on-widen.json")))
    err.update(thrpt_err(load(run_dir, "thrpt-off.json")))
    perf = insns(load(run_dir, "perfnorm-main.json"))
    perf.update(insns(load(run_dir, "perfnorm-w8.json")))
    figure1(perf, out_dir)
    figure2(on, off, err, out_dir)
    figure3(on, out_dir)


if __name__ == "__main__":
    main()
