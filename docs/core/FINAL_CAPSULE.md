# Final capsule (status + logs + references)

This capsule records the current status, reproducibility logs, and key references
for the ERURH demo.

## Commands executed
- `LAKE_JOBS=1 lake build ERURH`
- `python scripts/verify_gate.py`
- `lake env lean docs/core/PrintFinalStatement.lean > docs/core/FINAL_STATEMENTS.txt`
- `lake env lean docs/core/PrintGapStatements.lean > docs/core/FINAL_GAP_STATEMENTS.txt`
- `lake env lean docs/core/PrintMasterAxioms.lean > docs/core/FINAL_PRINT_AXIOMS_MASTER.txt`
- `lake env lean docs/core/PrintAxioms_Numeric.lean > docs/core/FINAL_PRINT_AXIOMS_UNCOND.txt`

## Logs
- Build: `docs/core/FINAL_BUILD.txt`
- Gate (full): `docs/core/FINAL_GATE_FULL.txt`

## Lean exports (local capsule)
- Final statements: `docs/core/FINAL_STATEMENTS.txt`
- Gap statements: `docs/core/FINAL_GAP_STATEMENTS.txt`
- Master axioms: `docs/core/FINAL_PRINT_AXIOMS_MASTER.txt`
- Unconditional axioms: `docs/core/FINAL_PRINT_AXIOMS_UNCOND.txt`

## Paper + preprint
- Main paper: `arxiv_submission/ERURH_Conditional_Proof.tex`
- A/B/C preprint: `arxiv_submission/Theorem_ABC_preprint.tex`

## ArXiv bundle
- Tarball: `dist/arxiv_submission.tar.gz`
- Tar listing: `docs/core/ARXIV_TARBALL_LIST.txt`

## Current gap index
- Lean-exported gaps: `docs/core/FINAL_GAP_STATEMENTS.txt`
- Closure checklist: `docs/core/RH_CLOSURE_CHECKLIST.md`
