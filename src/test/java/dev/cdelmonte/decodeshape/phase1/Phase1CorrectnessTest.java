/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;

import dev.cdelmonte.decodeshape.BitPackLE;
import dev.cdelmonte.decodeshape.Datasets;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

/**
 * The correctness harness the brief mandates BEFORE trusting any benchmark:
 * round-trip, three-way cross-validation, and the tail edge cases where bugs live.
 */
class Phase1CorrectnessTest {

    private static final ScalarArrayDecoder ARRAY = new ScalarArrayDecoder();
    private static final ScalarSegmentDecoder SEGMENT = new ScalarSegmentDecoder();
    private static final VectorSegmentDecoder VECTOR = new VectorSegmentDecoder();
    private static final ScalarWidenDecoder WIDEN = new ScalarWidenDecoder();
    private static final ParquetScalarDecoder PARQUET = new ParquetScalarDecoder();

    /** Every Phase 1 width crossed with lengths that stress lane and byte alignment. */
    static Stream<Arguments> cases() {
        // Lengths chosen around the vector lane count (16 on AVX-512) and small N,
        // plus a large size to exercise the steady-state vector loop.
        int[] lengths = {0, 1, 7, 8, 15, 16, 17, 31, 32, 33, 63, 64, 65, 127, 1000, 4096, 4097};
        List<Arguments> args = new ArrayList<>();
        for (int w : BitPackLE.PHASE1_WIDTHS) {
            for (int n : lengths) {
                args.add(Arguments.of(w, n));
            }
        }
        return args.stream();
    }

    @ParameterizedTest(name = "width={0} count={1}")
    @MethodSource("cases")
    void roundTripAndCrossValidate(int bitWidth, int count) {
        int[] original = Datasets.random(count, bitWidth, Datasets.SEED + bitWidth);
        byte[] packed = BitPackLE.encode(original, count, bitWidth);

        int[] outArray = new int[count];
        int[] outSegment = new int[count];
        int[] outVector = new int[count];

        ARRAY.decode(packed, count, bitWidth, outArray);

        try (Arena arena = Arena.ofConfined()) {
            MemorySegment seg = Datasets.toNativeSegment(packed, arena);
            SEGMENT.decode(seg, count, bitWidth, outSegment);
            VECTOR.decode(seg, count, bitWidth, outVector);
        }

        // Round-trip: decoded == original.
        assertArrayEquals(original, outArray, "scalar-array round-trip, width=" + bitWidth + " n=" + count);
        // Cross-validation: all three substrates/strategies agree exactly.
        assertArrayEquals(outArray, outSegment, "segment vs array, width=" + bitWidth + " n=" + count);
        assertArrayEquals(outArray, outVector, "vector vs array, width=" + bitWidth + " n=" + count);

        // The byte-aligned widening decoder must agree on the widths it handles.
        if (ScalarWidenDecoder.handles(bitWidth)) {
            int[] outWiden = new int[count];
            WIDEN.decode(packed, count, bitWidth, outWiden);
            assertArrayEquals(outArray, outWiden, "widen vs array, width=" + bitWidth + " n=" + count);
        }

        // External oracle: Parquet's own unpacker must agree with our layout — this
        // is what proves our fixed bit-packing IS byte-for-byte Parquet-compatible.
        int[] outParquet = new int[count];
        PARQUET.decode(packed, count, bitWidth, outParquet);
        assertArrayEquals(outArray, outParquet, "parquet vs array, width=" + bitWidth + " n=" + count);
    }

    /** Boundary sweep: lane_count +/- 1 across all widths, vector vs scalar truth. */
    @Test
    void laneBoundarySweep() {
        for (int w : BitPackLE.PHASE1_WIDTHS) {
            for (int n = 0; n <= 200; n++) {
                int[] original = Datasets.random(n, w, Datasets.SEED + 31L * w + n);
                byte[] packed = BitPackLE.encode(original, n, w);
                int[] truth = new int[n];
                ARRAY.decode(packed, n, w, truth);
                int[] vec = new int[n];
                try (Arena arena = Arena.ofConfined()) {
                    MemorySegment seg = Datasets.toNativeSegment(packed, arena);
                    VECTOR.decode(seg, n, w, vec);
                }
                assertArrayEquals(truth, vec, "vector mismatch at width=" + w + " n=" + n);
            }
        }
    }

    @Test
    void maxValueRoundTrips() {
        // All-ones values per width: catches mask/sign-extension bugs.
        for (int w : BitPackLE.PHASE1_WIDTHS) {
            int n = 100;
            int[] original = new int[n];
            int maxVal = (int) BitPackLE.mask(w);
            java.util.Arrays.fill(original, maxVal);
            byte[] packed = BitPackLE.encode(original, n, w);
            int[] out = new int[n];
            ARRAY.decode(packed, n, w, out);
            assertArrayEquals(original, out, "all-ones width=" + w);
        }
    }

    @Test
    void packedLengthIsParquetExact() {
        // 8 values of width w occupy exactly w bytes (no inter-value padding).
        for (int w = 1; w <= BitPackLE.MAX_WIDTH; w++) {
            assertEquals(w, BitPackLE.packedLength(8, w), "8 values, width=" + w);
        }
    }
}
