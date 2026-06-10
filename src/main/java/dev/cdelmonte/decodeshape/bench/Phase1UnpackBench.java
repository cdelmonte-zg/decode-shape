/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.bench;

import dev.cdelmonte.decodeshape.Datasets;
import dev.cdelmonte.decodeshape.phase1.Phase1Decoder;
import dev.cdelmonte.decodeshape.phase1.ScalarArrayDecoder;
import dev.cdelmonte.decodeshape.phase1.ParquetScalarDecoder;
import dev.cdelmonte.decodeshape.phase1.ScalarSegmentDecoder;
import dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder;
import dev.cdelmonte.decodeshape.phase1.VectorSegmentDecoder;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OperationsPerInvocation;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.TearDown;
import org.openjdk.jmh.annotations.Warmup;
import org.openjdk.jmh.infra.Blackhole;

/**
 * Phase 1 measurement: one decode strategy x one bit width, decoding a fixed
 * block of bit-packed unsigned integers into a preallocated {@code int[]}.
 *
 * <p>The headline comparison is framed honestly as
 * <em>the strongest relevant scalar machine code C2 produces vs explicit Vector API</em> — not
 * "scalar vs SIMD". The fixed-substrate form of that comparison is
 * {@code scalar-segment} vs {@code vector-segment} (both on {@code MemorySegment}).
 * {@code scalar-array} differs from {@code scalar-segment} only by substrate
 * ({@code byte[]} vs {@code MemorySegment}), isolating whether the substrate moves
 * any numbers at this scale. The {@code scalar-widen} and {@code parquet-scalar}
 * axes run on {@code byte[]} and are separate reference baselines, not the
 * fixed-substrate control.
 *
 * <h2>Auto-vectorization discipline</h2>
 * Re-run with {@code -jvmArgs -XX:-UseSuperWord} to compare the two scalar forms C2
 * produces, and with {@code -prof perfasm} (or {@code -prof asm}) to confirm which
 * instructions are actually emitted. The on/off gap alone does not prove
 * auto-vectorization; disassembly or a SuperWord trace does. See README/RESULTS.
 *
 * <p>{@code @OperationsPerInvocation(N)} normalizes throughput to
 * values/second, so widths are directly comparable.
 */
@State(Scope.Thread)
@BenchmarkMode({Mode.Throughput, Mode.AverageTime})
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = {"--add-modules=jdk.incubator.vector"})
@OperationsPerInvocation(Phase1UnpackBench.N)
public class Phase1UnpackBench {

    /** Values per decode. Big enough to be steady-state, small enough to stay in cache. */
    public static final int N = 1 << 16;

    @Param({"5", "8", "9", "13", "16", "17", "24", "25", "26", "32"})
    public int bitWidth;

    // scalar-widen only applies to widths 8/16; other combinations error out in
    // setup (run without -foe so the rest of the matrix still completes).
    // parquet-scalar is the external byte[]-substrate anchor (read its insns/value,
    // not its absolute throughput vs the MemorySegment rows — substrate differs).
    @Param({"scalar-array", "scalar-segment", "scalar-widen", "parquet-scalar", "vector-segment"})
    public String decoder;

    private Phase1Decoder impl;
    private boolean usesSegment;

    private byte[] packed;
    private int[] out;

    private Arena arena;
    private MemorySegment segment;

    @Setup(Level.Trial)
    public void setup() {
        packed = Datasets.encodedRandom(N, bitWidth, Datasets.SEED + bitWidth);
        out = new int[N];

        arena = Arena.ofShared();
        segment = Datasets.toNativeSegment(packed, arena);

        switch (decoder) {
            case "scalar-array" -> { impl = new ScalarArrayDecoder(); usesSegment = false; }
            case "scalar-segment" -> { impl = new ScalarSegmentDecoder(); usesSegment = true; }
            case "scalar-widen" -> { impl = new ScalarWidenDecoder(); usesSegment = false; }
            case "parquet-scalar" -> { impl = new ParquetScalarDecoder(); usesSegment = false; }
            case "vector-segment" -> { impl = new VectorSegmentDecoder(); usesSegment = true; }
            default -> throw new IllegalArgumentException("unknown decoder: " + decoder);
        }

        // Correctness gate: a wrong kernel must not be benchmarked. Truth comes from
        // an independent, trivially-correct bit-by-bit reference — NOT from any of the
        // decoders under test — so the gate cannot pass a decoder against itself.
        int[] truth = new int[N];
        referenceDecode(packed, N, bitWidth, truth);
        int[] check = new int[N];
        if (usesSegment) {
            impl.decode(segment, N, bitWidth, check);
        } else {
            impl.decode(packed, N, bitWidth, check);
        }
        if (!java.util.Arrays.equals(truth, check)) {
            throw new IllegalStateException("decoder " + decoder + " disagrees at width " + bitWidth);
        }
    }

    /**
     * The slowest, most obviously-correct unpacker: read each value one bit at a
     * time, LSB-first. Independent of every decoder under test; used only by the
     * setup-time correctness gate, never measured.
     */
    private static void referenceDecode(byte[] src, int count, int bitWidth, int[] out) {
        for (int i = 0; i < count; i++) {
            long bitBase = (long) i * bitWidth;
            int v = 0;
            for (int b = 0; b < bitWidth; b++) {
                long p = bitBase + b;
                int bit = (src[(int) (p >>> 3)] >>> (int) (p & 7)) & 1;
                v |= bit << b;
            }
            out[i] = v;
        }
    }

    @TearDown(Level.Trial)
    public void tearDown() {
        arena.close();
    }

    @Benchmark
    public void decode(Blackhole bh) {
        if (usesSegment) {
            impl.decode(segment, N, bitWidth, out);
        } else {
            impl.decode(packed, N, bitWidth, out);
        }
        bh.consume(out);
    }
}
