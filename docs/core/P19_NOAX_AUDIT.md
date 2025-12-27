# P19 NOAX audit capsule

## Commands run
- `LAKE_JOBS=1 lake build ERURH` (log: `docs/core/P19_NOAX_BUILD.txt`)
- `python scripts/verify_gate.py` (log: `docs/core/P19_NOAX_GATE_FULL.txt`)
- `rg -n "^\s*(axiom|constant|opaque)\\b" lean/formal_proofs/ERURH` (log: `docs/core/P19_NOAX_SCAN_AXIOMS.txt`)
- `rg -n "\\b(sorry|admit)\\b" lean/formal_proofs/ERURH` (log: `docs/core/P19_NOAX_SCAN_SORRY.txt`)
- `lake env lean docs/core/PrintMasterAxioms.lean` (log: `docs/core/P19_PRINT_AXIOMS_MASTER.txt`)
- `lake env lean docs/core/PrintAxioms_Numeric.lean` (log: `docs/core/P19_PRINT_AXIOMS_UNCOND_ASSUMING.txt`)

## Scan results
- Axiom/constant/opaque scan: see `docs/core/P19_NOAX_SCAN_AXIOMS.txt` (expected: no matches).
- sorry/admit scan: see `docs/core/P19_NOAX_SCAN_SORRY.txt` (expected: no matches).

## Axioms footprint
- Master theorem axioms: `docs/core/P19_PRINT_AXIOMS_MASTER.txt`.
- Unconditional core axioms: `docs/core/P19_PRINT_AXIOMS_UNCOND_ASSUMING.txt`.

## Working tree
- `git status --porcelain` should be clean after commits.
