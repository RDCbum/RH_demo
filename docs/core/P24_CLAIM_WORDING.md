# P24 Claim Wording (end-to-end closure)

## Suggested claim

Conditional RH for the ERURH alpha layer follows from:
1) a formally checked Lean proof of the logical chain,
2) computational certificates verified by the gate (numeric RMS context and the
   `ctx_real_logR_alpha_upper` interval arithmetic check), and
3) the analytic lemmas stated in the paper (A1-from-supercritical and
   A2-from-ABC, together with the classical A/B/C packages). The Buchstab
   bridge provides an optional derivation of A1, and the fixed-window route
   is an alternative paper-level bridge if the threshold-control lemma is
   established.

Equivalently: if the paper-level assumptions hold and the gate checks pass, then
the Lean development proves `ERURH.RH_from_ERURH_conditional` and the Route B
unconditional core.

For the canonical referee-facing summary, see `docs/core/P27_REFEREE_PACKET.md`.

## Trust boundary

- Lean kernel + mathlib for proof checking.
- Gate scripts in `tools/` and `scripts/verify_gate.py`.
- Python numerical stack (notably `mpmath` interval arithmetic) used by
  `tools/check_rms_mode_bridge.py`.
- The frozen data in `data/releases/erurh-v2-core/formal/` and its regenerated
  Lean mirrors under `lean/formal_proofs/ERURH/`.
