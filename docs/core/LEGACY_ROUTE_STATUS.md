# Legacy route status (exp/legacy_rebuild)

## What changed
- Added a legacy core that assumes the analytic A1 implication directly:
  `A1_from_supercritical ctx_real` (now derived from
  `A1_from_supercritical_buchstab` plus `ExplicitBRhoExpression`).
- The legacy core no longer depends on a fixed-window threshold-control gap.

## Current remaining gaps
- `A1_from_supercritical_buchstab ctx_real` and `ExplicitBRhoExpression`
  (analytic A1 bridge; Lemmas `a1-from-supercritical-buchstab` and
  `buchstab-coefficient` in `arxiv_submission/ERURH_Conditional_Proof.tex`).
- Axioms shim remains as in the main route (paper/citable items).

## Evidence
- Legacy core: `lean/formal_proofs/ERURH/RH_Unconditional_Core_Legacy.lean`
- Assuming wrapper: `lean/formal_proofs/ERURH/RH_Unconditional_Assuming_Legacy.lean`
- Window helper (conditional): `lean/formal_proofs/ERURH/Alpha/CtxRealWindowCofinality.lean`

## Notes
This route removes the fixed-window gap by placing the analytic A1 implication
(`ERU_mode_beta β → A1_mode ctx_real`) as an explicit hypothesis, derived from
the Buchstab bridge in the current paper.
