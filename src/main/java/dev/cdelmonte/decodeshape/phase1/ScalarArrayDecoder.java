/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import dev.cdelmonte.decodeshape.BitPackLE;
import java.lang.foreign.MemorySegment;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.nio.ByteOrder;

/**
 * Decoder (1): the idiomatic scalar Java a competent engineer writes, over a
 * heap {@code byte[]}. One little-endian 8-byte load per value, shift, mask.
 *
 * <p>This is the baseline the methodology warns about: C2 SuperWord may
 * auto-vectorize this loop. Whether it does, per width, is itself a finding —
 * run it once with {@code -XX:-UseSuperWord} to separate true-scalar from
 * autovectorized-scalar.
 */
public final class ScalarArrayDecoder implements Phase1Decoder {

    private static final VarHandle LONG_LE =
            MethodHandles.byteArrayViewVarHandle(long[].class, ByteOrder.LITTLE_ENDIAN);

    @Override
    public String name() {
        return "scalar-array";
    }

    @Override
    public void decode(byte[] src, int count, int bitWidth, int[] out) {
        BitPackLE.checkWidth(bitWidth);
        final long mask = BitPackLE.mask(bitWidth);
        long bitPos = 0;
        for (int i = 0; i < count; i++) {
            int bytePos = (int) (bitPos >>> 3);
            int bitOff = (int) (bitPos & 7);
            long word = (long) LONG_LE.get(src, bytePos);
            out[i] = (int) ((word >>> bitOff) & mask);
            bitPos += bitWidth;
        }
    }

    @Override
    public void decode(MemorySegment src, int count, int bitWidth, int[] out) {
        throw new UnsupportedOperationException("scalar-array decodes byte[] only");
    }
}
