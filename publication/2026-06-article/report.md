# decode-shape — reproduction report

- **Run:** `2026-05-30_182642`  |  profile: `publication` (forks=3, warmup=5x3s, measure=10x1s)
- **Grade:** publication-grade (3 forks, long warmup)
- **Host:** terra  |  CPU: AMD Ryzen 9 7950X3D 16-Core Processor
- **Kernel:** 6.17.0-35-generic  |  governor at run: `performance`  |  perf_event_paranoid: `0`  |  env tuned: `1`
- **JDK:** openjdk version 25.0.3 2026-04-21
- **Repo:** commit `14c6b5b` on `main` (working tree dirty: `no`)

## Verdict

All checks reproduced (some skipped/with caveats: perfnorm or off-run data missing).

## Checks

| check | status | detail |
|---|---|---|
| Substrate is free (byte[] vs MemorySegment) | PASS | max rel. diff 0.2% (width 26); expected within noise |
| Vector >> generic scalar (w13) | PASS | vector/generic = 4.74x (expected ~4.8x) |
| Kernel-switch step at w26 | PASS | vector w25/w26 = 1.40x (expected ~1.45x) |
| Parquet scalar specialization backfires (wide widths) | PASS | w17: parquet 1277 vs generic 1992; w25: parquet 1004 vs generic 1992 (parquet should be < generic) |
| SuperWord changes scalar-widen at w8, not the generic scalar | PASS | widen ON 5961 / OFF 7495 (SuperWord ON is a regression here); generic ON 1994 / OFF 1998 (flat) |
| Vector path is genuinely SIMD (insns/value) | PASS | vector w13 = 1.57 insns/value (expected ~1.57) |
| Generic scalar is genuinely scalar (insns/value) | PASS | scalar-array w5 = 15.26 insns/value (expected ~15.2) |
| scalar-widen w8 is lean scalar, not SIMD (insns/value) | PASS | scalar-widen w8 = 3.01 insns/value (expected ~3.0); lean, but Run 4 shows it is scalar, not auto-vectorized |
| Vector kernel-switch costs instructions (w26) | PASS | vector w26 2.88 vs w13 1.57 insns/value (expected ~2.88 vs ~1.57) |
| Parquet scalar is NOT autovectorized (insns/value) | PASS | parquet w5 8.26 -> w26 22.79 insns/value (scalar range 8-23, growing with width) |
| Parquet scalar insns unchanged ON vs OFF (confirms not autovectorized) | PASS | w5 ON 8.26/OFF 8.20; w9 ON 11.05/OFF 11.05; w13 ON 13.90/OFF 13.89; w17 ON 18.35/OFF 18.29; w26 ON 22.79/OFF 22.78 (max |delta| 0.06; SuperWord makes no difference) |
| SuperWord gives no instruction reduction for scalar-widen at w16 (unlike w8) | PASS | w16 scalar-widen ON 6.38/OFF 6.53 (|delta| 0.14); SuperWord does not reduce the count at w16, unlike w8 (2.64 off, 3.01 on). Byte-alignment alone does not yield a baseline as lean as w8. |
| Widening loops emit no SIMD widening (no vpmovzx*) at w8/w16, SuperWord on/off | skip | no disassembly in run-dir/asm (hsdis missing or Run 4 skipped) |
| SuperWord adds GPR-XMM transfers to the width-8 hot loop (code-shape change) | skip | no disassembly in run-dir/asm (hsdis missing or Run 4 skipped) |
| XMM-transfer cycle cost is asymmetric: dominant at w8, minor at w16 | skip | no perfasm output in run-dir/asm |

## Throughput (values/µs, higher is better) — SuperWord ON

| width | scalar-array | scalar-segment | scalar-widen | parquet-scalar | vector-segment |
|------:|------:|------:|------:|------:|------:|
| 5 | 1992 | 1995 | - | 3037 | 9485 |
| 8 | 1994 | 1990 | 5961 | 4887 | 9889 |
| 9 | 1992 | 1997 | - | 2308 | 9457 |
| 13 | 1993 | 1996 | - | 1915 | 9453 |
| 16 | 1991 | 1994 | 3800 | 2609 | 10079 |
| 17 | 1992 | 1996 | - | 1277 | 9177 |
| 24 | 1995 | 1992 | - | 1293 | 9962 |
| 25 | 1992 | 1992 | - | 1004 | 9302 |
| 26 | 1990 | 1995 | - | 1008 | 6652 |
| 32 | 1995 | 1996 | - | 1173 | 6794 |

## Mechanism — perfnorm (instructions/value; ~15 scalar, ~3 lean scalar, ~1.6 SIMD)

| width | scalar-array | scalar-widen | parquet-scalar | vector-segment |
|------:|------:|------:|------:|------:|
| 5 | 15.26 | - | 8.26 | 1.57 |
| 8 | 15.21 | 3.01 | - | 1.57 |
| 9 | 15.21 | - | 11.05 | 1.57 |
| 13 | 15.17 | - | 13.90 | 1.57 |
| 16 | - | 6.38 | - | - |
| 17 | 15.21 | - | 18.35 | 1.57 |
| 25 | 15.22 | - | 23.05 | 1.57 |
| 26 | 15.22 | - | 22.79 | 2.88 |

## Notes

- `parquet-scalar` runs on a `byte[]` substrate (Parquet's real `unpack8Values`); read its *instructions/value* and its *shape across widths*, not its absolute throughput against the `MemorySegment` rows.
- `scalar-widen` only applies to byte-aligned widths 8/16; it is absent (`-`) elsewhere.
- `scalar-widen` SuperWord OFF (insns/value): w8 2.64, w16 6.53 — vs the ON values above; the OFF speedup at the counter level.
- `parquet-scalar` SuperWord OFF (insns/value): w5 8.20, w9 11.05, w13 13.89, w17 18.29, w26 22.78 — equal to the ON values above: SuperWord makes no difference, so the per-width routine is genuinely scalar, not autovectorized.
- Bands are reproduction tolerances, not exact-number asserts; precise numbers are Zen-4-specific. The `w26` kernel-switch edge is 512-bit-species-specific (on a 256-bit host widths 26-32 fall to scalar fallback). See `RESULTS.md`.
