# Route Comparison: Legacy Window-Free (Primary) vs Fixed-Window (Alternative)

This note compares the two Route B bridges currently maintained in the repo.
Both routes share the same Lean core (Plan B, gates, certificates) and differ
only in the analytic bridge used to turn a supercritical mode into an A1-style
RMS lower bound. The paper narrative treats the legacy window-free route as
primary; the fixed-window route is an alternative, and the Buchstab bridge is
optional.

## Summary table

| Route | Lean gap (primary) | Paper anchor | Gate anchor | Notes |
| --- | --- | --- | --- | --- |
| Primary (legacy window-free) | `ERURH.A1_from_supercritical ctx` + A2 | Lemmas `a1-from-supercritical`, `a2-from-abc` | None (analytic) | Uses an abstract RMS context with admissible windows. |
| Alternative (fixed-window) | `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily` | Assumption `assm:threshold-control` (No supercritical ERU modes) | `tools/check_rms_context.py` + `tools/check_rms_mode_bridge.py` | Ties the bridge to the concrete ctx_real window family. |

## Primary route (legacy window-free)

- Lean bridge: `ERURH.A1_from_supercritical` in
  `lean/formal_proofs/ERURH/A1FromSupercriticalMode_Legacy.lean`.
- Paper reference: Lemma `a1-from-supercritical` in
  `arxiv_submission/ERURH_Conditional_Proof.tex`, with A2 from Lemma `a2-from-abc`.
- Gate: only needed if instantiating a concrete context with certificates.

## Alternative route (fixed-window)

- Lean bridge: `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`
  (`lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge_Legacy.lean:34`).
- Gate side conditions: `ctx_real_logR_alpha_upper` and `windowMinMax >= s0`
  (see `tools/check_rms_mode_bridge.py`, `tools/check_rms_context.py`).
- Paper reference: Assumption `assm:threshold-control` in
  `arxiv_submission/ERURH_Conditional_Proof.tex`.
  The paper includes a proof outline; a full proof is deferred.

Procedure (alternative route):
1) Run `python scripts/verify_gate.py` to regenerate and check all gate artifacts.
2) Ensure the fixed-window hypothesis appears in `arxiv_submission/lean_gap_statements.txt`.
3) Cite Assumption `assm:threshold-control` for the analytic bridge in the paper.

## Optional analytic derivation (Buchstab bridge)

- Lean bridge: `ERURH.A1_from_supercritical_buchstab ctx_real` and
  `ERURH.ExplicitBRhoExpression` from
  `lean/formal_proofs/ERURH/ERURH_A1_BuchstabBridge.lean`.
- Paper references: Lemmas `a1-from-supercritical-buchstab` and
  `buchstab-coefficient` in `arxiv_submission/ERURH_Conditional_Proof.tex`.
- The coefficient non-vanishing is derived in Lean from
  `ERURH.ExplicitBRhoExpression` via
  `buchstab_coefficient_nonzero_of_explicit_b_rho_expr`.

Procedure (Buchstab derivation):
1) Export gaps with `docs/core/PrintGapStatements.lean` and confirm
   `ERURH.A1_from_supercritical_buchstab` and `ERURH.ExplicitBRhoExpression`.
2) Provide the paper lemmas `a1-from-supercritical-buchstab` and
   `buchstab-coefficient` with the explicit-formula identification.
3) Run the same gate pipeline for numeric certificates (shared with main route).

## Shared infrastructure

- Both routes depend on the same Lean core (Plan B) and the same gate data.
- Both routes keep the master theorem footprint to Lean core axioms only.
- The difference is only in the analytic bridge used for A1.
