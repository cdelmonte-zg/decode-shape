# Claude Code Brief — `decode-shape`

*(Provisional repo name — rename freely. This is a benchmark lab, not a published library, so no API-stability obligations.)*

## What this is

An experimental Java project that decodes columnar **integer** encodings out of off-heap memory, with three interchangeable decoder implementations per encoding, benchmarked against each other. The goal is **not** a fast decoder library. The goal is to measure **where the encoded→decoded boundary is SIMD-friendly and where it resists vectorization, and why** (bit width alignment, widening/narrowing, lane-crossing, tail handling, gather cost, quality of C2 lowering).

The two JVM features under study are:
- **FFM / `MemorySegment`** (finalized in JDK 22) — used for the off-heap data path only.
- **Vector API** (`jdk.incubator.vector`, incubator) — used for the explicit-SIMD decode path.

## Hard non-goals (do not do these)

1. **No FFM downcalls to native libraries.** The tool's use of FFM is the *memory* half (`MemorySegment`), never the *function* half. Do not add `jextract`, native bindings, or links to SVML/SLEEF/zstd/etc. (That topic belongs to the article, not the code.)
2. **No real Parquet file reading until Phase 4.** Phases 1–3 use synthetic, seeded input.
3. **Do not pick only the "easy" bit widths.** The irregular widths are the subject, not a problem to route around.
4. **Do not present results as "scalar vs SIMD"** when the scalar baseline is auto-vectorized by C2. See methodology.

## Stack & environment

- **Build:** Maven.
- **JDK:** Pin **JDK 25** as the primary target via Maven toolchains + maven-enforcer. Record the exact vendor/build (e.g. Temurin 25.0.x) in `RESULTS.md`. *(JDK 25 is the current LTS — released Sept 2025, the first LTS after JDK 21; the LTS cadence is now every two years, 21 → 25 → 29. Do not let this be "corrected" to a feature release — the old three-year 17→21→25 cadence no longer holds.)* JDK 25 already contains the data-path change this lab relies on: JEP 508, `VectorShuffle` ↔ `MemorySegment` access. Add an optional profile to re-run on **JDK 26** as a robustness check — *whether C2 SuperWord behavior differs across JDKs is itself a reportable finding*.
- **Vector module:** compile and run with `--add-modules=jdk.incubator.vector`. Configure this in the compiler plugin AND in the JMH fork args (`@Fork(jvmArgsAppend = {"--add-modules=jdk.incubator.vector"})`). FFM needs no flags (final since 22).
- **Bench framework:** JMH (jmh-core + jmh-generator-annprocess), mandatory. No hand-rolled timing.
- **Vector width:** use `IntVector.SPECIES_PREFERRED` (and the relevant typed species for widening paths). Log `SPECIES_PREFERRED.vectorBitSize()` and the detected ISA (AVX2/AVX-512/NEON) into `RESULTS.md` so numbers are interpretable per machine.

## Correctness harness — build this BEFORE any benchmark

- Round-trip tests: encode → decode, assert decoded == original, for every bit width and every encoding.
- Cross-validation: assert the three decoder implementations (scalar `int[]`, scalar `MemorySegment`, Vector-API `MemorySegment`) produce **identical** output for every case.
- **Tail edge cases are mandatory and are where bugs live**: input lengths that are not multiples of the vector lane count, and bit widths not byte-aligned. Test lengths around the boundaries (lane_count ± 1, and small N like 0,1,7).
- Seeded RNG for all synthetic data (reproducibility).

## Phases (deliver in order)

### Phase 1 — Bit-packed unsigned fixed-width integers
- Widths: **8, 16** (regular / lane-friendly control) **+ 5, 9, 13, 17** (irregular).
- Synthetic input only.
- **Layout is fixed, not arbitrary:** Parquet-style bit packing — values packed consecutively, least-significant-bit first, little-endian within the byte stream, no padding between values (padding only at the final byte). Document the exact layout in a comment and in `README.md`. This determinism is what makes Phase 4's comparison against real Parquet pages possible without rewriting the encoders.
- Three decoders per width: (1) idiomatic scalar over `int[]`/`byte[]`, (2) scalar over `MemorySegment`, (3) Vector API over `MemorySegment`.
- **Uniform output in Phase 1:** all three decoders write into a preallocated `int[]`. This isolates *decode* cost from *output-representation* cost — measuring decode + a representation change in the output would contaminate the exact variable the project studies. A `MemorySegment`-output variant is a *separate, later* benchmark, not part of the Phase 1 comparison.
- Diagnostic view (4): assembly/profiling verification on at least one case per width class — see methodology.

### Phase 2 — RLE + bit-packed hybrid
- Model Parquet's RLE/bit-packing hybrid layout. Still synthetic, no full Parquet files.
- Same three-decoder structure.

### Phase 3 — Dictionary decode
- Split into two separate benchmarks: (a) decode of the (bit-packed) indices, (b) value lookup / gather.
- Treat gather as an **open question, not an assumed win** — x64 gather is often barely better than scalar loads. Vary dictionary size: small/cache-resident vs large/cache-spilling. A "SIMD does not help here" result is a valid, expected finding.

### Phase 4 — Real Parquet comparison (only after 1–3)
- Compare against real Parquet pages / `parquet-java`. Not before.

## Benchmark methodology (make-or-break — enforce strictly)

- **Consume all output**: `Blackhole.consume(...)` or returned values. A decode loop whose output is unused will be deleted by C2 (you'll measure nothing).
- **Preallocate** output buffers outside the measured loop; no allocation in the hot path.
- `@Fork(value >= 3)`, explicit `@Warmup`/`@Measurement`, `@BenchmarkMode({Throughput, AverageTime})`.
- **Auto-vectorization discipline.** The "scalar" baseline may already be auto-vectorized by C2 SuperWord. Therefore:
  - Add a diagnostic JMH run with `-XX:-UseSuperWord` to isolate *true-scalar* from *autovectorized-scalar*.
  - Verify the actual emitted instructions with `-prof perfasm` (needs hsdis; if unavailable fall back to `-prof asm` or `-XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly`). Confirm SIMD instructions are really present rather than trusting the throughput number.
  - **Frame the headline comparison honestly** as: *C2-autovectorized scalar Java vs explicit Vector API vs MemorySegment access pattern* — not "scalar vs SIMD."
- Capture environment into `RESULTS.md`: JDK build, CPU model, detected vector ISA + width, whether turbo/frequency-scaling was controlled (report variance if not).
- Emit results as **CSV + JSON** (for charting in the article).

## Definition of done

- Maven project, JDK 25 pinned (toolchains + enforcer), `--add-modules` wired in compile + JMH fork.
- `src/main/java`: encoders (test-data generation) + the three decoders per encoding.
- `src/test/java`: correctness + cross-validation + tail edge-case tests.
- JMH benchmarks for Phases 1–3 (Phase 4 optional, gated).
- `RESULTS.md`: exact run commands, environment capture, CSV/JSON results.
- `README.md`: how to build/run, required flags, and a one-paragraph statement of the lab's purpose.

## After the skeleton exists

Once the harness compiles, the most valuable review pass is on the **benchmark code specifically** — auto-vectorization leakage and dead-code elimination — not on more design. Flag the harness for that focused review before trusting any numbers.
