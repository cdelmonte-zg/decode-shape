/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.util.random.RandomGenerator;
import java.util.random.RandomGeneratorFactory;

/**
 * Seeded synthetic data generation and substrate setup, shared by the tests and
 * the benchmarks. All randomness is seeded for reproducibility.
 */
public final class Datasets {

    private Datasets() {}

    /** Default seed; vary per case by adding the width so widths differ. */
    public static final long SEED = 0x5EED_C0DEL;

    /** {@code count} unsigned values uniformly in {@code [0, 2^bitWidth)}. */
    public static int[] random(int count, int bitWidth, long seed) {
        RandomGenerator rng = RandomGeneratorFactory.of("L64X128MixRandom").create(seed);
        long mask = BitPackLE.mask(bitWidth);
        int[] v = new int[count];
        for (int i = 0; i < count; i++) {
            v[i] = (int) (rng.nextLong() & mask);
        }
        return v;
    }

    /**
     * Seeded random values already encoded into a padded buffer — the single
     * fixture-construction convention shared by the benchmark and the diagnostic
     * harness, so the two cannot drift on seed/encoding.
     */
    public static byte[] encodedRandom(int count, int bitWidth, long seed) {
        return BitPackLE.encode(random(count, bitWidth, seed), count, bitWidth);
    }

    /** Copy a padded heap buffer into a confined native segment of equal length. */
    public static MemorySegment toNativeSegment(byte[] padded, Arena arena) {
        MemorySegment seg = arena.allocate(padded.length, 64);
        MemorySegment.copy(padded, 0, seg, ValueLayout.JAVA_BYTE, 0, padded.length);
        return seg;
    }
}
