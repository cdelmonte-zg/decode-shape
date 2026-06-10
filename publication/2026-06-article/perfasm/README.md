# Cycle attribution: width-8/16 widening loop, SuperWord ON vs OFF

JMH `-prof perfasm` output (sampled retired cycles per instruction) for `scalar-widen`
on the publication host (7950X3D, OpenJDK 25.0.3), the Level-2 complement to the static
disassembly in [`../asm/`](../asm/) and the finding in
[`../followup-superword-widen-disasm.md`](../followup-superword-widen-disasm.md).

Collected with the same JDK 25-compatible hsdis plugin (`hsdis-build/build-hsdis.sh`) and
`bench-system.sh setup` (governor `performance`, `perf_event_paranoid=0`). Short single-fork
profiling runs (`-f 1 -wi 3 -i 3 -w 1 -r 1`), so the throughput figures here carry more noise
than the 3-fork publication run; they are used for the cycle distribution, not as the
throughput of record.

Reproduce:

```bash
LD_LIBRARY_PATH=hsdis-build/lib \
  $JDK25/bin/java -jar target/benchmarks.jar Phase1UnpackBench.decode \
  -p decoder=scalar-widen -p bitWidth=8 -bm thrpt -f 1 -wi 3 -i 3 -w 1 -r 1 \
  -prof perfasm [-jvmArgs -XX:-UseSuperWord]
```

## Result

| file | width | SuperWord | thrpt (this run) | cycles on `vmovd` (GPR-XMM round trips) |
|------|------:|-----------|-----------------:|----------------------------------------:|
| `perfasm-widen8-on.txt`   |  8 | ON (default) | ~5,859 ops/µs | **~31%** |
| `perfasm-widen8-off.txt`  |  8 | OFF          | ~7,415 ops/µs | none (0 `vmovd` in the hot loop) |
| `perfasm-widen16-on.txt`  | 16 | ON (default) | ~3,781 ops/µs | **~4.8%** |
| `perfasm-widen16-off.txt` | 16 | OFF          | ~4,098 ops/µs | none |

- **Width 8:** roughly a third of the hot-loop cycles fall on the `vmovd` GPR-XMM round trips,
  which are entirely absent from the SuperWord-disabled loop. This is the measured mechanism of
  the width-8 regression.
- **Width 16:** the round trips carry only ~4.8% of cycles. Most cycles fall on the scalar
  value-assembly work (`or` ~40%, `movzbl` ~25%, `shl` ~15%) that reconstructs each 16-bit value.
  The (small, noisy) width-16 throughput difference is therefore **not** attributable to the
  transfers — the width-8 explanation does not carry over.

Cycle attribution from sampling is approximate on out-of-order hardware (sample skid). The
qualitative conclusions are robust because the round-trip instructions are simply absent from
the faster (SuperWord-OFF) configurations.
