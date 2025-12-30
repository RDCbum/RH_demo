# Route Comparison: Fixed-Window vs Buchstab (Experimental)

This note compares the two Route B bridges currently maintained in the repo.
Both routes share the same Lean core (Plan B, gates, certificates) and differ
only in the analytic bridge used to turn a supercritical mode into an A1-style
RMS lower bound.

## Summary table

| Route | Lean gap (primary) | Paper anchor | Gate anchor | Notes |
| --- | --- | --- | --- | --- |
| Main (fixed-window) | `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily` | Assumption `assm:threshold-control` (No supercritical ERU modes) | `tools/check_rms_context.py` + `tools/check_rms_mode_bridge.py` | Requires window compatibility with a fixed ctx_real window family. |
| Experimental (Buchstab) | `ERURH.A1_from_supercritical_buchstab ctx_real` + `ERURH.ExplicitBRhoExpression` | Lemmas `a1-from-supercritical-buchstab` and `buchstab-coefficient` | None (analytic) | Avoids fixed-window cofinality by using an explicit-formula factorization. |

## Main route (fixed-window)

- Lean bridge: `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`
  (`lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:34`).
- Gate side conditions: `ctx_real_logR_alpha_upper` and `windowMinMax >= s0`
  (see `tools/check_rms_mode_bridge.py`, `tools/check_rms_context.py`).
- Paper reference: Assumption `assm:threshold-control` in
  `arxiv_submission/ERURH_Conditional_Proof.tex`.

Procedure (main route):
1) Run `python scripts/verify_gate.py` to regenerate and check all gate artifacts.
2) Ensure the fixed-window hypothesis appears in `arxiv_submission/lean_gap_statements.txt`.
3) Cite Assumption `assm:threshold-control` for the analytic bridge in the paper.

## Experimental route (Buchstab)

- Lean bridge: `ERURH.A1_from_supercritical_buchstab ctx_real` and
  `ERURH.ExplicitBRhoExpression` from
  `lean/formal_proofs/ERURH/ERURH_A1_BuchstabBridge.lean`.
- Paper references: Lemmas `a1-from-supercritical-buchstab` and
  `buchstab-coefficient` in `arxiv_submission/ERURH_Conditional_Proof.tex`.
- The coefficient non-vanishing (`ERURH.BuchstabCoefficientNonzero`) is derived
  in Lean from `ERURH.ExplicitBRhoExpression` via
  `buchstab_coefficient_nonzero_of_explicit_b_rho_expr`.

Procedure (Buchstab route):
1) Export gaps with `docs/core/PrintGapStatements.lean` and confirm
   `ERURH.A1_from_supercritical_buchstab` and `ERURH.ExplicitBRhoExpression`.
2) Provide the paper lemmas `a1-from-supercritical-buchstab` and
   `buchstab-coefficient` with the explicit-formula identification.
3) Run the same gate pipeline for numeric certificates (shared with main route).

## Shared infrastructure

- Both routes depend on the same Lean core (Plan B) and the same gate data.
- Both routes keep the master theorem footprint to Lean core axioms only.
- The difference is only in the analytic bridge used for A1.
