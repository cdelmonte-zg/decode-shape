# Follow-up: the width-8/16 widening "regression" under SuperWord, resolved from machine code

**Date:** 2026-06-10 · **Host:** AMD Ryzen 9 7950X3D (Zen 4, AVX-512 VBMI/VBMI2) · **JDK:** OpenJDK 25.0.3
**Method:** Level 1 disassembly only (`-XX:+PrintAssembly`, Intel syntax) — **no `perf`, no sudo.**

## What gap this closes

The published article (*Unpacking Parquet*, Baseline 2) reports that the regular width-8
widening loop was **faster with SuperWord disabled** (≈7,495 vs ≈5,961 values/µs), shrinking
the explicit-vector advantage from ≈1.65× to ≈1.3×, and states the mechanism is **unresolved**:

> "Bytecode inspection cannot explain the difference because it arises during C2 optimization
> and machine-code generation. Readable assembly was not available on the benchmark host, so
> the mechanism remains unresolved."

It also leaves the width-16 case open ("cannot determine whether the loop remained scalar, was
partially vectorized, or produced a vector form…").

Both are now resolved. The blocker was never fundamental: the apt `libhsdis0-fcml` exports the
old ABI symbol `decode_instructions` while JDK 25 requires `decode_instructions_virtual`, so
PrintAssembly degraded to a byte dump. A capstone-backed hsdis (see `hsdis-build/build-hsdis.sh`)
exports the right symbol and produces readable assembly. Capstone runtime + headers were already
present on the host; the JVM finds the plugin via `LD_LIBRARY_PATH` — no writes to the JDK, no sudo.

Reproduce: `LD_LIBRARY_PATH=hsdis-build/lib bash dump_asm.sh widen8 [-nosw]` (modes: widen8/widen16).

## The finding: SuperWord does not vectorize this loop — it pessimizes it

No real SIMD widening (`vpmovzxbd`, vector loads/stores of packed data) appears in **any** variant.
What differs is the scalar code quality:

| variant | unroll | `movzx` (scalar byte loads) | `vmovd` in loop body (GPR↔XMM round-trips) |
|---|---|---|---|
| widen8  **OFF** (`-XX:-UseSuperWord`) | 8×  | 10 | 3 (safepoint housekeeping only) |
| widen8  **ON** (default)              | 16× | 18 | **15** |
| widen16 **OFF**                       | 8×  | 12 | 3 |
| widen16 **ON**                        | 16× | 36 | **13** |

**OFF** (`-nosw`) is a clean 8×-unrolled scalar loop: every value stays in a GPR
(`movzx` → `mov` store), back-edge `add edi, 8`.

```text
; widen8 OFF — clean, all values in GPRs
movzx  r13d, byte ptr [rdx+r14+0x11]
mov    dword ptr [r9+r14*4+0x14], r13d
movzx  esi,  byte ptr [rdx+r14+0x12]
mov    dword ptr [r9+r14*4+0x18], esi
...                                   ; 8 values, no XMM
add    edi, 8
jl     <loop top>
```

**ON** (default) unrolls 16× and, because 16 live byte-values plus addressing exhaust the GPR file,
spills 6 of the 16 lanes through XMM registers — a pointless byte → GPR → XMM → GPR → store round-trip:

```text
; widen8 ON — no SIMD emitted: scalar loads bounced through XMM for nothing
movzx  r11d, byte ptr [rdx+r14+0x1f]
vmovd  xmm0, r11d                     ; GPR -> XMM  (vestigial)
movzx  r10d, byte ptr [rdx+r14+0x1e]
vmovd  xmm2, r10d                     ; GPR -> XMM  (vestigial)
...
vmovd  r10d, xmm6                     ; XMM -> GPR  (round-trip back)
mov    dword ptr [r9+r14*4+0x38], r10d
```

SuperWord does not fail to recognize the loop. A fastdebug `TraceAutoVectorization` trace (see
below) shows it **builds** the widening vector packs — a 16-wide `LoadUB` pack and a 16-wide
`StoreI` pack — confirms they are implementable on this target, and then **discards both at the
profitability filter** (`Removed pack: not profitable`). What remains is the scalar 16-way-unrolled
loop, whose XMM round trips are dead weight on the hot path. The rejection is decided at the
profitability filter, but the operative check there is **structural, not a cost estimate** (see
below): SuperWord requires a packed value and its use to share the same vector element size, and the
byte-load (1-byte element) feeding the int-store (4-byte element) does not. That extra traffic is
the regression — and it matches the already-published counter delta (scalar-widen **3.0 insns/value
ON vs 2.64 OFF**): now we know *why* ON retires more.

Width-16 shows the same mechanism, more pronounced — it stays scalar (`movzx`) with even more
XMM round-trips, never a vector form. The full `decode` nmethods (all tiers) are published under
[`asm/`](asm/); the complete PrintAssembly dumps are regenerable via `dump_asm.sh` (gitignored).

## Why SuperWord declines it (fastdebug trace)

The trace flags are `develop`-only, so this needs a fastdebug JDK 25:

```bash
$FASTDEBUG/bin/java --add-modules=jdk.incubator.vector -cp target/classes \
  -XX:+UnlockDiagnosticVMOptions \
  -XX:CompileCommand=TraceAutoVectorization,*ScalarWidenDecoder.decode,ALL \
  dev.cdelmonte.decodeshape.bench.Diag widen8
```

The auto-vectorizer builds two packs, finds them implementable, then rejects them on cost:

```text
After SuperWord::filter_packs_for_implemented
PackSet::print: 2 packs
 Pack: 0   16 x LoadUB    (src[i] & 0xFF, recognized as a zero-extending byte load)
 Pack: 1   16 x StoreI    (out[i])
...
WARNING: Removed pack: not profitable:      (twice — the LoadUB pack and the StoreI pack)
After Superword::filter_packs_for_profitable
PackSet::print: 0 packs
SuperWord::transform_loop failed: SuperWord::SLP_extract did not vectorize
```

The decisive region is committed as [`superword-trace-widen8.txt`](superword-trace-widen8.txt). So
C2 *can* vectorize the loop — the packs pass `filter_packs_for_implemented`, meaning the target
supports the widening vector form — and the profitability filter removes it anyway.

Reading the filter in `src/hotspot/share/opto/superword.cpp` shows the exact reason, and it is
**not a cost comparison**. `filter_packs_for_profitable` calls `profitable()`, which calls
`is_vector_use()`, which calls `is_velt_basic_type_compatible_use_def()`. Its default rule is:

```cpp
// Default case: input size of use equals output size of def.
return type2aelembytes(use_bt) == type2aelembytes(def_bt);
```

The store's element is `int` (4 bytes); the byte-load's element is `byte` (1 byte); `4 == 1` is
false, so the store is not a valid vector use of the load and both packs are dropped. The function
special-cases the widening idioms SuperWord *does* connect — an explicit `Convert` node,
`Long.bitCount` (8→4), `MulAddS2I` (2→4) — but a plain `src[i] & 0xFF` load→store is none of them
(the widening is implicit in `LoadUB`, with no `Convert` node), so it falls through to the
equal-size default and fails. The byte→int 1:4 size difference is therefore the cause, but it acts
as a **structural element-size incompatibility at the load→store pack boundary**, not as a
"vector is slower" verdict. A forced `-XX:CompileCommand=Vectorize` does not override it. This
corrects two earlier framings in this lab: SuperWord does *not* fail to form the pack (it forms it),
and the rejection is *not* a numeric cost decision (it is a pack-compatibility rule). The one link
read rather than measured is that `velt_basic_type(LoadUB)` is `byte`; a one-line instrumented build
would confirm it, but the source path is unambiguous (if it were `int`, the default check would pass
and the loop would vectorize).

## Positive control

To confirm the def-use compatibility check is the deciding factor — not the machine, the pipeline,
or some unrelated cost — the lab runs an element-width-preserving control loop next to the widening
one (`Diag homog`): `out[i] = a[i] + b[i]`, all `int` (`LoadI -> AddI -> StoreI`, 4-byte elements).

On the same host and JDK, SuperWord **vectorizes** the homogeneous loop and **rejects** the widening
one:

| loop | element types | SuperWord trace | C2 machine code |
|------|---------------|-----------------|-----------------|
| `homog` (`a[i] + b[i]`) | int → int (homogeneous) | `transform_loop: success` | `vmovdqu32` + `vpaddd` (vectorized) |
| `widen` (`src[i] & 0xFF`) | byte → int (1:4 widening) | `not profitable` ×3, `did not vectorize` | scalar `movzx` (not vectorized) |

The only variable is the def-use element-size relationship. `Diag homog` is dumped by Run 4 and
checked by `lab_verify_report.py` (the assembly contrast, on the release JDK); the trace verdicts
(`transform_loop: success` vs `not profitable`) are from the same fastdebug `TraceAutoVectorization`
run as above. The homogeneous disassembly is committed as
[`asm/homog.decode.asm`](asm/homog.decode.asm).

## What it means for the experiment

- **No number changes.** Throughput, ratios, and instruction counts stand exactly as published.
- **It strengthens the thesis.** "The baseline is part of the result" gets sharper: the baseline
  is not even fixed by the source code — it is set by what the JIT optimizer chooses to do. The
  *default* configuration (SuperWord ON) produces **worse** scalar code than disabling it, so the
  apparent 1.65× SIMD advantage at width 8 is partly an artifact of SuperWord hobbling the scalar
  baseline; the honest advantage against the best scalar code C2 can produce is 1.3×.
- **It vindicates the article's caution.** The final text already declined to call the baseline
  "auto-vectorized" (it says "a regular scalar loop from which HotSpot can generate efficient
  code"). The disassembly confirms no SIMD was emitted; the fastdebug trace shows why — C2 declined
  the vector form on profitability rather than failing to find it.
- **One pedagogical refinement** for any revision: the article uses `out[i] = src[i] & 0xFF` as
  "the kind of loop SuperWord can recognize." Generically true, and on *this* host C2 does
  recognize it — it builds the vector packs — but **declines** to vectorize it on profitability,
  emitting an over-unrolled scalar loop with XMM round trips. Worth stating precisely rather than
  leaving the textbook implication.

## Scope / what is not claimed

Three views agree: the static disassembly, the `perfasm` cycle attribution (in
[`perfasm/`](perfasm/)), and the fastdebug trace. The ON path does strictly more work (16× unroll +
XMM round trips, zero real SIMD); a substantial share of the width-8 hot-loop cycles falls on those
round trips; and the vector form is available but declined on profitability. Cycle attribution from
sampling is approximate on out-of-order hardware and the exact percentages vary run to run. Single
host, single JDK, as throughout.
