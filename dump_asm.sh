#!/usr/bin/env bash
# Dump the C2-compiled assembly of one decode path and scan for SIMD instructions.
# Needs hsdis in the JDK 25 lib (see README / install notes). Does NOT need perf.
#
# Usage: bash dump_asm.sh <mode> [-nosw]
#   mode ∈ { int13, long26, widen8, widen16 }
#   -nosw : add -XX:-UseSuperWord (to see what C2 does to the scalar without it)
set -euo pipefail
JDK25=/usr/lib/jvm/java-25-openjdk-amd64/bin/java
cd "$(dirname "$0")"

MODE="${1:-int13}"
EXTRA=""
TAG="$MODE"
if [[ "${2:-}" == "-nosw" ]]; then EXTRA="-XX:-UseSuperWord"; TAG="${MODE}-nosw"; fi

case "$MODE" in
  int13)   METHOD="*VectorSegmentDecoder.decodeIntLane" ;;
  long26)  METHOD="*VectorSegmentDecoder.decodeLongLane" ;;
  widen8|widen16) METHOD="*ScalarWidenDecoder.decode" ;;
  *) echo "mode ∈ {int13,long26,widen8,widen16}"; exit 2 ;;
esac

mkdir -p results/asm
OUT="results/asm/${TAG}.asm"

# Confirm hsdis is loadable; PrintAssembly silently degrades to "no disassembler" otherwise.
"$JDK25" --add-modules=jdk.incubator.vector -cp target/classes \
  -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly -XX:PrintAssemblyOptions=intel \
  -XX:CompileCommand=print,"$METHOD" $EXTRA \
  dev.cdelmonte.decodeshape.bench.Diag "$MODE" > "$OUT" 2>&1 || true

if grep -q "Could not load hsdis" "$OUT" || grep -q "PrintAssembly is enabled" "$OUT"; then
  echo "!! hsdis not loaded — install it first. See top of this script."
fi

echo "### $TAG -> $OUT  ($(wc -l < "$OUT") lines)"
echo "--- SIMD / shuffle instruction tally ---"
grep -oiE "vpermb|vpermt2b|vpshufb|vpsrlvd|vpsllvd|vpsrlvq|vpsrld|vpslld|vpand|vpor|vpmovzx|vpmovqd|vmovdqu8?|valign" "$OUT" \
  | tr 'A-Z' 'a-z' | sort | uniq -c | sort -rn || echo "(none found)"
