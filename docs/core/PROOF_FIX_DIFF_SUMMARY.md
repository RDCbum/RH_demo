# Paper diff summary (A1/A2 consistency fix)

This note summarizes the changes applied to address the vacuity and consistency
issues highlighted during the referee-audit pass (see
`docs/core/REFEREE_AUDIT_CAPSULE.md`).

## What changed
- **A1/A2 assumptions** are now written as **inequalities**:
  A1 uses `RMS_mode(w) ≥ K`, A2-low/tail use `≤`, and RMS decomposition is
  `RMS_alpha ≥ RMS_mode − (RMS_low + RMS_tail)`.
  (Paper: `arxiv_submission/ERURH_Conditional_Proof.tex`, Assumption `assm:a1a2`.)
- **No-supercritical proposition** is now explicitly **conditional** on the
  A1/A2 bridges and the closed-gate certificates.
  (Paper: Proposition `prop:no-supercritical`.)
- **Main theorem proof** now references the conditional proposition rather than
  claiming “no modes” directly from A1/A2 + gate.
- **Fixed-window threshold control** and the discussion now use the **mode
  component** `logR_alpha^{mode}` for consistency with A1.

## Why this matters
These edits remove a potential vacuity (incompatible hypotheses implying
anything) and align the paper’s assumptions with the Lean formulation.

## References
- Paper: `arxiv_submission/ERURH_Conditional_Proof.tex`
- Audit capsule: `docs/core/REFEREE_AUDIT_CAPSULE.md`
