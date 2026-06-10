/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import dev.cdelmonte.decodeshape.BitPackLE;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.nio.ByteOrder;

/**
 * Decoder (2): the <em>same</em> scalar algorithm as {@link ScalarArrayDecoder},
 * but reading off-heap from a {@code MemorySegment}. The only thing that differs
 * from decoder (1) is the substrate — the bit arithmetic, the load width, and
 * the output are identical. This is what lets the lab attribute any measured
 * difference to the substrate alone, never to a different decode strategy.
 */
public final class ScalarSegmentDecoder implements Phase1Decoder {

    private static final ValueLayout.OfLong LONG_LE =
            ValueLayout.JAVA_LONG_UNALIGNED.withOrder(ByteOrder.LITTLE_ENDIAN);

    @Override
    public String name() {
        return "scalar-segment";
    }

    @Override
    public void decode(MemorySegment src, int count, int bitWidth, int[] out) {
        BitPackLE.checkWidth(bitWidth);
        final long mask = BitPackLE.mask(bitWidth);
        long bitPos = 0;
        for (int i = 0; i < count; i++) {
            long bytePos = bitPos >>> 3;
            int bitOff = (int) (bitPos & 7);
            long word = src.get(LONG_LE, bytePos);
            out[i] = (int) ((word >>> bitOff) & mask);
            bitPos += bitWidth;
        }
    }

    @Override
    public void decode(byte[] src, int count, int bitWidth, int[] out) {
        throw new UnsupportedOperationException("scalar-segment decodes MemorySegment only");
    }
}
