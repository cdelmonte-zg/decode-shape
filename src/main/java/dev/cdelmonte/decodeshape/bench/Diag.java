/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.bench;

import dev.cdelmonte.decodeshape.Datasets;
import dev.cdelmonte.decodeshape.phase1.ScalarWidenDecoder;
import dev.cdelmonte.decodeshape.phase1.VectorSegmentDecoder;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;

/**
 * Tiny disassembly harness (NOT a benchmark). It runs one decode path in a long
 * loop so C2 compiles it, then prints a checksum. Combined with
 * {@code -XX:+PrintAssembly -XX:CompileCommand=print,<method>} (which needs only
 * hsdis, not perf), it lets us confirm the actual emitted instructions — e.g.
 * whether the int-lane Vector kernel really emits {@code vpermb}+variable shift,
 * and why C2 SuperWord pessimizes the widening scalar loop. See {@code dump_asm.sh}.
 *
 * Usage: java ... dev.cdelmonte.decodeshape.bench.Diag &lt;mode&gt;
 *   mode ∈ { int13, long26, widen8, widen16, homog }
 *
 * {@code homog} is the SuperWord positive control: an element-width-preserving
 * {@code int + int} loop that C2 DOES auto-vectorize (LoadI -&gt; AddI -&gt; StoreI, all
 * 4-byte elements). Contrast it with {@code widen8}: the same machine and pipeline,
 * but the implicit byte-to-int widening (LoadUB -&gt; StoreI, 1-byte vs 4-byte element)
 * is rejected at SuperWord's vector def-use compatibility check. Both decoders'
 * load/store packs are individually implementable; only the widening def-use edge fails.
 */
public final class Diag {

    private static final int N = 1 << 16;
    private static final int ITERS = 50_000;

    public static void main(String[] args) {
        String mode = args.length > 0 ? args[0] : "int13";
        long checksum = switch (mode) {
            case "int13" -> runSegment(13);
            case "long26" -> runSegment(26);
            case "widen8" -> runWiden(8);
            case "widen16" -> runWiden(16);
            case "homog" -> runHomog();
            default -> throw new IllegalArgumentException("mode ∈ {int13,long26,widen8,widen16,homog}");
        };
        System.out.println(mode + " checksum=" + checksum);
    }

    private static long runSegment(int w) {
        byte[] packed = Datasets.encodedRandom(N, w, Datasets.SEED + w);
        int[] out = new int[N];
        VectorSegmentDecoder d = new VectorSegmentDecoder();
        long sum = 0;
        try (Arena arena = Arena.ofConfined()) {
            MemorySegment seg = Datasets.toNativeSegment(packed, arena);
            for (int i = 0; i < ITERS; i++) {
                d.decode(seg, N, w, out);
                sum += out[i & (N - 1)];
            }
        }
        return sum;
    }

    private static long runWiden(int w) {
        byte[] packed = Datasets.encodedRandom(N, w, Datasets.SEED + w);
        int[] out = new int[N];
        ScalarWidenDecoder d = new ScalarWidenDecoder();
        long sum = 0;
        for (int i = 0; i < ITERS; i++) {
            d.decode(packed, N, w, out);
            sum += out[i & (N - 1)];
        }
        return sum;
    }

    /** Positive control: an element-width-preserving int loop that C2 auto-vectorizes. */
    private static long runHomog() {
        int[] a = new int[N], b = new int[N], out = new int[N];
        for (int i = 0; i < N; i++) { a[i] = i; b[i] = i * 3; }
        long sum = 0;
        for (int i = 0; i < ITERS; i++) {
            homog(a, b, out);
            sum += out[i & (N - 1)];
        }
        return sum;
    }

    /** LoadI -> AddI -> StoreI, all 4-byte elements: the vectorizable control. */
    static void homog(int[] a, int[] b, int[] out) {
        for (int i = 0; i < out.length; i++) {
            out[i] = a[i] + b[i];
        }
    }
}
