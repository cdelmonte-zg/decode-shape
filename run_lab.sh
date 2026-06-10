#!/usr/bin/env bash
#
# run_lab.sh — reproduce the whole decode-shape lab with one command.
#
# It: tunes the machine (governor + perf counters), builds and runs the
# correctness tests, runs the benchmark suite, verifies the measured numbers
# against the pre-registered findings, writes a dated Markdown report, and
# ALWAYS restores the previous environment on exit.
#
#   ./run_lab.sh                 # default profile (solid, ~15-20 min)
#   ./run_lab.sh --quick         # smoke run (1 fork, fast) — not article-grade
#   ./run_lab.sh --full          # article-grade (3 forks, 5 warmup + 5 measure x1s)
#   ./run_lab.sh --publication   # citable: 3 forks, 5x3s warmup + 10x1s measure, + perfnorm OFF
#   ./run_lab.sh --no-env        # don't touch governor/perf (no sudo); perfnorm skipped
#   ./run_lab.sh --no-restore    # leave the tuned environment in place afterwards
#   ./run_lab.sh -o /some/dir    # output base directory (default ./reports)
#
# Privileged steps (governor + perf_event_paranoid) escalate via sudo INTERNALLY
# through bench-system.sh, so do NOT run this whole script as root: run it as your
# normal user and answer the sudo prompt when it appears. Running the build as root
# would pollute ~/.m2 ownership.
#
# The environment is restored on success, on failure, and on Ctrl-C (unless
# --no-restore). Restore only runs if setup actually ran, so an aborted setup never
# leaves the machine in the wrong "fallback default" state.
set -euo pipefail

# ---- locate repo, pin JDK 25 -------------------------------------------------
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO"

JDK25_HOME="${JDK25_HOME:-/usr/lib/jvm/java-25-openjdk-amd64}"
JAVA="$JDK25_HOME/bin/java"
JAR="target/benchmarks.jar"
# The incubator vector module reaches the JMH forks through the benchmark's own
# @Fork(jvmArgsAppend = {"--add-modules=jdk.incubator.vector"}) annotation, which
# is the single source of truth. We deliberately do NOT pass --add-modules on the
# launcher: JMH replicates the launcher's args into the fork, so passing it here
# too would make the fork carry the flag twice.

# ---- defaults / arg parsing --------------------------------------------------
PROFILE="default"
DO_ENV=1
DO_RESTORE=1
OUTBASE="$REPO/reports"

usage() { sed -n '2,30p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; }

while [ $# -gt 0 ]; do
  case "$1" in
    --quick)       PROFILE="quick" ;;
    --full)        PROFILE="full" ;;
    --publication) PROFILE="publication" ;;
    --no-env)      DO_ENV=0 ;;
    --no-restore) DO_RESTORE=0 ;;
    -o|--out)     OUTBASE="${2:?-o needs a directory}"; shift ;;
    -h|--help)    usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; echo "try: $0 --help" >&2; exit 2 ;;
  esac
  shift
done

# FORKS | WARMUP iters x WARMUP_T s | ITERS measure x MEAS_T s
case "$PROFILE" in
  quick)       FORKS=1; WARMUP=2; WARMUP_T=1; ITERS=2;  MEAS_T=1 ;;  # smoke, fast
  default)     FORKS=2; WARMUP=3; WARMUP_T=1; ITERS=3;  MEAS_T=1 ;;  # reproduction / CI
  full)        FORKS=3; WARMUP=5; WARMUP_T=1; ITERS=5;  MEAS_T=1 ;;  # matches RESULTS.md
  publication) FORKS=3; WARMUP=5; WARMUP_T=3; ITERS=10; MEAS_T=1 ;;  # citable: long warmup
esac

STAMP="$(date +%Y-%m-%d_%H%M%S)"
RUN_DIR="$OUTBASE/run-$STAMP"
REPORT="$OUTBASE/decode-shape-report-$STAMP.md"
mkdir -p "$RUN_DIR"

# Save a full console log (banners, build, JMH, verify) to /tmp. Override the
# directory with LOG_DIR=/path. A known background `tee` drains a FIFO, so the
# log is complete (no truncated tail) and cleanup() can wait on it at exit. The
# sudo password prompt is read from the tty and is never captured.
LOG_DIR="${LOG_DIR:-/tmp}"
mkdir -p "$LOG_DIR"
LOGFILE="$LOG_DIR/decode-shape-run-$STAMP.log"
__logfifo="$(mktemp -u)"
mkfifo "$__logfifo"
tee -a "$LOGFILE" < "$__logfifo" &
__log_tee_pid=$!
exec > "$__logfifo" 2>&1
rm -f "$__logfifo"          # unlinked; tee keeps it open until we close our fds
echo "Logging this run to: $LOGFILE"

log() { printf '\n\033[1m== %s ==\033[0m\n' "$*"; }

# ---- guaranteed environment restore -----------------------------------------
DID_SETUP=0
RESTORED=0
cleanup() {
  local rc=$?
  # restore the environment (only if we tuned it, and only once)
  if [ "$DID_SETUP" = 1 ] && [ "$RESTORED" != 1 ]; then
    if [ "$DO_RESTORE" = 1 ]; then
      RESTORED=1
      echo "[env] restoring previous environment..." >&2
      ./bench-system.sh restore || echo "[env] WARNING: restore failed; check './bench-system.sh status'" >&2
    else
      echo "[env] left tuned (--no-restore). Run './bench-system.sh restore' when done." >&2
    fi
  fi
  # flush + close the console log LAST, so the summary and restore lines are saved
  if [ -n "${__log_tee_pid:-}" ]; then
    exec >&- 2>&- || true
    wait "$__log_tee_pid" 2>/dev/null || true
  fi
  return "$rc"
}
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

# ---- prerequisites -----------------------------------------------------------
log "Prerequisites"
fail=0
[ -x "$JAVA" ] || { echo "  MISSING: JDK 25 at $JAVA (set JDK25_HOME)"; fail=1; }
command -v mvn     >/dev/null || { echo "  MISSING: mvn"; fail=1; }
command -v python3 >/dev/null || { echo "  MISSING: python3"; fail=1; }
[ -f "$HOME/.m2/toolchains.xml" ] || echo "  WARN: ~/.m2/toolchains.xml not found; the JDK-25 toolchain build may fail."
if [ "$DO_ENV" = 1 ] && ! command -v cpupower >/dev/null; then
  echo "  MISSING: cpupower (needed for --env). Install: sudo apt install -y linux-tools-common linux-tools-generic"
  echo "           or re-run with --no-env to skip governor/perf tuning."
  fail=1
fi
[ "$fail" = 0 ] || { echo "Aborting: fix the above."; exit 1; }
echo "  ok: java=$JAVA  profile=$PROFILE (f=$FORKS wi=$WARMUP i=$ITERS)"

# ---- build + correctness tests (no env tuning needed) ------------------------
log "Build + correctness tests (JDK 25 toolchain)"
mvn -q -B clean package 2>&1 | tee "$RUN_DIR/build.log"
[ -f "$JAR" ] || { echo "build did not produce $JAR"; exit 1; }

# ---- tune environment --------------------------------------------------------
if [ "$DO_ENV" = 1 ]; then
  log "Tuning environment (governor=performance, perf unlocked) — sudo may prompt"
  ./bench-system.sh setup
  DID_SETUP=1
else
  log "Skipping env tuning (--no-env): throughput is indicative; perfnorm disabled"
fi

# ---- capture run-time environment metadata (governor as actually pinned) -----
GIT_DIRTY=no; [ -n "$(git status --porcelain 2>/dev/null)" ] && GIT_DIRTY=yes
{
  echo "stamp=$STAMP"
  echo "profile=$PROFILE"
  echo "forks=$FORKS"
  echo "warmup=$WARMUP"
  echo "warmup_t=$WARMUP_T"
  echo "iters=$ITERS"
  echo "meas_t=$MEAS_T"
  echo "env_tuned=$DID_SETUP"
  echo "host=$(uname -n)"
  echo "kernel=$(uname -r)"
  echo "cpu=$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2- | sed 's/^ *//')"
  echo "governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 2>/dev/null || echo '?')"
  echo "paranoid=$(cat /proc/sys/kernel/perf_event_paranoid 2>/dev/null || echo '?')"
  echo "jdk=$("$JAVA" -version 2>&1 | head -1 | tr -d '"')"
  echo "git_commit=$(git rev-parse --short HEAD 2>/dev/null || echo '?')"
  echo "git_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo '?')"
  echo "git_dirty=$GIT_DIRTY"
} > "$RUN_DIR/env.txt"

# ---- benchmark runs ----------------------------------------------------------
# scalar-widen only supports the byte-aligned widths 8/16, so it gets its own
# invocations limited to those widths and the main matrix excludes it. This keeps
# the log free of UnsupportedOperationException traces (no -foe crutch needed).
JMH_T=(-w "$WARMUP_T" -r "$MEAS_T" -wi "$WARMUP" -i "$ITERS" -f "$FORKS")

log "Run 1: throughput, SuperWord ON — main matrix (all widths, widen excluded)"
"$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
  -p decoder=scalar-array,scalar-segment,parquet-scalar,vector-segment \
  -bm thrpt "${JMH_T[@]}" \
  -rf json -rff "$RUN_DIR/thrpt-on.json" 2>&1 | tee "$RUN_DIR/thrpt-on.txt"

log "Run 1b: throughput, SuperWord ON — scalar-widen at its only valid widths (8/16)"
"$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
  -p decoder=scalar-widen -p bitWidth=8,16 \
  -bm thrpt "${JMH_T[@]}" \
  -rf json -rff "$RUN_DIR/thrpt-on-widen.json" 2>&1 | tee "$RUN_DIR/thrpt-on-widen.txt"

log "Run 2: throughput, SuperWord OFF — the SuperWord ON-vs-OFF story (scalar-array + scalar-widen, 8/16)"
"$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
  -p decoder=scalar-array,scalar-widen -p bitWidth=8,16 \
  -bm thrpt "${JMH_T[@]}" -jvmArgs "-XX:-UseSuperWord" \
  -rf json -rff "$RUN_DIR/thrpt-off.json" 2>&1 | tee "$RUN_DIR/thrpt-off.txt"

if [ "$DID_SETUP" = 1 ]; then
  log "Run 3: perfnorm (instructions/value) — the mechanism, needs perf counters"
  set +e
  "$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
    -p bitWidth=5,9,13,17,25,26 -p decoder=scalar-array,parquet-scalar,vector-segment \
    -bm thrpt -f 1 -wi 2 -i 3 -w 1 -r 1 -prof perfnorm \
    -rf json -rff "$RUN_DIR/perfnorm-main.json" 2>&1 | tee "$RUN_DIR/perfnorm-main.txt"
  pn1=${PIPESTATUS[0]}
  "$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
    -p bitWidth=8,16 -p decoder=scalar-array,scalar-widen,vector-segment \
    -bm thrpt -f 1 -wi 2 -i 3 -w 1 -r 1 -prof perfnorm \
    -rf json -rff "$RUN_DIR/perfnorm-w8.json" 2>&1 | tee "$RUN_DIR/perfnorm-w8.txt"
  pn2=${PIPESTATUS[0]}
  # SuperWord-OFF instruction count for scalar-widen: shows at the counter level
  # what the OFF speedup costs. Publication profile only (cheap, but extra).
  pn3=0
  pn4=0
  if [ "$PROFILE" = publication ]; then
    log "Run 3b: perfnorm, scalar-widen with SuperWord OFF (8/16)"
    "$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
      -p bitWidth=8,16 -p decoder=scalar-widen \
      -bm thrpt -f 1 -wi 2 -i 3 -w 1 -r 1 -prof perfnorm -jvmArgs "-XX:-UseSuperWord" \
      -rf json -rff "$RUN_DIR/perfnorm-w8-off.json" 2>&1 | tee "$RUN_DIR/perfnorm-w8-off.txt"
    pn3=${PIPESTATUS[0]}
    # SuperWord-OFF instruction count for parquet-scalar: its generated per-width
    # routine is not autovectorized, so the count must not move when SuperWord is off.
    log "Run 3c: perfnorm, parquet-scalar with SuperWord OFF — confirms it is not autovectorized"
    "$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
      -p bitWidth=5,9,13,17,26 -p decoder=parquet-scalar \
      -bm thrpt -f 1 -wi 2 -i 3 -w 1 -r 1 -prof perfnorm -jvmArgs "-XX:-UseSuperWord" \
      -rf json -rff "$RUN_DIR/perfnorm-parquet-off.json" 2>&1 | tee "$RUN_DIR/perfnorm-parquet-off.txt"
    pn4=${PIPESTATUS[0]}
  fi
  set -e
  if [ "${pn1:-1}" -ne 0 ] || [ "${pn2:-1}" -ne 0 ] || [ "${pn3:-0}" -ne 0 ] || [ "${pn4:-0}" -ne 0 ]; then
    echo "[perfnorm] WARNING: perf counters unavailable; mechanism checks will be SKIPPED."
  fi
else
  echo "[perfnorm] skipped (env not tuned)."
fi

# ---- Run 4: machine-code shape (disassembly + perfasm) ----------------------
# Different in kind from the numeric runs: it needs a JDK 25-compatible hsdis
# (apt's libhsdis0-fcml exports the wrong ABI symbol for JDK 25). Level-1
# disassembly needs no perf; the perfasm cycle attribution does, so it is gated
# on DID_SETUP exactly like perfnorm. Best-effort throughout: a missing hsdis or
# a failed build skips Run 4 and the structural checks SKIP (they never fail the
# run). lab_verify_report.py reads $RUN_DIR/asm/.
log "Run 4: machine-code shape — widening-loop disassembly (+ perfasm if env tuned)"
set +e
HSDIS_LIB="$REPO/hsdis-build/lib"
if [ ! -f "$HSDIS_LIB/hsdis-amd64.so" ]; then
  echo "[asm] building JDK 25-compatible hsdis (capstone)..."
  "$REPO/hsdis-build/build-hsdis.sh" >/dev/null 2>&1 \
    || echo "[asm] WARNING: hsdis build failed (needs libcapstone-dev + JDK source); Run 4 skipped."
fi
if [ -f "$HSDIS_LIB/hsdis-amd64.so" ]; then
  ASM_DIR="$RUN_DIR/asm"; mkdir -p "$ASM_DIR"
  # Level-1: full PrintAssembly (Intel), keep only the ScalarWidenDecoder::decode
  # nmethods. Diag warms the kernel so C2 compiles it; no perf needed.
  for w in 8 16; do
    for sw in on off; do
      swarg=(); [ "$sw" = off ] && swarg=(-XX:-UseSuperWord)
      LD_LIBRARY_PATH="$HSDIS_LIB" "$JAVA" --add-modules=jdk.incubator.vector -cp target/classes \
        -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly -XX:PrintAssemblyOptions=intel \
        -XX:CompileCommand=print,'*ScalarWidenDecoder.decode' "${swarg[@]}" \
        dev.cdelmonte.decodeshape.bench.Diag "widen$w" 2>/dev/null \
        | awk '/^Compiled method/{keep=/ScalarWidenDecoder::decode/} keep{print}' \
        > "$ASM_DIR/widen$w-$sw.decode.asm"
    done
  done
  echo "[asm] disassembly -> $ASM_DIR/widen{8,16}-{on,off}.decode.asm"
  # Positive control: the homogeneous int+int loop, which SuperWord DOES vectorize
  # (LoadI -> AddI -> StoreI, all 4-byte elements). Contrast with the widening dumps above.
  LD_LIBRARY_PATH="$HSDIS_LIB" "$JAVA" --add-modules=jdk.incubator.vector -cp target/classes \
    -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly -XX:PrintAssemblyOptions=intel \
    -XX:CompileCommand=print,'*Diag.homog' \
    dev.cdelmonte.decodeshape.bench.Diag homog 2>/dev/null \
    | awk '/^Compiled method/{keep=/Diag::homog/} keep{print}' \
    > "$ASM_DIR/homog.decode.asm"
  echo "[asm] positive control -> $ASM_DIR/homog.decode.asm"
  # Level-2: perfasm sampled-cycle attribution (needs perf).
  if [ "$DID_SETUP" = 1 ]; then
    for w in 8 16; do
      for sw in on off; do
        swarg=(); [ "$sw" = off ] && swarg=(-jvmArgs "-XX:-UseSuperWord")
        LD_LIBRARY_PATH="$HSDIS_LIB" "$JAVA" -jar "$JAR" Phase1UnpackBench.decode \
          -p decoder=scalar-widen -p bitWidth=$w -bm thrpt -f 1 -wi 3 -i 3 -w 1 -r 1 \
          -prof perfasm "${swarg[@]}" > "$ASM_DIR/perfasm-widen$w-$sw.txt" 2>&1
      done
    done
    echo "[asm] perfasm -> $ASM_DIR/perfasm-widen{8,16}-{on,off}.txt"
  else
    echo "[asm] perfasm skipped (env not tuned)."
  fi
else
  echo "[asm] Run 4 skipped (no hsdis)."
fi
set -e

# ---- verify + dated report ---------------------------------------------------
log "Verify measured numbers and write dated report"
set +e
python3 "$REPO/lab_verify_report.py" --run-dir "$RUN_DIR" --report "$REPORT"
VERIFY_RC=$?
set -e

echo
echo "Report:    $REPORT"
echo "Raw runs:  $RUN_DIR"
echo "Full log:  $LOGFILE"
[ "$VERIFY_RC" -eq 0 ] && echo "Verdict:   all checks reproduced." \
                       || echo "Verdict:   some checks did NOT reproduce (see report)."
# cleanup() runs here via the EXIT trap and restores the environment.
exit "$VERIFY_RC"
