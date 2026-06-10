# Build Log — Phase 1 of `decode-shape`

*A practical, essayistic walkthrough for building the lab yourself. Foundations
plus the full Phase 1 (bit-packed fixed-width integers). Phases 2–3 are gestured
at the end, not built here — every concept you need lives in Phase 1.*

---

## How to read this

This is not the brief and it is not the article. The brief (`decode-shape-claude-code-brief.md`)
is the contract a coding agent would execute end-to-end. The article (*Encoded
Before Columnar*) is the published piece, and it deliberately refuses the tutorial
register. This document sits between them, and only exists because **you** want to
write the Java by hand and understand the machine underneath each line.

The contract for *this* document:

- I give you **structure, method signatures, and the snippets that are genuinely
  hard to get right** — the bit-packing arithmetic and the `MemorySegment`↔Vector
  interlock. These are where a silent bug hides for a week.
- **You write the method bodies.** That is the point. Where I leave a `// EXERCISE`,
  the surrounding theory is complete enough that you are never actually stuck — you
  are deciding, not guessing.
- The prose between the code is the *saggistico* half: at each step, what is
  happening at the level of bits, of off-heap memory, of the C2 compiler. If you
  only read the code you will build the lab; if you only read the prose you will
  understand the boundary. You want both.

A note on register, because it matters to you specifically: writing the *tutorial*
in English is a side-investment. The sentences here where I explain *why a width of
5 resists the vector unit* are the sentences you will want to have already drafted
when you write the article on JDK 25. Steal from yourself.

---

## 1. What you are actually building, and why

The object of study is a single transition: **encoded bytes → typed values.** A
column of integers does not live in memory as `int[]`. It lives as a compressed,
bit-packed byte stream, and *someone* has to turn those bytes into numbers a CPU
can add. That someone is the decoder, and the cost of what it does is the cost this
lab measures.

You will write **three decoders** for the same encoding and prove they produce
identical output:

1. **scalar over `int[]`/`byte[]`** — the idiomatic Java a competent engineer writes;
2. **scalar over `MemorySegment`** — the same logic, but reading off-heap;
3. **Vector API over `MemorySegment`** — explicit SIMD.

Then you benchmark them. The headline you are hunting is **counterintuitive**:
there are bit widths where the explicit vector path does *not* win, and there is a
*structural reason* it does not. That reason is the whole point — hold onto it from
the first line of code. You are not building a fast decoder. You are building an
instrument precise enough to see why decoding sometimes refuses to go faster.

One discipline to internalise now, because it shapes every benchmark decision later:
the "scalar" baseline is a lie if you let C2 auto-vectorise it and then call the
comparison "scalar vs SIMD." It is not. It is *C2-autovectorised scalar vs explicit
Vector API*. You will spend real effort proving which of those two you are actually
measuring. Flag that thought; it returns in §9.

---

## 2. Foundations

### 2.1 Project layout

```
decode-shape/
  pom.xml
  src/
    main/java/dev/cdelmonte/decodeshape/
      pack/
        BitPackEncoder.java        // test-data generation (the encoder)
        Layout.java                // the packing contract, as constants + a comment
      decode/
        ScalarArrayDecoder.java    // decoder #1
        ScalarSegmentDecoder.java  // decoder #2
        VectorSegmentDecoder.java  // decoder #3
      Decoders.java                // a small façade: width -> decoder, for the harness
    test/java/dev/cdelmonte/decodeshape/
      RoundTripTest.java           // encode -> decode == original
      CrossValidationTest.java     // the three decoders agree, bit-for-bit
      TailEdgeCaseTest.java        // the lengths where bugs live
    jmh/java/dev/cdelmonte/decodeshape/
      DecodeBenchmark.java         // Phase 1 benchmark
  RESULTS.md
  README.md
```

Keep encoders and decoders in separate packages. It enforces a mental separation
you will be grateful for: the encoder is *infrastructure* (it must be obviously
correct and you will never optimise it), the decoders are *the experiment*.

### 2.2 JDK and the two features

Pin **JDK 25**. Not a feature release — JDK 25 is the current LTS (GA 16 Sept 2025;
the LTS cadence is now two years, 21 → 25 → 29). Pin it with Maven toolchains plus
the enforcer plugin so the build *fails* on the wrong JDK rather than silently
producing numbers from a different compiler. Record the exact vendor/build (e.g.
Temurin 25.0.x) in `RESULTS.md` — your numbers are only interpretable next to it.

The two features under study sit on opposite sides of a line you must not cross in
the code:

- **FFM / `MemorySegment`** — *finalized* in JDK 22 (JEP 454). Because it is final,
  it needs **no flags at all**. This is the *memory* half of the Foreign Function &
  Memory API.
- **Vector API** (`jdk.incubator.vector`) — still **incubating** in JDK 25 (JEP 508,
  the tenth incubator; it stays in incubation until Project Valhalla lands). Because
  it incubates, you must add the module explicitly, in **two** places:

```xml
<!-- maven-compiler-plugin -->
<compilerArgs>
  <arg>--add-modules=jdk.incubator.vector</arg>
</compilerArgs>
```

```java
// and on the JMH fork — the benchmark runs in a child JVM that does not inherit the above
@Fork(value = 3, jvmArgsAppend = {"--add-modules=jdk.incubator.vector"})
```

Forgetting the second one is the single most common first-run failure: it compiles,
the unit tests pass, and the benchmark JVM dies on a `module not found` because the
fork is a fresh process. Wire both now.

> **The line you do not cross.** FFM has two halves: memory (`MemorySegment`,
> `Arena`) and function (downcalls to native code via `Linker`/`jextract`). This
> lab uses *only* the memory half. No `jextract`, no native bindings, no linking to
> SVML/SLEEF/zstd. The function half is real and interesting — it is in fact where
> the article's closing paragraph goes — but it belongs to the prose, not the code.
> Keeping the code on the memory side of that line is what makes the lab a clean
> object. (Pleasant irony you can use in the article: JEP 508 itself touches *both*
> halves — it adds `VectorShuffle`↔`MemorySegment` on the memory side, and moves the
> Vector API's native-math linkage onto FFM on the function side. The boundary you
> are refusing to cross in code is the boundary OpenJDK crossed in one JEP.)

---

## 3. The data — bit-packing, where the bugs live

Before any decoder you need data to decode, which means an encoder, which means you
must commit to an **exact bit layout**. Get this wrong and every "bug" you chase
afterwards is really an encoder bug wearing a decoder's clothes. This is the most
important section in the document.

### 3.1 What "bit-packed unsigned fixed-width" means

You have N unsigned integers, each known to fit in `w` bits (`w` ∈ {5, 8, 9, 13, 16, 17}).
Storing each in a 32-bit `int` wastes `32 − w` bits per value. Bit packing throws
the waste away: the values are written end-to-end into a byte stream with **no gaps**,
so value `i` occupies bits `[i·w, i·w + w)` of the stream — a position that, for most
widths, does not begin on a byte boundary.

Adopt the **Parquet** convention exactly (this is what makes Phase 4 possible later
without rewriting anything):

- **LSB-first within the stream**: the least significant bit of a value goes into the
  lowest unused bit position.
- **Little-endian byte order** of the stream.
- **No padding between values.** Padding exists only in the final byte, if N·w is not
  a multiple of 8.

Write this as a comment in `Layout.java` and in `README.md`, verbatim. Future-you,
debugging a tail at midnight, will read it as scripture.

### 3.2 See it with your eyes — eight 5-bit values

Take `w = 5` and values `v0..v7`. Each is 5 bits: `v0 = b4 b3 b2 b1 b0`. LSB-first,
little-endian, they tile into bytes like this (bit 0 = LSB of the byte):

```
            byte 0                 byte 1                 byte 2
   bit:  7 6 5 4 3 2 1 0      7 6 5 4 3 2 1 0      7 6 5 4 3 2 1 0
        [v1 v1 v1│v0 v0 v0 v0 v0][v3 v3│v2 v2 v2 v2 v2│v1 v1][ v4...│v3 v3 v3]
              └ v1 spans the byte-0 / byte-1 boundary ─┘
```

Stare at this until it is obvious. The lessons are all here:

- `v0` fits inside byte 0. Easy.
- `v1` **straddles** the boundary between byte 0 and byte 1. Its low 3 bits are the
  top of byte 0; its high 2 bits are the bottom of byte 1. *This* is what unpacking
  actually has to handle, and it is invisible until you draw it.
- After exactly **8 values you have consumed exactly 5 bytes** and the pattern
  realigns to a byte boundary. That number — 8 values per 5 bytes — is not a
  coincidence and it is not trivia. It is the deep structural fact of §7, so let me
  name it now.

### 3.3 The period of a packing (write this on a sticky note)

A width-`w` packing realigns to a byte boundary after `lcm(w, 8)` bits. For any
**odd** width, `gcd(w, 8) = 1`, so `lcm(w, 8) = 8w` bits = `w` bytes, holding exactly
**8 values**. So:

| width w | period | values per period |
|--------:|-------:|------------------:|
| 5       | 5 bytes  | 8 |
| 9       | 9 bytes  | 8 |
| 13      | 13 bytes | 8 |
| 17      | 17 bytes | 8 |
| 8       | 1 byte   | 1 |
| 16      | 2 bytes  | 1 |

Every irregular width in this lab has the same period in *values*: **8**. The byte
span differs, the value count does not. Hold this — it is the hinge on which the
SIMD result turns (§7). The "regular" widths 8 and 16 have a period of one value:
each value is byte-aligned, every value is positioned identically modulo a byte.
That uniformity is exactly what a vector unit loves and the irregular widths deny it.

### 3.4 The encoder (here is the hard snippet — take it)

The encoder is the one place I hand you working code, because (a) it must be
unimpeachably correct or the whole lab is built on sand, and (b) the bit-cursor
logic is fiddly in a way that teaches nothing by being re-derived. Read it as the
inverse of the decode you are about to write.

```java
/** Packs `count` values of `width` bits each, LSB-first little-endian, into `out`.
 *  `out` must be at least ceil(count*width / 8) bytes, zero-initialised. */
static void pack(int[] values, int count, int width, byte[] out) {
    long bitPos = 0;                       // absolute bit cursor into the stream
    int mask = (width == 32) ? -1 : (1 << width) - 1;
    for (int i = 0; i < count; i++) {
        long v = values[i] & mask;         // defensive: never write stray high bits
        int byteIdx = (int) (bitPos >>> 3);
        int bitOff  = (int) (bitPos & 7);  // 0..7: where in the byte we start
        // value can touch up to 3 bytes (e.g. 17-bit value at bit offset 7 spans 24 bits)
        long window = v << bitOff;         // shift the value up to its in-byte position
        out[byteIdx]     |= (byte) (window);
        out[byteIdx + 1] |= (byte) (window >>> 8);
        out[byteIdx + 2] |= (byte) (window >>> 16);
        // a 4th byte is only needed for width+bitOff > 24; guard it for width 17
        if (bitOff + width > 24) out[byteIdx + 3] |= (byte) (window >>> 24);
        bitPos += width;
    }
}
```

Two things to notice, because they foreshadow the decoder:

- The value is **shifted up** by `bitOff` to land it in position, then **OR-ed** in
  byte by byte. Decoding reverses this: read the bytes, shift **down** by `bitOff`,
  mask to `width`.
- Whether a value touches 3 or 4 bytes depends on `bitOff + width`. The decoder will
  face the symmetric question: *how many bytes must I read to be sure I have the
  whole field?* The answer drives both the scalar trick (§5) and the tail (§8).

---

## 4. `MemorySegment` — the memory model under the data

You now have a `byte[]`. The first decoder will read from it. The second and third
read from a `MemorySegment` instead, so before writing them, understand what a
segment *is* and why you would decode straight out of one.

### 4.1 What it is

A `MemorySegment` is **a bounded, typed view over a region of memory** — on the Java
heap or, in this lab, **off-heap** (native memory the GC does not manage). "Bounded"
is the operative word: every access is checked against the segment's size, so an
out-of-bounds read throws rather than corrupting memory or segfaulting. It is the
safe, modern replacement for `Unsafe` and the dead `sun.misc` direct-buffer tricks.

Lifetime is **explicit**, via an `Arena`:

```java
try (Arena arena = Arena.ofConfined()) {
    MemorySegment seg = arena.allocate(byteSize);   // off-heap, zeroed
    MemorySegment.copy(packedBytes, 0, seg, ValueLayout.JAVA_BYTE, 0, byteSize);
    // ... decode out of `seg` ...
}   // <- arena closed here: the memory is deterministically freed, NOW
```

`Arena.ofConfined()` gives you an arena bound to **one thread** (cheapest access
checks, no synchronisation) whose memory is freed the instant the `try` block exits.
That determinism is the whole pitch: you decide when the bytes die, not the collector.

### 4.2 Why decode straight out of a segment

The honest answer for this lab: because the *real* world the article points at —
Parquet pages, Arrow buffers, mmap'd files — hands you off-heap bytes, and copying
them to a `byte[]` just to decode is itself a representation change with a cost. By
decoding *in place* out of the segment, decoder #2 and #3 measure the path a real
engine would take. Decoder #1 (on-heap `byte[]`) is the *control* that tells you how
much, if anything, the off-heap path costs on its own.

### 4.3 The API shape you will use

You read multi-byte fields out of a segment with a **layout** that carries both width
and byte order:

```java
import static java.lang.foreign.ValueLayout.*;
// a 32-bit little-endian int read — matches our LSB-first little-endian stream:
final OfInt LE_INT = JAVA_INT_UNALIGNED.withOrder(java.nio.ByteOrder.LITTLE_ENDIAN);

int word = seg.get(LE_INT, byteOffset);   // reads 4 bytes at byteOffset, LE
```

Note `JAVA_INT_UNALIGNED`. Your fields start at arbitrary *byte* offsets, which are
not 4-byte aligned. The plain `JAVA_INT` layout asserts 4-byte alignment and will
throw; `JAVA_INT_UNALIGNED` permits the unaligned read. This is exactly the kind of
detail that is invisible until it throws on value 3 — flag it now.

> **What the JIT is and is not doing here.** A `byte[]` access is a Java array access:
> C2 must prove (or insert) a bounds check, and it knows the object is on the heap and
> movable. A `MemorySegment.get` is a *foreign* access: the bounds check is against the
> segment's known size, the address is stable (off-heap memory does not move under the
> GC), and C2 has intrinsics that lower these accesses to plain loads when it can prove
> the bounds. Whether the two paths produce *the same machine code* for the scalar
> decoder is itself a small reportable finding — do not assume; check the assembly (§9).

---

## 5. Decoder #1 — scalar over `byte[]`: what unpacking actually is

Now the first real decoder. Resist the urge to think "it's just shifts." Decompose it
honestly, because the honesty is what sets up the question of which parts a vector
unit can and cannot do.

To extract value `i` of width `w`:

1. Compute its absolute bit position `bitPos = i * w`.
2. `byteOff = bitPos >>> 3`, `bitShift = bitPos & 7`.
3. Read **enough bytes** starting at `byteOff` to contain the whole field. A field of
   width `w` starting at in-byte offset `bitShift` spans `w + bitShift` bits, i.e. up
   to `ceil((w + 7)/8)` bytes. For our widths (≤17) plus a misalignment of ≤7, that is
   **at most 24 bits — three bytes — so a single 32-bit little-endian read covers it.**
4. **Shift down** by `bitShift` to drop the low bits that belong to earlier values.
5. **Mask** with `(1 << w) - 1` to drop the high bits that belong to later values.

That collapses into a strikingly small kernel — and here is the hard snippet, the
"read a wide word, shift, mask" trick, which is the heart of every scalar unpacker
you will ever read:

```java
// EXERCISE: fill the loop body. Signature and the key line are given.
static void decode(byte[] in, int count, int width, int[] out) {
    final int mask = (1 << width) - 1;
    long bitPos = 0;
    for (int i = 0; i < count; i++) {
        int byteOff  = (int) (bitPos >>> 3);
        int bitShift = (int) (bitPos & 7);
        // KEY LINE: assemble a 32-bit little-endian word from in[byteOff..byteOff+3],
        // then:  out[i] = (word >>> bitShift) & mask;
        // — you write the 4-byte little-endian assembly (watch sign extension on byte!)
        bitPos += width;
    }
}
```

The trap inside the KEY LINE, stated so you do not lose an afternoon to it: `byte`
in Java is **signed**. `in[byteOff]` is sign-extended to `int` when you use it, so a
byte value `0x80` becomes `0xFFFFFF80`. You must mask each byte with `& 0xFF` before
shifting it into position. Forget this on the high byte and your decode is correct
for small values and silently wrong for large ones — a bug that hides precisely
where round-trip tests with small seeds do not look. (See §8: this is *why* the
correctness harness must include large values, not just edge lengths.)

The tail problem also appears here: for the last value, `byteOff + 3` may run past
`in.length`. You cannot do a 4-byte read there. Handle the final values with a
byte-at-a-time path, or over-allocate the input by 3 bytes. Decide which — and write
down which in a comment — because the vector decoder will face the same wall and
should make the same choice.

---

## 6. Decoder #2 — scalar over `MemorySegment`

This is decoder #1 with one substitution: instead of assembling the 32-bit word from
`byte[]` by hand, you read it from the segment with the layout from §4.3.

```java
// EXERCISE: same algorithm as #1, but:
//   int word = seg.get(LE_INT, byteOff);   // replaces the hand-assembled 4-byte read
// Everything else — bitShift, mask, the tail — is identical.
```

The interesting part is not writing it; it is *comparing* it. You now have two scalar
decoders that must produce bit-identical output (the cross-validation test enforces
this, §8). If they ever disagree, the bug is almost always one of: the unaligned
layout, the little-endian order, or the byte sign-extension you got right in one and
wrong in the other. The disagreement is a *gift* — it localises the bug to the few
lines that differ.

The theory question this decoder exists to answer: **does going off-heap cost
anything for a purely scalar load?** Your hypothesis should be "almost nothing, once
warm" — the segment access intrinsifies to a plain load. But hypotheses are not
measurements. The value of #2 is that it isolates the off-heap *access pattern* from
the SIMD question entirely. When #3 wins or loses, #2 tells you how much of that was
the memory path and how much was the vectorisation.

---

## 7. Decoder #3 — Vector API over `MemorySegment`: where the boundary resists

Here is the centre of the lab. Everything so far was scaffolding for this comparison.

### 7.1 The vector mental model

A `Vector` is a fixed number of **lanes**, each holding one element, operated on
together by one machine instruction. The lane count is not yours to choose freely;
it is the hardware's, exposed as a **species**:

```java
import jdk.incubator.vector.*;
static final VectorSpecies<Integer> SPI = IntVector.SPECIES_PREFERRED;
// log SPI.length() and SPI.vectorBitSize() into RESULTS.md — they decide everything:
//   AVX2  -> 256-bit -> 8 int lanes
//   AVX-512 -> 512-bit -> 16 int lanes
//   NEON  -> 128-bit -> 4 int lanes
```

`SPECIES_PREFERRED` is the widest the current CPU supports. Your numbers are only
comparable across machines once you have recorded which it was — a "win" on 16 lanes
and a "win" on 4 lanes are different physical claims.

### 7.2 The interlock — the one snippet that defines the whole project

The load that pulls vector lanes *directly* out of off-heap memory is the
`MemorySegment`↔Vector interlock. This single line is the reason the two features are
"two sides of one decode path," not "two modern toys in one repo":

```java
IntVector v = IntVector.fromMemorySegment(SPI, seg, byteOffset, ByteOrder.LITTLE_ENDIAN);
// loads SPI.length() consecutive little-endian ints starting at byteOffset, into lanes
```

There is a masked variant, `fromMemorySegment(SPI, seg, off, bo, mask)`, for partial
loads at the tail — keep it in mind for §8.

### 7.3 Now the hard truth: this load is the *wrong shape* for sub-byte fields

`fromMemorySegment` gives you `length()` **consecutive whole ints** from memory. But
your values are not whole ints in memory — they are `w`-bit fields, packed, most of
them **straddling byte boundaries**. The vector load hands you raw packed bytes
reinterpreted as ints; it does *not* hand you decoded values. You still have to do
the shift-and-mask — but now *across lanes*, where each lane needs a **different**
shift amount and may need bits from a **different** byte than its neighbour.

This is exactly the non-uniformity §3.3 warned about, and now it bites. Recall: for
an odd width, **8 values occupy `w` bytes**. To decode 8 values into 8 lanes, lane `j`
must extract bits `[j·w, j·w + w)`, which sit at byte `(j·w)/8` with shift `(j·w) mod 8`
— and those `(byte, shift)` pairs are **all different**. A vector unit is built to do
the *same* operation to every lane. Per-lane *different* shifts and per-lane *different*
source bytes are the operations it is worst at:

- **Per-lane variable shift** exists (`v.lanewise(LSHR, shiftsVector)`), so the shift
  itself is expressible — good.
- **Per-lane different source bytes** is the real problem. Getting lane `j` to start
  from byte `(j·w)/8` means either a **gather** (each lane a different address — on
  x64 a gather is often barely faster than scalar loads, sometimes slower) or a clever
  **shuffle** (`VectorShuffle`, the very thing JEP 508 wired to `MemorySegment`) that
  permutes a loaded register into the right per-lane alignment. The shuffle approach is
  the interesting one and the hard one.

And here is the structural payoff, the sentence the article is built around:

> For widths **8 and 16**, the fields *are* byte-aligned and identically positioned —
> lane `j` is simply byte `j` (or `2j`). The load is already the right shape; decode is
> a straight load + widen, and the vector unit wins cleanly. For widths **5, 9, 13, 17**,
> the fields are non-uniformly positioned, the load is the wrong shape, and you pay in
> shuffles or gathers to fix it up. The cost of representation is not in the bits — it is
> in the *misalignment* between how the data is packed and how the machine wants to read it.

Whether the shuffle-fixup is cheaper than just running the autovectorised scalar
loop is **the open question this lab answers with numbers.** Do not assume. Build it,
measure it, read the assembly.

### 7.4 A concrete plan for the kernel (your exercise, with the path lit)

For an odd width `w`, process one **period** (8 values, `w` bytes) at a time:

1. Load the `w` packed bytes that hold the 8 values. (On AVX2, 8 lanes ↔ 8 values is a
   beautiful fit; on AVX-512 you would do two periods to fill 16 lanes.)
2. Distribute the bytes into lanes so each lane holds the (up to 3) bytes covering its
   field — this is the shuffle/gather step, the expensive one.
3. Apply a **per-lane shift vector** (`[0, w, 2w, ...] mod 8` worth of shifts, precomputed).
4. Apply the **mask** `(1<<w)-1` to all lanes at once.
5. Store the 8 decoded ints with `v.intoArray(out, i)` (Phase 1 output is `int[]` —
   see the note below).

```java
// EXERCISE: implement the period loop above. Precompute the per-lane shift vector and
// the shuffle once, outside the hot loop. Handle the final partial period as the tail.
```

> **Why the output is `int[]` and not a segment in Phase 1.** All three decoders write
> into a preallocated `int[]`. This *isolates decode cost from output-representation
> cost*: if decoder #3 wrote to a `MemorySegment` and #1 to an `int[]`, you would be
> measuring decode *plus* a representation change, contaminating the exact variable the
> lab studies. A segment-output variant is a separate, later benchmark — never part of
> the Phase 1 comparison.

---

## 8. The correctness harness — build this BEFORE any benchmark

A benchmark of a wrong decoder is a precise measurement of nothing. Three test
classes, and they come first:

**`RoundTripTest`** — for every width, encode random values then decode, assert
`decoded == original`. Crucially, draw values across the **full** `[0, 2^w)` range,
including the maximum. The §5 sign-extension bug *only* shows up for large values; a
test that seeds small numbers will pass over it forever.

**`CrossValidationTest`** — for every width and many lengths, assert all **three**
decoders produce bit-identical `int[]`. This is your most powerful instrument: when
#3 (the hard one) disagrees with #1 (the obvious one), #1 is your oracle. Most vector
bugs surface here, not in round-trip.

**`TailEdgeCaseTest`** — the lengths where bugs live. Test `N` ∈ {0, 1, 7} and
`N` around the vector lane count and the packing period: `lane_count ± 1`,
`period ± 1`, and a few thousand for good measure. The tail is where the "I can do a
4-byte read" assumption breaks and where the masked-load / scalar-remainder path is
exercised. If your tests are all multiples of 8 lanes, you have tested the easy half
of your own code.

Use a **seeded** RNG everywhere (`new Random(0xDECODE)` or similar) so a failure is
reproducible. A flaky decode test is almost always an unseeded generator hiding a
real, deterministic bug.

> **The discipline, stated plainly:** you do not get to look at a single benchmark
> number until all three test classes are green. The numbers are seductive and the
> bugs are silent; the harness is the only thing standing between you and a confident,
> published, wrong result.

---

## 9. The benchmark and its traps

Now JMH — and the traps, which are most of the work. Hand-rolled `System.nanoTime`
timing is forbidden; the JIT will make a fool of it.

### 9.1 The non-negotiable JMH hygiene

```java
@BenchmarkMode({Mode.Throughput, Mode.AverageTime})
@Fork(value = 3, jvmArgsAppend = {"--add-modules=jdk.incubator.vector"})
@Warmup(iterations = 5)
@Measurement(iterations = 5)
@State(Scope.Thread)
public class DecodeBenchmark {
    int[] out;            // PREALLOCATED in @Setup, never in the hot loop
    // @Setup: build packed input once per width; allocate `out` once.

    @Benchmark
    public void scalarArray(Blackhole bh) {
        decoder.decode(in, count, width, out);
        bh.consume(out);   // <- without this, C2 deletes the entire loop
    }
}
```

Two of these are load-bearing and worth saying out loud:

- **`Blackhole.consume(out)`.** A decode loop whose output is never observed is *dead
  code*, and C2 will delete it. You will measure an empty loop and report a
  spectacular, fictional throughput. Consume the output — every time.
- **Preallocate `out` in `@Setup`.** An allocation in the hot path measures the
  allocator, not the decoder, and invites the GC into your timing.

### 9.2 The trap that defines the whole methodology: auto-vectorisation

Here is the one that separates a real result from a naive one. C2 has an
auto-vectoriser, **SuperWord**, that will silently turn your "scalar" loop —
especially the clean width-8/16 cases — into SIMD machine code on its own. If you
then label decoder #1 "scalar" and decoder #3 "SIMD," you are comparing SIMD to
SIMD and calling one of them scalar. The result is not wrong by a little; it is
meaningless.

So you do three things, always:

1. **Run a diagnostic fork with `-XX:-UseSuperWord`** to get the *true-scalar*
   baseline, and compare it to the default (autovectorised-scalar) baseline. The gap
   between them is itself a finding: it tells you how much C2 was already doing for
   free.
2. **Verify the emitted instructions with `-prof perfasm`.** Do not trust a throughput
   number to tell you whether SIMD instructions are present — *look at them*. Confirm
   you see `vpsrld`/`vpand`/`vpshufb` (or NEON equivalents) where you expect vectors,
   and scalar `shr`/`and` where you expect scalar. `perfasm` needs `hsdis`; if you
   cannot build it, fall back to `-prof asm` or `-XX:+UnlockDiagnosticVMOptions
   -XX:+PrintAssembly`. **Pre-flight this on day one** — a missing `hsdis` discovered
   on the day you want results is a bad day. (Practically: this is Phase 0.)
3. **Frame the headline honestly**, in `RESULTS.md` and later the article, as:
   *C2-autovectorised scalar Java vs explicit Vector API vs MemorySegment access
   pattern* — never "scalar vs SIMD."

### 9.3 Capture the environment, emit machine-readable results

Into `RESULTS.md`: JDK vendor/build, CPU model, detected vector ISA and width
(`SPI.vectorBitSize()`), and whether you controlled turbo / frequency scaling (if
not, report the variance — an uncontrolled machine is usable if you are honest about
the noise). Emit results as **CSV and JSON** so the article's charts come straight
from data, not from retyping numbers.

---

## 10. Reading the first numbers without fooling yourself

When Phase 1 produces its first table — **width × implementation × throughput** —
read it adversarially:

- For **width 8 and 16**, expect the vector path and the autovectorised scalar path to
  be *close*, because C2 likely already vectorised the scalar. If the explicit vector
  path is dramatically faster than autovectorised scalar on width 8, be suspicious:
  is the scalar baseline actually being deleted (forgot the `Blackhole`)? Is it
  actually autovectorised (check `perfasm`)?
- For **width 5, 9, 13, 17**, this is the moment of truth. If the explicit vector path
  *loses* to autovectorised scalar, you have not failed — you have found the result.
  Now go to the assembly and read *why*: count the shuffles/gathers, see whether C2
  lowered your `VectorShuffle` to a single `vpshufb` or to a spill-and-reload. The
  *mechanism* is the contribution; the number alone is just a number.
- Sanity-check throughput against memory bandwidth. If you appear to be decoding
  faster than the bytes could physically be read from cache, you are measuring a
  deleted loop or a constant-folded result, not a decode.

The table is not the finding. The table plus the assembly explanation of *why each
row is what it is* — that is the finding, and it is what no tutorial-register
"Building X with Y" post ever bothers to produce. It is the whole reason this lab is
worth the month it will take.

---

## 11. Where this goes (Phases 2–3, gestured)

You now have every skill the rest needs. The later phases are variations on the same
three-decoder, correctness-first, autovectorisation-honest discipline:

- **Phase 2 — RLE + bit-packed hybrid.** Parquet's hybrid layout interleaves
  run-length-encoded runs with bit-packed runs. The new wrinkle is *branchy* control
  flow (which run am I in?), which interacts badly with vectorisation — a different
  flavour of "where SIMD resists." Same three decoders, same harness shape.
- **Phase 3 — Dictionary decode.** Split into two benchmarks: (a) decode the
  bit-packed *indices* (which is just Phase 1 again), and (b) the *value lookup* —
  a **gather**. Treat the gather as the central open question, not an assumed win: on
  x64, a hardware gather is frequently no better than scalar loads, and a "SIMD does
  not help here" result is the *expected and valuable* finding. Vary dictionary size:
  cache-resident vs cache-spilling changes the answer entirely.
- **Phase 4 — real Parquet**, only after 1–3, and only because §3.1 committed you to
  the exact Parquet layout from the start. This is why that comment was scripture.

When the Phase 1 skeleton compiles and the harness is green, the single most
valuable review you can ask for is **on the benchmark code specifically** —
auto-vectorisation leakage and dead-code elimination — *before* you trust any number.
Everything else is design you can revisit; a number you trusted too early is a
mistake you publish.

---

*Build the encoder. Draw the 5-bit byte diagram until it's obvious. Write the scalar
decoder and break the sign-extension bug on purpose so you recognise it later. Then
the hard one. The boundary is waiting exactly where the bits don't line up with the
bytes.*
