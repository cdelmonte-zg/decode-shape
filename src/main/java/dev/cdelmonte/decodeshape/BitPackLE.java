/*
 * decode-shape — a benchmark lab, not a library. No API-stability obligations.
 */
package dev.cdelmonte.decodeshape;

import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.nio.ByteOrder;

/**
 * Reference encoder for the lab's fixed bit-packing layout, plus the shared
 * constants the decoders rely on.
 *
 * <h2>Layout (fixed, not arbitrary)</h2>
 * Parquet-style bit packing:
 * <ul>
 *   <li>unsigned fixed-width values, {@code bitWidth} bits each;</li>
 *   <li>packed consecutively, least-significant-bit first;</li>
 *   <li>little-endian within the byte stream;</li>
 *   <li>no padding between values; only the final byte is zero-padded.</li>
 * </ul>
 * This is byte-for-byte the layout {@code parquet-java}'s little-endian
 * {@code BytePacker} produces, which is what makes a later Phase 4 comparison
 * against real Parquet pages possible without rewriting the encoder.
 *
 * <h2>Padding contract (lab convenience, documented on purpose)</h2>
 * The logical packed length is {@code ceil(count * bitWidth / 8)} bytes. Every
 * buffer handed to a decoder in this lab is allocated with {@link #TRAILING_PAD}
 * extra readable bytes after that, all zero. This lets all three decoders use a
 * uniform full-word load for every value (including the last) without a special
 * end-of-buffer branch, so the only variable that differs between the scalar
 * decoders is the <em>substrate</em> ({@code byte[]} vs {@code MemorySegment}),
 * never the algorithm. Real Parquet pages are followed by more page data, so
 * this padding does not change what the kernel does — it only removes an
 * out-of-bounds artifact that would otherwise contaminate the measurement.
 *
 * <p>The lab studies widths up to {@link #MAX_WIDTH}; the single-word decode
 * trick (one little-endian load, shift, mask) is exact only while
 * {@code bitOffset + bitWidth <= 64}, which holds for all supported widths.
 */
public final class BitPackLE {

    private BitPackLE() {}

    /**
     * Widest bit width the scalar long-word decoders handle exactly: the trick is
     * one 8-byte little-endian load per value, valid while {@code bitOff + width <= 64}
     * i.e. width <= 57. We cap at 32 (the widest Parquet packs into an int column).
     */
    public static final int MAX_WIDTH = 32;

    /**
     * Widest width the int-lane Vector kernel handles: it reads one 32-bit
     * little-endian word per lane, valid only while {@code bitOff + width <= 32}
     * i.e. width <= 25. Above this the kernel must switch to a 64-bit-lane path —
     * the "the trick breaks here" axis the lab is built to expose.
     */
    public static final int VECTOR_INT_MAX_WIDTH = 25;

    /** Extra zero bytes appended to every decoder buffer (see padding contract). */
    public static final int TRAILING_PAD = 64;

    /**
     * The widths Phase 1 studies. 8/16 are the lane-friendly control; 5/9/13/17
     * are the original irregular set; 24/25 sit at the int-lane ceiling; 26 is the
     * first width past it (forces the 64-bit-lane vector path); 32 is the full int.
     */
    public static final int[] PHASE1_WIDTHS = {5, 8, 9, 13, 16, 17, 24, 25, 26, 32};

    private static final VarHandle LONG_LE =
            MethodHandles.byteArrayViewVarHandle(long[].class, ByteOrder.LITTLE_ENDIAN);

    /** Bytes needed to pack {@code count} values of {@code bitWidth} bits, no pad. */
    public static int packedLength(int count, int bitWidth) {
        return Math.toIntExact(((long) count * bitWidth + 7) / 8);
    }

    /** Mask isolating the low {@code bitWidth} bits. {@code bitWidth} in [1,32]. */
    public static long mask(int bitWidth) {
        return bitWidth == 64 ? -1L : (1L << bitWidth) - 1;
    }

    /**
     * Encode {@code count} values into a freshly allocated buffer of size
     * {@code packedLength(count, bitWidth) + TRAILING_PAD}. The reference
     * encoder is deliberately the simplest correct LSB-first packer.
     */
    public static byte[] encode(int[] values, int count, int bitWidth) {
        checkWidth(bitWidth);
        byte[] out = new byte[packedLength(count, bitWidth) + TRAILING_PAD];
        long m = mask(bitWidth);
        long acc = 0;
        int bits = 0;
        int pos = 0;
        for (int i = 0; i < count; i++) {
            acc |= (values[i] & m) << bits;
            bits += bitWidth;
            while (bits >= 8) {
                out[pos++] = (byte) acc;
                acc >>>= 8;
                bits -= 8;
            }
        }
        if (bits > 0) {
            out[pos] = (byte) acc;
        }
        return out;
    }

    /**
     * Decode a single value from a padded {@code byte[]} using one little-endian
     * 8-byte load. This is the exact arithmetic the scalar decoders share; it is
     * here so the {@code byte[]} and {@code MemorySegment} scalar paths cannot
     * drift apart algorithmically.
     */
    public static int decodeOne(byte[] src, int index, int bitWidth, long mask) {
        long bitPos = (long) index * bitWidth;
        int bytePos = (int) (bitPos >>> 3);
        int bitOff = (int) (bitPos & 7);
        long word = (long) LONG_LE.get(src, bytePos);
        return (int) ((word >>> bitOff) & mask);
    }

    public static void checkWidth(int bitWidth) {
        if (bitWidth < 1 || bitWidth > MAX_WIDTH) {
            throw new IllegalArgumentException(
                    "bitWidth " + bitWidth + " outside [1," + MAX_WIDTH + "]");
        }
    }
}
