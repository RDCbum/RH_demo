# Referee summary (central)

This is the central referee-facing summary. The FAQ is now an index pointing
back here (see `docs/core/REFEREE_FAQ.md`).

## Status at a glance (conditional, hybrid)
- **Lean (formal core):** the logical chain to RH is fully formalized and
  compiles, with no project axioms.
- **Paper (analytic inputs):** A1 and A2 are proved in
  `arxiv_submission/ERURH_Conditional_Proof.tex`, with Theorems A/B/C proved in
  `arxiv_submission/Theorem_ABC_preprint.tex`.
- **Gate (numeric inputs):** certificates are regenerated and verified by
  `scripts/verify_gate.py`.
- **Bottom line:** conditional on the analytic lemmas and the numerical
  certificates, the Lean core yields RH for `xiAlpha`.

## Evidence map (where to look)

**Lean statements and axioms**
- `docs/core/P20_FINAL_STATEMENT.txt`
- `docs/core/P20_PRINT_AXIOMS_MASTER.txt`
- `docs/core/P20_PRINT_AXIOMS_UNCOND.txt`

**Paper proofs and assumptions**
- Main paper: `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Lemmas `a1-from-supercritical`, `a2-from-abc`, Theorems A/B/C statements).
- A/B/C proofs: `arxiv_submission/Theorem_ABC_preprint.tex`.
- A/B/C proof audit: `docs/core/ABC_PROOF_AUDIT.md`.
- Ledger: `arxiv_submission/assumptions_ledger.tex`.

**Gate evidence**
- `docs/core/POST_COMMIT_GATE_FULL.txt`
- `docs/core/P16_GATE_FULL.txt` (rms_mode bridge)
- `docs/core/P35_GATE_FULL.txt` (full pipeline)
 - Repro instructions: `docs/core/ERURH_HOWTO_Reproduce.md`
 - Bundle manifest (versions + hashes): `arxiv_submission/reproducibility_manifest.txt`

**Route documentation**
- `docs/core/LEGACY_WINDOW_FREE_PROOF_WALKTHROUGH.md`
- `docs/core/ROUTES_COMPARISON.md`
- Audit checklist: `docs/core/REFEREE_AUDIT_CHECKLIST.md`

## What is verified by the gate (computational certificates)

- Numeric artifacts regenerated and diff-checked:
  - `data/docs/paper/rational_bounds.json`
  - `data/docs/paper/certificate_values.json`
  - `data/docs/paper/rms_context.json`
  - `data/docs/paper/rms_mode_bridge.json`
  - `data/docs/paper/beta_certificate.json`
- Gate-certified side conditions:
  - `ctx_real_logR_alpha_upper` via `tools/check_rms_mode_bridge.py`
  - `ctx_real_rms_mode_ge_semantic` (numeric RMS lower-bounds semantic infimum),
    see `docs/core/P15_NOTES.md` and `docs/core/P15_GATE_FULL.txt`

## Trust boundary (explicit)
- Lean kernel + mathlib (formal logic).
- Python tooling in `tools/` + `scripts/verify_gate.py` (certificate generation/checking).
- OS arithmetic and `tar`/PowerShell for packaging.

## Reproduction commands (single block)

```bash
python tools/make_rational_bounds.py
python tools/make_certificate_values.py
python tools/make_rms_context.py
python tools/make_rms_mode_bridge.py
python tools/make_beta_certificate.py

LAKE_JOBS=1 lake build ERURH
python scripts/verify_gate.py

lake env lean docs/core/PrintFinalStatement.lean > docs/core/NOAX_FINAL_STATEMENTS.txt
lake env lean docs/core/PrintGapStatements.lean > arxiv_submission/lean_gap_statements.txt
lake env lean docs/core/PrintMasterAxioms.lean > arxiv_submission/lean_master_axioms.txt

./scripts/make_arxiv_bundle.ps1
```
