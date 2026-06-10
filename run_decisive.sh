#!/usr/bin/env bash
# Decisive run: tests H1 (resistance map) vs H2 (inverted) vs H0 (shelf).
# Throughput only (enough for both readable signals); two configs:
#   - default C2 (SuperWord on)
#   - SuperWord off (so scalar-widen ON-vs-OFF gives signal 1: did C2 vectorize it)
# Run AFTER pinning: sudo cpupower frequency-set -g performance
set -euo pipefail
JDK25=/usr/lib/jvm/java-25-openjdk-amd64/bin/java
JAR=target/benchmarks.jar
cd "$(dirname "$0")"
mkdir -p results

GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null || echo unknown)
echo "### governor at run time: $GOV"

echo "### DECISIVE: throughput, SuperWord ON (default), full width matrix"
"$JDK25" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench \
  -bm thrpt -rf json -rff results/phase1-decisive.json 2>&1 | tee results/phase1-decisive.txt

echo "### DECISIVE: throughput, SuperWord OFF (isolates C2 autovec on scalar-widen)"
"$JDK25" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench \
  -bm thrpt -jvmArgs "-XX:-UseSuperWord" \
  -rf json -rff results/phase1-decisive-nosw.json 2>&1 | tee results/phase1-decisive-nosw.txt

echo "### DONE (governor was: $GOV)"
