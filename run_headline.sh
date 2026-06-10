#!/usr/bin/env bash
set -euo pipefail
JDK25=/usr/lib/jvm/java-25-openjdk-amd64/bin/java
JAR=target/benchmarks.jar
cd "$(dirname "$0")"
echo "### HEADLINE: full sweep, throughput+avgtime, fork=3"
"$JDK25" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench \
  -rf json -rff results/phase1.json 2>&1 | tee results/phase1.txt
echo "### AUTOVEC DISCIPLINE: SuperWord OFF, throughput only"
"$JDK25" --add-modules=jdk.incubator.vector -jar "$JAR" Phase1UnpackBench \
  -bm thrpt -jvmArgs "-XX:-UseSuperWord" \
  -rf json -rff results/phase1-nosuperword.json 2>&1 | tee results/phase1-nosuperword.txt
echo "### DONE"
