# Referee Risk Assessment (qualitative)

Scope: this note provides a qualitative risk profile for referee acceptance.
It is not a proof; it summarizes where scrutiny is most likely and why.

Legend:
- Low: standard, well-contained, unlikely to trigger objections.
- Medium: plausible reviewer questions; requires clear references.
- High: most likely point of contention.

## 1) Lean formal core (logic + axioms)
- Risk: Low
- Why: `lake build ERURH` passes; `#print axioms` shows only Lean kernel axioms.
- Evidence: `docs/core/FINAL_BUILD.txt`, `arxiv_submission/lean_master_axioms.txt`.

## 2) Gate reproducibility (numeric certificates)
- Risk: Medium-Low (computational trust)
- Why: reproducible pipeline with frozen inputs + manifest; interval arithmetic for
  `ctx_real_logR_alpha_upper` reduces numerical fragility.
- Evidence: `docs/core/FINAL_GATE_FULL.txt`,
  `arxiv_submission/reproducibility_manifest.txt`,
  `tools/check_rms_mode_bridge.py`.

## 3) A/B/C analytic packages
- Risk: Medium
- Why: classical results, but the package relies on careful normalization of
  coefficients and explicit-formula hypotheses (H1-H3).
- Evidence: `arxiv_submission/Theorem_ABC_preprint.tex`,
  `docs/core/ABC_PROOF_AUDIT.md`, references in the preprint.

## 4) A2 derivation from A/B/C
- Risk: Low-Medium
- Why: once A/B/C are accepted, the A2 tail/low derivation is routine.
- Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`).

## 5) A1 (legacy window-free) lemma
- Risk: Medium-High (most sensitive)
- Why: requires a clean chain from supercritical mode to an RMS lower bound,
  including coefficient identification and window admissibility.
- Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Lemma `a1-from-supercritical`) and `docs/core/A1_PROOF_AUDIT.md`.

## 6) Explicit-formula mapping and auxiliary holomorphic factors
- Risk: Medium
- Why: relies on the explicit-formula normalization (gamma prefactor) and the
  preprint-level nonvanishing of auxiliary holomorphic factors absorbed into
  $b_\rho$.
- Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Assumption `assm:explicit`, Appendix "Buchstab kernel factor for the alpha bridge").

## 7) Fixed-window alternative route
- Risk: High if used
- Why: the threshold-control lemma remains an explicit analytic gap.
- Evidence: `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Assumption `assm:threshold-control`).

## Bottom line
The submission is strongest as a conditional/hybrid proof:
Lean formalizes the logic; the gate certifies numerics; the paper carries the
analytic proofs. The most referee-sensitive point is A1 (legacy window-free).

## What most increases acceptance
- Tighten the A1 proof narrative (explicit window admissibility and exp-domination step).
- Keep the explicit-formula normalization and kernel factor mapping front-and-center.
- Emphasize reproducibility and independent auditability of gate checks.
