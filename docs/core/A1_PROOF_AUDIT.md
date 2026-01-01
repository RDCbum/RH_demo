# A1 proof audit (paper)

Status: paper-level proof, not formalized in Lean.

This note records a referee-oriented audit of the A1 derivation used in the
legacy window-free route.

## Statement
- Paper lemma: `a1-from-supercritical` in `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Section "No supercritical ERU modes").
- Lean predicate: `ERURH.A1_from_supercritical` and `ERURH.A1_mode` in
  `lean/formal_proofs/ERURH/ERURH_A2Hypotheses.lean`.

## Proof skeleton (with references)
1) **Supercritical mode input.**
   Assume a zero with beta > 1/2 and the ERU mode contribution to
   `logR_alpha^{mode}` in the explicit formula.
2) **Coefficient identification.**
   Use Assumption `assm:explicit` and the normalization in
   `arxiv_submission/ERURH_Conditional_Proof.tex` (Appendix
   "Normalization and Lean mapping for b_rho and H(s)") to identify the mode
   coefficient with
   `explicit_b_rho(rho) = pi^{-rho/2} * Gamma(rho/2)` (gamma prefactor),
   with any auxiliary holomorphic factors absorbed into `b_rho`.
3) **Nonvanishing of the kernel factor.**
   For the Buchstab kernel used in the alpha bridge data, the Mellin multiplier
   is `m(s) = (2^{-s} - 3^{-s})/s`, and Lemma `buchstab-m-nonzero` shows
   `m(rho) != 0` for Re(rho) > 0. Any remaining nonvanishing for auxiliary
   holomorphic weights is an analytic input in the preprint (H1--H3), not a
   separate Lean axiom.
4) **Window admissibility and RMS lower bound.**
   By the definition of admissible window families in the paper, one can choose
   a window with arbitrarily large base S, which yields the RMS lower bound
   required by `A1_mode`. This is the Step 4 argument in the paper's A1 section.
5) **Conclusion.**
   The lower bound implies `A1_mode`, hence the lemma `a1-from-supercritical`.

## Referee-sensitive points
- Exact mapping of the explicit-formula coefficient to `b_rho`, and the
  normalization used in the paper and Lean (Appendix normalization section).
- Nonvanishing of auxiliary holomorphic weights (preprint H1--H3) if used.
- Use of window admissibility and the exp-dominates-polynomial step inside the
  A1 section.

## Evidence map
- Paper lemma: `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma
  `a1-from-supercritical`).
- Buchstab multiplier: Lemma `buchstab-m-nonzero` in the same file.
- Normalization appendix: `arxiv_submission/ERURH_Conditional_Proof.tex`
  (Appendix "Normalization and Lean mapping for b_rho and H(s)").
