# decode-shape

A benchmark lab on Parquet-style integer bit-unpacking on the JVM: where
explicit vectorization with the Vector API earns its place, and where C2
already produces machine code good enough that it does not. JDK 25, the
Vector API over `MemorySegment`, measured on one host under a pinned
governor and confirmed with hardware counters. It is not a decoder library.

Five decoders of the same fixed layout (LSB-first, little-endian, 8 values
of width *w* in *w* bytes; contract in `BitPackLE`), all writing into a
preallocated `int[]`:

| Decoder | What it is |
|---|---|
| `scalar-array` | generic scalar Java over a heap `byte[]`: word load, shift, mask |
| `scalar-segment` | the same scalar algorithm over an off-heap `MemorySegment` |
| `scalar-widen` | regular byte-aligned widening loop, widths 8 and 16 only: the lean scalar reference |
| `parquet-scalar` | `parquet-java`'s own per-width `unpack8Values`, as an external anchor |
| `vector-segment` | one parametric SIMD kernel (load, byte permute, per-lane shift, mask) for widths up to 25, a 64-bit-lane path above |

Widths measured: 8 and 16 as lane-friendly controls, 5, 9, 13, 17 as
irregular widths, 24 and 25 at the int-lane ceiling, 26 just past it, 32.

## What it found

- The encoded-to-decoded boundary does not resist vectorization: one kernel
  handles every width from 5 to 25 at a flat instruction count per value.
  The pre-registered hypothesis that irregular widths resist was falsified.
- The large SIMD advantage is mostly a baseline artifact. Against the
  widening loop it shrinks; what moves across widths is the scalar floor,
  not the vector kernel.
- The widening loop stays scalar on this JDK: SuperWord builds the packs
  and rejects them at the element-size check. Disassembly and a SuperWord
  trace settled that after publication, see
  `publication/2026-06-article/followup-superword-widen-disasm.md`.
- Parquet's per-width scalar specialization is slower than the generic
  scalar at some wide irregular widths.

Method, pre-registration, stopping rule and every number are in
`RESULTS.md`; the citable run is `publication/2026-06-article/`. The
figures hold for this host, JDK build and ISA only.

## Requirements

JDK 25 and Maven 3.8+ with a JDK 25 toolchain entry in
`~/.m2/toolchains.xml` (the build targets 25 whatever JVM launches Maven):

```xml
<toolchains>
  <toolchain>
    <type>jdk</type>
    <provides><version>25</version><vendor>openjdk</vendor></provides>
    <configuration><jdkHome>/usr/lib/jvm/java-25-openjdk-amd64</jdkHome></configuration>
  </toolchain>
</toolchains>
```

`--add-modules=jdk.incubator.vector` is wired into the compiler, the test
JVM and the JMH forks by the `pom.xml`.

```bash
mvn test      # round-trip, cross-validation of the decoders, tail edges
mvn package   # also builds target/benchmarks.jar
```

## Reproduce

```bash
./run_lab.sh                # build, tune, measure, verify, report, restore (~15-20 min)
./run_lab.sh --quick        # 1 fork, smoke
./run_lab.sh --full         # 3 forks, 5 warmup + 5 measure
./run_lab.sh --publication  # 3 forks, 5x3s warmup + 10x1s measure, counters with SuperWord off
./run_lab.sh --no-env       # leave governor and perf alone (no sudo); counter checks skipped
./run_lab.sh --pin 0-7      # pin the forks to one CPU list
```

Run it as your normal user: it escalates with `sudo` only to pin the
governor and unlock the perf counters, through `bench-system.sh`, and
restores the previous state on exit, including on Ctrl-C. It writes
`reports/decode-shape-report-<date>.md` with a PASS/FAIL line per
pre-registered finding and `reports/run-<date>/` with the raw JMH output.
Exit code 0 means every check reproduced. `bench-system.sh setup|restore|status`
does the machine-state part on its own.

Single cases by hand:

```bash
JDK25=/usr/lib/jvm/java-25-openjdk-amd64/bin/java
$JDK25 --add-modules=jdk.incubator.vector -jar target/benchmarks.jar \
    Phase1UnpackBench -p bitWidth=13 -f 1 -wi 3 -i 5
# the same with -jvmArgs "-XX:-UseSuperWord" separates true scalar from auto-vectorized scalar;
# -prof perfnorm gives instructions per value and needs only perf, not hsdis
```

## Disassembly

`-prof perfasm` and `PrintAssembly` need an hsdis that exports
`decode_instructions_virtual`; the packaged `libhsdis0-fcml` exports the old
symbol and degrades to a byte dump. `hsdis-build/build-hsdis.sh` builds one
on the capstone backend from the JDK sources (needs `libcapstone-dev` and
`git`), and `run_lab.sh` builds and uses it when those are present. Capstone
4.0.2, the version Ubuntu 24.04 ships, leaves an AVX-512 instruction whose
base and index registers are both in `r8` to `r15` as `.byte 0x62` followed
by nonsense; capstone 5 and the LLVM backend decode it. Instruction counters
from `-prof perfnorm` do not depend on the decoder.

## Figures

`make_figures.py` turns a run's JSON into the three SVG charts. It needs
matplotlib, so give it a venv:

```bash
python3 -m venv .venv && . .venv/bin/activate && pip install matplotlib
python make_figures.py reports/run-<stamp> <out-dir>
```

## Non-goals

No FFM downcalls to native libraries: the FFM use here is the memory half
only. No real Parquet reading. No routing around irregular widths, they are
the subject. No "scalar vs SIMD" framing when the scalar baseline is
auto-vectorized.
