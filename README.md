# decode-shape

A benchmark lab measuring **where explicit vectorization of columnar integer
bit-unpacking earns its place — and where the compiler already does the job for
you.** JDK 25, the Vector API, the `MemorySegment` substrate. It is **not** a
fast-decoder library and has no API-stability obligations.

It is not greenfield: `parquet-java` already ships a vectorized bit-unpacker
(PARQUET-2159 — see `RESULTS.md`, Phase 0), so the contribution is not speed and
not "it can be vectorized." It is the **measured** answer, on a pinned governor and
confirmed by hardware counters (`perfnorm`):

- The encoded→decoded boundary does **not** resist vectorization. A single
  parametric Vector kernel handles every width 5–25 flat (~1.57 instructions/value).
  The "irregular widths resist vectorization" hypothesis was pre-registered, tested,
  and **falsified**.
- The "5× SIMD win" is largely a **baseline artifact**. Against the regular
  width-8 widening loop the advantage is ~1.3-1.65×; width 16 is byte-aligned but
  produces a less efficient scalar floor, leaving ~2.4-2.65×. The Vector
  kernel is flat, and it is the *scalar floor beneath it* that falls away at the
  irregular widths, where the compiler can't reach. And "aligned" is not binary:
  enabling SuperWord gives **no** instruction reduction at w16 (6.53 off, 6.38 on),
  unlike w8 — so byte-alignment alone does not buy a baseline as lean as w8 (a
  verified check; disassembly later confirmed the w16 loop also stays scalar, with no SIMD widening).
- Explicit Vector earns its place where C2 cannot produce sufficiently efficient
  scalar machine code — chiefly the irregular widths — and **Parquet's own per-width scalar specialization backfires
  at some wide, irregular widths**: its generated `unpack8Values` is *slower than
  the generic scalar* at w17 and w25 (at the narrow widths w5/w9 it is still
  faster). Its instruction count is unchanged with SuperWord off, with no
  measurable autovectorization benefit — a verified check.

Full method, pre-registration, stopping rule, and honest scope (one host) are in
`RESULTS.md`.

## What it builds

Decoders for a fixed Parquet-style bit-packed layout, all writing into a
preallocated `int[]` (so decode cost is isolated from output-representation cost):

1. **`scalar-array`** — idiomatic scalar Java over a heap `byte[]`: one little-endian
   word load, shift, mask per value. The generic baseline.
2. **`scalar-segment`** — the *same* scalar algorithm over an off-heap
   `MemorySegment`. Differs from (1) only by substrate — which turns out to be free
   in cache (a reported finding, not a lever).
3. **`scalar-widen`** — a regular byte-aligned widening reference that gives C2 an
   almost ideal loop shape. On the measured host and JDK, SuperWord recognizes and
   packs the parallel work but does not emit SIMD widening; the machine code remains
   scalar. The *fair* baseline.
4. **`parquet-scalar`** — Parquet's **real** `unpack8Values` (its shipped per-width
   specialization), wired in as an external anchor across all widths (`byte[]`
   substrate — reported on a separate, labelled axis).
5. **`vector-segment`** — explicit SIMD over a `MemorySegment`: a single parametric
   load → byte-permute → per-lane variable shift → mask kernel for widths ≤25,
   switching to a 64-bit-lane path at w>25. See `VectorSegmentDecoder`.

## Layout (fixed)

Parquet-style LSB-first, little-endian, no inter-value padding (only the final
byte is padded). 8 values of width *w* occupy exactly *w* bytes. See
`BitPackLE` for the exact contract, including the documented trailing-pad
convenience that lets all three decoders use a uniform full-word load.

Phase 1 widths: **8, 16** (lane-friendly control) **+ 5, 9, 13, 17** (irregular),
extended to **24, 25** (the int-lane ceiling), **26** (first width past it — forces
the 64-bit-lane kernel), and **32** (the full int).

## Requirements

- **JDK 25** (LTS). Pinned via Maven toolchains + enforcer. Maven compiles with the
  JDK 25 toolchain *even if Maven itself runs on a different (older) JVM* — so you do
  not have to make 25 your default `java`. The exact `~/.m2/toolchains.xml` block is
  in the [System setup](#system-setup--required-to-build--run-the-tests) section.
- The Vector API is an incubator module: `--add-modules=jdk.incubator.vector` is
  wired into the compiler, the surefire test JVM, and the JMH forks.
- Maven 3.8+.
- **Optional — machine-code shape stage (Run 4 of `run_lab.sh`):** `libcapstone-dev`,
  `git`, and network access. `run_lab.sh` builds a JDK 25-compatible hsdis
  disassembler from OpenJDK sources via `hsdis-build/build-hsdis.sh` (the packaged
  `libhsdis0-fcml` is ABI-incompatible with JDK 25). Without these the disassembly +
  perfasm stage is skipped and its structural checks report SKIP; everything else
  runs unchanged. Install on Debian/Ubuntu: `sudo apt install -y libcapstone-dev git`.

## System setup — required to build & run the tests

This is **everything** the tests need. No CPU/perf tuning is involved — that is
benchmark-only (next-but-one section). Two one-time steps:

```bash
# 1. JDK 25 (Ubuntu/Debian). Record the exact build in RESULTS.md.
sudo apt install -y openjdk-25-jdk

# 2. Maven toolchain so the build targets JDK 25 regardless of the launching JVM.
#    Create ~/.m2/toolchains.xml (merge the <toolchain> block if the file exists):
cat > ~/.m2/toolchains.xml <<'XML'
<?xml version="1.0" encoding="UTF-8"?>
<toolchains>
  <toolchain>
    <type>jdk</type>
    <provides><version>25</version><vendor>openjdk</vendor></provides>
    <configuration><jdkHome>/usr/lib/jvm/java-25-openjdk-amd64</jdkHome></configuration>
  </toolchain>
</toolchains>
XML
```

`--add-modules=jdk.incubator.vector` is already wired into the compiler and the
surefire test JVM by the `pom.xml`, so you do not pass it by hand for tests.

## Build & test

The one-time setup above does need `sudo` for **one** thing — the JDK 25 package
install (`sudo apt install openjdk-25-jdk`); the `~/.m2/toolchains.xml` step does
not. Once JDK 25 is installed, the tests themselves **run with no further `sudo`
and no governor/perf tuning** (that tuning is benchmark-only, next section):

```bash
mvn test       # correctness harness: round-trip, 3-way cross-validation, tail edges
mvn package    # also builds target/benchmarks.jar
```

## Reproduce everything with one command

`run_lab.sh` does the whole thing end to end: tunes the machine (governor + perf
counters, via `bench-system.sh`), builds, runs the correctness tests, runs the
benchmark suite, **verifies the measured numbers against the pre-registered
findings**, writes a dated Markdown report, and **always restores the previous
environment on exit** (success, failure, or Ctrl-C).

```bash
./run_lab.sh             # default (~15-20 min): build, tune, run, verify, report, restore
./run_lab.sh --quick     # smoke run (1 fork) — fast, not article-grade
./run_lab.sh --full      # article-grade (3 forks, 5 warmup + 5 measure x1s; matches RESULTS.md)
./run_lab.sh --publication  # citable: 3 forks, 5x3s warmup + 10x1s measure, + perfnorm OFF (scalar-widen & parquet)
./run_lab.sh --no-env    # don't touch governor/perf (no sudo); perfnorm checks skipped
./run_lab.sh --help      # all flags
```

Run it as your normal user (not `sudo ./run_lab.sh`): the privileged steps escalate
via `sudo` internally, so building stays off-root and `~/.m2` ownership is left
clean. It prompts for `sudo` only when pinning the governor and unlocking perf.

Output (git-ignored): `reports/decode-shape-report-<date>.md` is the verified
report (environment, throughput table, perfnorm table, and a PASS/FAIL line per
finding); `reports/run-<date>/` holds the raw JMH JSON/text and `build.log`. A full
console log of the whole run is also written to `/tmp/decode-shape-run-<date>.log`
(override the directory with `LOG_DIR=/path`). Exit code is `0` when every check
reproduces, `1` otherwise (CI-friendly). The sections below document the same steps
done by hand.

When a JDK 25-compatible hsdis is available (Run 4 builds it automatically if
`libcapstone-dev` + `git` are present), `reports/run-<date>/asm/` also holds the
widening-loop disassembly and the perfasm cycle attribution, and the report adds a
small group of **machine-code structural checks** (no SIMD widening is emitted; the
width-8 GPR-XMM round trips appear only with SuperWord on; their cycle cost is
dominant at width 8 but minor at width 16). Without hsdis those checks report SKIP.

`scalar-widen` only supports the byte-aligned widths 8/16, so `run_lab.sh` runs it
in its own invocation limited to those widths and excludes it from the main matrix:
the log stays free of `UnsupportedOperationException` traces. The `WARNING` lines
about `sun.misc.Unsafe` and the incubator module are expected with JDK 25 + JMH
(they come from JMH/Guava and from using `jdk.incubator.vector`), not a benchmark
problem. The forks receive `--add-modules=jdk.incubator.vector` once, from the
benchmark's `@Fork` annotation — `run_lab.sh` does not also pass it on the launcher.

## Extra setup — benchmarks only (NOT needed for tests)

Throughput numbers are only interpretable on a quiesced machine. These need `sudo`
and change machine state; the **Restoring system defaults** section below puts
everything back. Skip this entirely if you are only running `mvn test`.

### The `bench-system.sh` helper (recommended)

A small wrapper in the repo root does the machine-state tuning and — crucially —
records the prior state, so it can put back *exactly* what was there:

| command | what it does |
|---------|--------------|
| `./bench-system.sh setup`   | saves the current governor / `perf_event_paranoid` / `kptr_restrict`, then pins the CPU governor to `performance` and unlocks the `perf` counters used by `-prof perfnorm`. |
| `./bench-system.sh restore` | reverts governor + perf to the saved values (or the distro defaults `powersave`/`4`/`1` if nothing was saved) and removes the JDK-25-incompatible hsdis symlink if present. |
| `./bench-system.sh status`  | prints the current governor / perf settings and any saved prior state. Read-only — **no `sudo`**. |

`setup` and `restore` call `sudo` internally and will prompt for a password; they
need `cpupower` (`sudo apt install -y linux-tools-common linux-tools-generic`).
**None of this is needed for `mvn test`** — it only affects benchmark numbers.

The raw commands, if you prefer them by hand instead of the helper:

```bash
# cpupower is not installed by default on most distros — install it first:
sudo apt install -y linux-tools-common linux-tools-generic   # Ubuntu/Debian

# Pin CPU frequency — without this the numbers carry governor-scaling variance.
sudo cpupower frequency-set -g performance

# Allow perf hardware counters for `-prof perfnorm` (instructions/value, cycles).
sudo sysctl kernel.perf_event_paranoid=0
sudo sysctl kernel.kptr_restrict=0
```

> Disassembly note: `-prof perfasm` / `PrintAssembly` needs a JDK-25-compatible
> hsdis. The packaged `libhsdis0-fcml` is **ABI-incompatible** with JDK 25 (it
> exports the old `decode_instructions`, not `decode_instructions_virtual`) and
> silently degrades to a byte dump — do not use it. Instead, `hsdis-build/build-hsdis.sh`
> builds a working plugin (capstone backend; needs `libcapstone-dev` + `git`), and
> `run_lab.sh` Run 4 builds and uses it automatically via `LD_LIBRARY_PATH` (no install
> into the JDK). `-prof perfnorm` (counters) settles "is it really SIMD?" without any of
> this. See `RESULTS.md`.

## Restoring system defaults (run after benchmarking)

The quick way — reverts governor + perf to the state `setup` recorded (or distro
defaults) and removes the hsdis symlink:

```bash
./bench-system.sh restore
```

Or the raw commands by hand:

```bash
# CPU governor back to default (this box's default was 'powersave').
sudo cpupower frequency-set -g powersave

# perf counters back to the locked-down default.
sudo sysctl kernel.perf_event_paranoid=4
sudo sysctl kernel.kptr_restrict=1

# Remove the (incompatible) hsdis symlink and package, if they were added.
sudo rm -f /usr/lib/jvm/java-25-openjdk-amd64/lib/hsdis-amd64.so
sudo apt remove -y libhsdis0-fcml   # only if it was installed
```

The JDK 25 install and `~/.m2/toolchains.xml` are left in place — they are build
prerequisites, not per-session state. Check your machine's original governor first
(`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`) if it was not
`powersave`.

## Run the benchmarks

```bash
JDK25=/usr/lib/jvm/java-25-openjdk-amd64/bin/java   # adjust to your JDK 25

# Full Phase 1 sweep, results to CSV + JSON for charting:
$JDK25 --add-modules=jdk.incubator.vector -jar target/benchmarks.jar \
    Phase1UnpackBench \
    -rf json -rff results/phase1.json \
    -rff results/phase1.csv -rf csv

# Quick single case:
$JDK25 --add-modules=jdk.incubator.vector -jar target/benchmarks.jar \
    Phase1UnpackBench -p bitWidth=13 -f 1 -wi 3 -i 5
```

### Auto-vectorization discipline (mandatory before trusting numbers)

The `scalar-*` baseline may already be auto-vectorized by C2 SuperWord. To
separate *true-scalar* from *autovectorized-scalar*, re-run with SuperWord off:

```bash
$JDK25 --add-modules=jdk.incubator.vector -jar target/benchmarks.jar \
    Phase1UnpackBench -jvmArgs "-XX:-UseSuperWord"
```

And confirm the mechanism rather than trusting the throughput number. Prefer
`-prof perfnorm` (hardware counters — instructions/value, cycles, IPC), which needs
only `perf` (paranoid relaxed above), not hsdis:

```bash
# instructions/value: ~15 = scalar, ~1.6 = SIMD, ~3 = lean scalar (widening; Run 4 shows it is not SIMD)
$JDK25 --add-modules=jdk.incubator.vector -jar target/benchmarks.jar \
    Phase1UnpackBench -p bitWidth=13 -p decoder=scalar-array,vector-segment -prof perfnorm
```

(`-prof perfasm` shows the literal mnemonics and per-instruction cycle attribution;
it needs the JDK-25-compatible hsdis built by `hsdis-build/build-hsdis.sh` — see the
disassembly note above. `run_lab.sh` Run 4 automates the build and both profiles.)

## Figures

`make_figures.py` turns a run's JSON (`thrpt-*.json`, `perfnorm-*.json`) into the
three SVG charts used in the write-up (instructions/value, the scalar-floor
gradient, the Parquet backfire). It is the only script here that needs a non-stdlib
dependency (matplotlib), so it gets its own venv:

```bash
python3 -m venv .venv && . .venv/bin/activate && pip install matplotlib
python make_figures.py reports/run-<stamp> <out-dir>     # e.g. ../article/images
```

The generator lives with the experiment (it reads the lab's own JSON format); the
SVGs it emits are written wherever `<out-dir>` points. `.venv/` is git-ignored.

## Phases

- **Phase 0** — upstream baseline inspection (done; see `RESULTS.md`).
- **Phase 1** — bit-packed fixed-width integers (this code).
- **Phase 2** — RLE + bit-packed hybrid (not yet built).
- **Phase 3** — dictionary decode, indices vs gather (not yet built).
- **Phase 4** — real Parquet comparison, gated, only after 1–3.

## Non-goals

No FFM downcalls to native libraries (the FFM use here is the *memory* half only).
No real Parquet reading before Phase 4. No routing around irregular widths — they
are the subject. No "scalar vs SIMD" framing when the scalar baseline is
auto-vectorized.
