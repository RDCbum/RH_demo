# Legacy route status (exp/legacy_rebuild)

## What changed
- Added a legacy core that assumes the analytic A1 implication directly:
  `A1_from_supercritical ctx_real` (paper Lemma `a1-from-supercritical`,
  with optional Buchstab derivation).
- The legacy core no longer depends on a fixed-window threshold-control gap.

## Current remaining gaps
- The primary paper lemma `a1-from-supercritical` (analytic A1 bridge).
- Optional Buchstab derivation:
  `A1_from_supercritical_buchstab ctx_real` and `ExplicitBRhoExpression`
  (Lemmas `a1-from-supercritical-buchstab` and `buchstab-coefficient` in
  `arxiv_submission/ERURH_Conditional_Proof.tex`).
- Axioms shim remains as in the main route (paper/citable items).

## Evidence
- Legacy core: `lean/formal_proofs/ERURH/RH_Unconditional_Core_Legacy.lean`
- Assuming wrapper: `lean/formal_proofs/ERURH/RH_Unconditional_Assuming_Legacy.lean`
- Window helper (conditional): `lean/formal_proofs/ERURH/Alpha/CtxRealWindowCofinality.lean`

## Notes
This route removes the fixed-window gap by placing the analytic A1 implication
(`ERU_mode_beta β → A1_mode ctx_real`) as an explicit hypothesis, supplied by
Lemma `a1-from-supercritical` (with an optional Buchstab derivation).
