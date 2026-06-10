/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import java.lang.foreign.MemorySegment;

/**
 * Decoder for the <em>byte-aligned control widths only</em> (8 and 16), written
 * as the idiomatic straight-line widening loop a competent engineer would write
 * — no bit-offset arithmetic, fixed stride. Unlike {@link ScalarArrayDecoder}'s
 * per-value variable-shift loop (which C2 SuperWord cannot touch), this loop has the
 * regular shape SuperWord can analyze.
 *
 * <p>Its whole purpose is the brief's question: at the aligned widths, does C2
 * already vectorize the plain scalar Java, making the explicit Vector API redundant?
 * Run it with and without {@code -XX:-UseSuperWord}. On the measured host and JDK the
 * answer is no: SuperWord recognizes and packs the parallel work but rejects the
 * byte-to-int widening at its def-use compatibility check (see the Run 4 disassembly
 * and SuperWord trace), so both configurations stay scalar. The on/off gap is between
 * two scalar forms, not scalar vs SIMD.
 */
public final class ScalarWidenDecoder implements Phase1Decoder {

    @Override
    public String name() {
        return "scalar-widen";
    }

    @Override
    public void decode(byte[] src, int count, int bitWidth, int[] out) {
        switch (bitWidth) {
            case 8 -> {
                for (int i = 0; i < count; i++) {
                    out[i] = src[i] & 0xFF;
                }
            }
            case 16 -> {
                for (int i = 0; i < count; i++) {
                    int lo = src[2 * i] & 0xFF;
                    int hi = src[2 * i + 1] & 0xFF;
                    out[i] = lo | (hi << 8);
                }
            }
            default -> throw new UnsupportedOperationException(
                    "scalar-widen handles only byte-aligned widths 8 and 16, got " + bitWidth);
        }
    }

    @Override
    public void decode(MemorySegment src, int count, int bitWidth, int[] out) {
        throw new UnsupportedOperationException("scalar-widen decodes byte[] only");
    }

    /** Whether this decoder applies to the given width. */
    public static boolean handles(int bitWidth) {
        return bitWidth == 8 || bitWidth == 16;
    }
}
