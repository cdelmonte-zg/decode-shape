/*
 * decode-shape — a benchmark lab, not a library.
 */
package dev.cdelmonte.decodeshape.phase1;

import dev.cdelmonte.decodeshape.BitPackLE;
import java.lang.foreign.MemorySegment;
import org.apache.parquet.column.values.bitpacking.BytePacker;
import org.apache.parquet.column.values.bitpacking.Packer;

/**
 * External anchor: {@code parquet-java}'s <em>real</em> generated fixed-shift
 * scalar unpacker ({@code Packer.LITTLE_ENDIAN.newBytePacker(w).unpack8Values}).
 * This is one of Parquet Java's generated per-width specialized scalar
 * implementations that PARQUET-2159 benchmarks against — measured here, not deduced.
 *
 * <p>It is the fair, autovectorization-friendly scalar baseline at <em>all</em>
 * widths (fixed per-position shifts, 8 values/block), so it answers the question
 * the in-lab {@link ScalarWidenDecoder} could only answer at 8/16: at the
 * irregular widths (5/9/13/17), does C2 already vectorize the fixed-shift scalar
 * — i.e. does explicit Vector stay redundant there too (H2-broad), or does it
 * genuinely earn its place (H2-narrow)?
 *
 * <h2>Substrate caveat — read it</h2>
 * Parquet runs on {@code byte[]}/{@code ByteBuffer}, never {@code MemorySegment}.
 * This decoder is therefore an anchor on a <em>separate, explicitly-labelled
 * axis</em>, not a row in the constant-substrate primary comparison. Comparing
 * its absolute throughput to the MemorySegment decoders mixes substrate with
 * algorithm; the legitimate read is its *instructions/value* (autovectorized or
 * not) and its scaling shape across widths.
 */
public final class ParquetScalarDecoder implements Phase1Decoder {

    @Override
    public String name() {
        return "parquet-scalar";
    }

    @Override
    public void decode(byte[] src, int count, int bitWidth, int[] out) {
        BitPackLE.checkWidth(bitWidth);
        BytePacker packer = Packer.LITTLE_ENDIAN.newBytePacker(bitWidth);
        int fullBlocks = count >>> 3;            // unpack8Values handles 8 at a time
        int bytePos = 0;
        int valueIndex = 0;
        for (int b = 0; b < fullBlocks; b++) {
            packer.unpack8Values(src, bytePos, out, valueIndex);
            bytePos += bitWidth;                 // 8 values occupy exactly bitWidth bytes
            valueIndex += 8;
        }
        // Tail of < 8 values: Parquet's higher level uses a temp buffer; we just
        // finish with the lab's own single-value decode (already cross-validated).
        long mask = BitPackLE.mask(bitWidth);
        for (int i = valueIndex; i < count; i++) {
            out[i] = BitPackLE.decodeOne(src, i, bitWidth, mask);
        }
    }

    @Override
    public void decode(MemorySegment src, int count, int bitWidth, int[] out) {
        throw new UnsupportedOperationException(
                "parquet-scalar is the byte[]-substrate anchor; it does not read MemorySegment");
    }
}
