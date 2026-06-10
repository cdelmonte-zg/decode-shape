#!/usr/bin/env bash
set -euo pipefail
J=/usr/lib/jvm/java-25-openjdk-amd64/bin/java
JAR=target/benchmarks.jar
cd "$(dirname "$0")"; mkdir -p results
echo "### governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
echo "### A) THROUGHPUT: parquet-scalar vs scalar-array vs vector, all widths"
"$J" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench.decode \
  -p decoder=scalar-array,parquet-scalar,vector-segment -bm thrpt -f 2 -wi 3 -i 4 -w 1 -r 1 \
  -rf json -rff results/anchor-thrpt.json 2>&1 | tee results/anchor-thrpt.txt | grep -E "Benchmark|parquet|scalar-array|vector" | grep -vE "tryInit|jmhTest"
echo "### B) PERFNORM insns/value: discriminating widths 5/9/13/17/26"
"$J" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench.decode \
  -p bitWidth=5,9,13,17,26 -p decoder=scalar-array,parquet-scalar,vector-segment \
  -bm thrpt -f 1 -wi 2 -i 3 -w 1 -r 1 -prof perfnorm 2>&1 | tee results/anchor-perfnorm.txt \
  | grep -E "decode:(instructions|IPC)\b"
echo "### C) parquet-scalar SuperWord ON vs OFF (does C2 vectorize it at irregular widths?)"
for sw in "" "-XX:-UseSuperWord"; do
  tag=$([ -z "$sw" ] && echo ON || echo OFF)
  "$J" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench.decode \
    -p bitWidth=5,13,17 -p decoder=parquet-scalar -bm thrpt -f 1 -wi 2 -i 3 -w 1 -r 1 \
    ${sw:+-jvmArgs "$sw"} 2>&1 | grep -E "parquet-scalar" | grep -vE "tryInit|jmhTest" | sed "s/$/  [SW=$tag]/"
done
echo "### DONE"
