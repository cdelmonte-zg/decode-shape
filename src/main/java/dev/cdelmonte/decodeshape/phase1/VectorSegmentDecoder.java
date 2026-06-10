/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import dev.cdelmonte.decodeshape.BitPackLE;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.nio.ByteOrder;
import jdk.incubator.vector.ByteVector;
import jdk.incubator.vector.IntVector;
import jdk.incubator.vector.LongVector;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorShape;
import jdk.incubator.vector.VectorShuffle;
import jdk.incubator.vector.VectorSpecies;

/**
 * Decoder (3): explicit SIMD over a {@code MemorySegment}, via the Vector API.
 * Two kernels, selected by width — and the boundary between them is itself the
 * phenomenology the lab is built to see.
 *
 * <h2>Int-lane kernel (width ≤ 25)</h2>
 * Process {@code L = IntVector.SPECIES_PREFERRED.length()} values per step. A
 * {@link VectorShuffle} routes each value's four little-endian bytes into one int
 * lane ({@code reinterpretAsInts} → one 32-bit LE word per lane); a per-lane
 * variable right shift drops the intra-byte offset; a mask keeps the low bits.
 * Exact only while {@code bitOff + width ≤ 32}, i.e. width ≤ 25.
 *
 * <h2>Long-lane kernel (26 ≤ width ≤ 32)</h2>
 * Past the int-lane ceiling the 32-bit window can no longer hold a value plus its
 * intra-byte offset, so the kernel switches to 64-bit lanes: eight bytes per value
 * routed into one {@code long} lane, shift, mask, then <em>narrow</em> back to int
 * (L2I) for the {@code int[]} output. Half the lanes (8 vs 16) plus a narrowing
 * step — so this path is expected to be materially slower. That step-down at
 * width 26 is the point: the same idea costs more once the value stops fitting a
 * 32-bit lane.
 *
 * <p>Unlike {@code parquet-java}'s 33 hand-written width classes, both kernels are
 * single parametric routines whose shuffle/shift/mask are computed from the width
 * and cached. Little-endian host assumed (as is {@code reinterpretAsInts}).
 * If the preferred species is too narrow for a kernel, it falls back to the
 * scalar-segment algorithm — reported, not hidden.
 */
public final class VectorSegmentDecoder implements Phase1Decoder {

    private static final VectorSpecies<Integer> INT_SP = IntVector.SPECIES_PREFERRED;
    private static final VectorSpecies<Byte> BYTE_SP =
            VectorSpecies.of(byte.class, INT_SP.vectorShape());
    private static final VectorSpecies<Long> LONG_SP =
            VectorSpecies.of(long.class, INT_SP.vectorShape());
    // Narrow target for the long-lane L2I step: the int species with the same lane
    // count as LONG_SP (8 lanes → 256-bit). Derived from LONG_SP so it cannot drift
    // from the "8 long lanes" assumption it serves.
    private static final VectorSpecies<Integer> INT_HALF =
            VectorSpecies.of(int.class, VectorShape.forBitSize(LONG_SP.vectorBitSize() / 2));

    private static final int L = INT_SP.length();              // int lanes (16 on AVX-512)
    private static final int LL = LONG_SP.length();            // long lanes (8 on AVX-512)
    private static final int BYTE_LEN = BYTE_SP.length();      // 64 on AVX-512

    // Int-lane kernel needs L*4 == BYTE_LEN (true by construction) and L a
    // multiple of 8 so L values are byte-aligned.
    private static final boolean INT_KERNEL_OK = L >= 8 && (L % 8) == 0;
    // Long-lane kernel needs 8 bytes per lane to fit and 8 long lanes available.
    private static final boolean LONG_KERNEL_OK = LL == 8 && BYTE_LEN >= LL * 8;

    private static final ValueLayout.OfLong LONG_LE =
            ValueLayout.JAVA_LONG_UNALIGNED.withOrder(ByteOrder.LITTLE_ENDIAN);

    private final VectorShuffle<Byte>[] intShuffle;
    private final IntVector[] intShift;
    private final IntVector[] intMask;
    private final VectorShuffle<Byte>[] longShuffle;
    private final LongVector[] longShift;
    private final LongVector[] longMask;

    @SuppressWarnings("unchecked")
    public VectorSegmentDecoder() {
        int n = BitPackLE.MAX_WIDTH + 1;
        intShuffle = new VectorShuffle[n];
        intShift = new IntVector[n];
        intMask = new IntVector[n];
        longShuffle = new VectorShuffle[n];
        longShift = new LongVector[n];
        longMask = new LongVector[n];
    }

    @Override
    public String name() {
        return (INT_KERNEL_OK ? "vector-segment" : "vector-segment(fallback=scalar)");
    }

    @Override
    public void decode(MemorySegment src, int count, int bitWidth, int[] out) {
        BitPackLE.checkWidth(bitWidth);
        boolean useIntKernel = bitWidth <= BitPackLE.VECTOR_INT_MAX_WIDTH;
        if (useIntKernel && INT_KERNEL_OK) {
            decodeIntLane(src, count, bitWidth, out);
        } else if (!useIntKernel && LONG_KERNEL_OK) {
            decodeLongLane(src, count, bitWidth, out);
        } else {
            scalarFallback(src, 0, count, bitWidth, out);
        }
    }

    // ---- shared plan arithmetic (single source for both kernels) -------------
    // The load-bearing bit math lives here once, so a correction cannot be applied
    // to one lane width and silently forgotten on the other (which would corrupt
    // only widths 26-32 — exactly the "trick breaks" regime that is the headline).

    /** Byte the four/eight LE bytes of value k start at within the loaded window. */
    private static int[] shufflePositions(int lanes, int bytesPerLane, int w) {
        int[] shuf = new int[BYTE_LEN];
        for (int k = 0; k < lanes; k++) {
            int bo = (k * w) >>> 3;
            for (int j = 0; j < bytesPerLane; j++) {
                shuf[bytesPerLane * k + j] = bo + j;
            }
        }
        return shuf;
    }

    /** Intra-byte right-shift for value k. */
    private static int[] shiftCounts(int lanes, int w) {
        int[] shifts = new int[lanes];
        for (int k = 0; k < lanes; k++) {
            shifts[k] = (k * w) & 7;
        }
        return shifts;
    }

    // ---- int-lane kernel (width ≤ 25): 16 values/step, 32-bit lanes ----------

    private void buildIntPlan(int w) {
        intShuffle[w] = VectorShuffle.fromArray(BYTE_SP, shufflePositions(L, 4, w), 0);
        intShift[w] = IntVector.fromArray(INT_SP, shiftCounts(L, w), 0);
        intMask[w] = IntVector.broadcast(INT_SP, (int) BitPackLE.mask(w));
    }

    private void decodeIntLane(MemorySegment src, int count, int w, int[] out) {
        if (intShuffle[w] == null) {
            buildIntPlan(w);
        }
        final VectorShuffle<Byte> shuffle = intShuffle[w];
        final IntVector shiftVec = intShift[w];
        final IntVector maskVec = intMask[w];
        final int windowBytes = L * w / 8;

        int blockStart = 0;
        long baseByte = 0;
        for (; blockStart + L <= count; blockStart += L, baseByte += windowBytes) {
            ByteVector.fromMemorySegment(BYTE_SP, src, baseByte, ByteOrder.LITTLE_ENDIAN)
                    .rearrange(shuffle)
                    .reinterpretAsInts()
                    .lanewise(VectorOperators.LSHR, shiftVec)
                    .lanewise(VectorOperators.AND, maskVec)
                    .intoArray(out, blockStart);
        }
        scalarFallback(src, blockStart, count, w, out);
    }

    // ---- long-lane kernel (26 ≤ width ≤ 32): 8 values/step, 64-bit lanes -----

    private void buildLongPlan(int w) {
        int[] sc = shiftCounts(LL, w);
        long[] shifts = new long[LL];
        for (int k = 0; k < LL; k++) {
            shifts[k] = sc[k];
        }
        longShuffle[w] = VectorShuffle.fromArray(BYTE_SP, shufflePositions(LL, 8, w), 0);
        longShift[w] = LongVector.fromArray(LONG_SP, shifts, 0);
        longMask[w] = LongVector.broadcast(LONG_SP, BitPackLE.mask(w));
    }

    private void decodeLongLane(MemorySegment src, int count, int w, int[] out) {
        if (longShuffle[w] == null) {
            buildLongPlan(w);
        }
        final VectorShuffle<Byte> shuffle = longShuffle[w];
        final LongVector shiftVec = longShift[w];
        final LongVector maskVec = longMask[w];
        final int windowBytes = LL * w / 8;

        int blockStart = 0;
        long baseByte = 0;
        for (; blockStart + LL <= count; blockStart += LL, baseByte += windowBytes) {
            LongVector words = ByteVector
                    .fromMemorySegment(BYTE_SP, src, baseByte, ByteOrder.LITTLE_ENDIAN)
                    .rearrange(shuffle)
                    .reinterpretAsLongs()
                    .lanewise(VectorOperators.LSHR, shiftVec)
                    .lanewise(VectorOperators.AND, maskVec);
            ((IntVector) words.convertShape(VectorOperators.L2I, INT_HALF, 0))
                    .intoArray(out, blockStart);
        }
        scalarFallback(src, blockStart, count, w, out);
    }

    // ---- shared scalar tail / fallback --------------------------------------

    private static void scalarFallback(
            MemorySegment src, int from, int count, int bitWidth, int[] out) {
        final long mask = BitPackLE.mask(bitWidth);
        long bitPos = (long) from * bitWidth;
        for (int i = from; i < count; i++) {
            long bytePos = bitPos >>> 3;
            int bitOff = (int) (bitPos & 7);
            long word = src.get(LONG_LE, bytePos);
            out[i] = (int) ((word >>> bitOff) & mask);
            bitPos += bitWidth;
        }
    }

    @Override
    public void decode(byte[] src, int count, int bitWidth, int[] out) {
        throw new UnsupportedOperationException("vector-segment decodes MemorySegment only");
    }
}
