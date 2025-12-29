# Legacy route status (exp/legacy_rebuild)

## What changed
- Added a legacy core that assumes the analytic A1 implication directly:
  `A1_from_supercritical ctx_real`.
- The legacy core no longer depends on a fixed-window threshold-control gap.

## Current remaining gaps
- `A1_from_supercritical ctx_real` (analytic A1 lemma: supercritical mode ⇒ A1_mode).
- Axioms shim remains as in the main route (paper/citable items).

## Evidence
- Legacy core: `lean/formal_proofs/ERURH/RH_Unconditional_Core_Legacy.lean`
- Assuming wrapper: `lean/formal_proofs/ERURH/RH_Unconditional_Assuming_Legacy.lean`
- Window helper (conditional): `lean/formal_proofs/ERURH/Alpha/CtxRealWindowCofinality.lean`

## Notes
This route removes the fixed-window gap by placing the analytic A1 implication
(`ERU_mode_beta β → A1_mode ctx_real`) as an explicit hypothesis.
