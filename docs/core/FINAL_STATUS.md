# Final Status Capsule (current main)

This file is a compact, auditable index of the current state of the ERURH
demo. It is intended to be read alongside the arXiv bundle and the Lean/gate
artifacts.

## Summary
- The Lean core is fully formalized and builds without project axioms.
- The primary Route B bridge is the legacy window-free path (A1 and A2 proved in
  the paper); the fixed-window bridge remains an explicit analytic gap.
- Numeric certificates and RMS bridge checks are verified by the gate.

## Paper status
- Main paper: `arxiv_submission/ERURH_Conditional_Proof.tex`
  - A1 (legacy window-free): Lemma `a1-from-supercritical` (full proof).
  - A2: Lemma `a2-from-abc` (full proof), using Theorems A/B/C.
  - Fixed-window threshold control: Assumption `assm:threshold-control`
    (analytic gap discussion).
  - Explicit-formula normalization includes H(rho) != 0 (Assumption
    `assm:explicit`).
- A/B/C proofs: `arxiv_submission/Theorem_ABC_preprint.tex`.
- A1 audit: `docs/core/A1_PROOF_AUDIT.md`.

## Lean status and axiom footprints
- Final statements: `docs/core/POST_MERGE_FINAL_STATEMENTS.txt`.
- Master axioms: `docs/core/POST_MERGE_PRINT_AXIOMS_MASTER.txt`.
- Unconditional core axioms: `docs/core/POST_MERGE_PRINT_AXIOMS_UNCOND.txt`.

## Gate and reproducibility
- Build log: `docs/core/POST_MERGE_BUILD.txt`.
- Gate log: `docs/core/POST_MERGE_GATE_FULL.txt`.
- Repro guide: `docs/core/ERURH_HOWTO_Reproduce.md`.
- Manifest (versions + hashes): `arxiv_submission/reproducibility_manifest.txt`.

## Recent commands (capsule)
```bash
LAKE_JOBS=1 lake build ERURH
python scripts/verify_gate.py
lake env lean docs/core/PrintFinalStatement.lean > docs/core/NOAX_FINAL_STATEMENTS.txt
lake env lean docs/core/PrintGapStatements.lean > arxiv_submission/lean_gap_statements.txt
lake env lean docs/core/PrintMasterAxioms.lean > arxiv_submission/lean_master_axioms.txt
./scripts/make_arxiv_bundle.ps1
```

## Bundle snapshot
- Tarball: `dist/arxiv_submission.tar.gz`.
- Listing: `docs/core/ARXIV_TARBALL_LIST.txt`.

## Current gaps (explicit)
- Fixed-window analytic gap: `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`
  (see `docs/core/RH_CLOSURE_CHECKLIST.md`).
- Optional Buchstab bridge remains a paper-level derivation.

## Central maps
- Assumptions ledger: `docs/core/ASSUMPTIONS_LEDGER.md` and
  `arxiv_submission/assumptions_ledger.tex`.
- Referee summary: `docs/core/P27_REFEREE_PACKET.md`.
- Closure checklist: `docs/core/RH_CLOSURE_CHECKLIST.md`.
