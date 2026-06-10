# Machine-code evidence: width-8/16 widening loop, SuperWord ON vs OFF

C2-compiled assembly (Intel syntax) of `ScalarWidenDecoder::decode` on the publication host
(7950X3D, OpenJDK 25.0.3), backing `../followup-superword-widen-disasm.md`.

Each file contains the **complete** set of compiled versions of that one method (C1 tier-3,
C2-OSR, C2 standard) and nothing else — unrelated JIT output (`String::hashCode`, etc.) from
the full PrintAssembly dump has been stripped. The extraction is mechanical:

```bash
awk '/^Compiled method/{keep=/ScalarWidenDecoder::decode/} keep{print}' results/asm/<mode>.asm
```

| file | mode | SuperWord |
|---|---|---|
| `widen8.decode.asm`       | width 8  | ON (default) |
| `widen8-nosw.decode.asm`  | width 8  | OFF (`-XX:-UseSuperWord`) |
| `widen16.decode.asm`      | width 16 | ON (default) |
| `widen16-nosw.decode.asm` | width 16 | OFF |

The hot loop is the C2 **standard** compile (`Compiled method (c2) … decode (131 bytes)`),
which is what the steady-state throughput benchmark executes.

## Regenerating the full dumps

Needs a JDK 25-compatible hsdis (the apt `libhsdis0-fcml` is wrong-ABI for JDK 25):

```bash
hsdis-build/build-hsdis.sh                       # builds hsdis-build/lib/hsdis-amd64.so (capstone)
LD_LIBRARY_PATH=hsdis-build/lib bash dump_asm.sh widen8        # -> results/asm/widen8.asm
LD_LIBRARY_PATH=hsdis-build/lib bash dump_asm.sh widen8 -nosw
```

No `perf` and no sudo are required for this (Level-1) disassembly.
