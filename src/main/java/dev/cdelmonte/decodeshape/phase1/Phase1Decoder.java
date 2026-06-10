/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import java.lang.foreign.MemorySegment;

/**
 * One decode strategy for fixed-width bit-packed unsigned integers.
 *
 * <p>Every implementation decodes {@code count} values of {@code bitWidth} bits
 * from the packed input into the preallocated {@code out} array. Output is
 * always {@code int[]} in Phase 1: this isolates decode cost from
 * output-representation cost, which is the variable the lab studies.
 *
 * <p>Two entry points exist so the substrate axis (heap {@code byte[]} vs
 * off-heap {@code MemorySegment}) can be measured while the algorithm is held
 * identical. An implementation supports the substrate(s) natural to it and
 * throws {@link UnsupportedOperationException} for the other.
 */
public interface Phase1Decoder {

    /** Human-readable name for benchmark/result labelling. */
    String name();

    /** Decode from a heap {@code byte[]} (padded per {@code BitPackLE}). */
    void decode(byte[] src, int count, int bitWidth, int[] out);

    /** Decode from an off-heap {@code MemorySegment} (padded per {@code BitPackLE}). */
    void decode(MemorySegment src, int count, int bitWidth, int[] out);
}
