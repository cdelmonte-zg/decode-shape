#!/usr/bin/env bash
# Build a JDK 25-compatible hsdis (capstone backend) for readable PrintAssembly/perfasm.
#
# Why: the apt package libhsdis0-fcml exports the OLD ABI symbol `decode_instructions`,
# but JDK 25 requires `decode_instructions_virtual`. So PrintAssembly degrades to a byte
# dump. This builds a capstone-backed hsdis that exports the new symbol.
#
# Prereqs already present on the bench host (no sudo needed):
#   - libcapstone.so + /usr/include/capstone/capstone.h  (capstone runtime + headers)
#   - gcc, git
#   - JDK 25 at $JDK (for jni.h and to run with)
#
# Usage:  ./build-hsdis.sh        -> produces lib/hsdis-amd64.so
# Then point the JVM at it via:  LD_LIBRARY_PATH=$PWD/lib java ...
set -euo pipefail
cd "$(dirname "$0")"

JDK=${JDK:-/usr/lib/jvm/java-25-openjdk-amd64}
SRC=jdk/src/utils/hsdis

# 1) Fetch ONLY src/utils/hsdis from the JDK 25 GA tag (sparse, blob-filtered).
if [ ! -d "$SRC" ]; then
  rm -rf jdk
  git clone --depth 1 --filter=blob:none --sparse \
    https://github.com/openjdk/jdk.git -b jdk-25-ga jdk
  ( cd jdk && git sparse-checkout set src/utils/hsdis )
fi

# 2) Compile the capstone backend into hsdis-amd64.so.
#    CAPSTONE_ARCH/MODE are normally injected by `configure`; for x86-64 they are fixed.
#    hsdis.h pulls in jni.h, hence the JDK include paths.
mkdir -p lib
gcc -O2 -fPIC -shared \
  -I/usr/include/capstone -I"$SRC" \
  -I"$JDK/include" -I"$JDK/include/linux" \
  -DCAPSTONE_ARCH=CS_ARCH_X86 \
  -DCAPSTONE_MODE=CS_MODE_64 \
  "$SRC/capstone/hsdis-capstone.c" \
  -lcapstone \
  -o lib/hsdis-amd64.so

# 3) Sanity: the JDK 25-required symbol must be exported.
if ! nm -D lib/hsdis-amd64.so | grep -q 'decode_instructions_virtual'; then
  echo "ERROR: decode_instructions_virtual not exported" >&2
  exit 1
fi
echo "OK: lib/hsdis-amd64.so (exports decode_instructions_virtual)"
echo "Use it with:  LD_LIBRARY_PATH=$PWD/lib $JDK/bin/java -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly ..."
