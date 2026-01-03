ERURH LS_γ and A1-mode Demonstrations
=====================================

Status: background note. For the authoritative A1/A2 bridges and route framing,
see `arxiv_submission/ERURH_Conditional_Proof.tex` and
`docs/core/RH_CLOSURE_CHECKLIST.md`.

1. Simple LS_γ lemma (Cauchy–Schwarz version)
---------------------------------------------
- For a finite family of heights `{γ_j}` and coefficients `{b_j}`, let
  `F(u) = Σ b_j e^{i γ_j u}`. Then for every `u`:
  \[
  |F(u)| \le \sum_j |b_j|,
  \]
  and hence for any `L > 0`:
  \[
  \frac{1}{L} \int_0^L |F(u)|\,du \le \sum_j |b_j|.
  \]
- Using Riemann–von Mangoldt, the count of indices in a band
  `T_1 < |γ_j| ≤ T_2` satisfies `#J ≲ (T_2 - T_1) \log T_2`, and combined with
  the ERU normalization (factors like `S^{-4}`), this suffices for the tail RMS
  control in A2-tail.
- In Lean: `LS_gamma_simple_pointwise` and its RMS version
  `LS_gamma_simple_RMS` live in `formal_proofs/ERURH/ERURH_LargeSieveGammaSketch.lean`.

2. A1-mode bridge (conditional on a supercritical mode)
-------------------------------------------------------
- Hypotheses: `ρ = β + iγ` with `β > 1/2`, a supercritical mode contribution
  `J(s) = a e^{(ρ - 1)s}`, ERU normalization
  `\tilde J(s) = a s^{-2} e^{(β - 1/2)s} e^{iγs}`, and admissible windows
  `[S, S+L]` with `1 ≪ L ≪ S^α`, 0 < α < 1.
- Conclusion: the paper A1 bridge (`a1-from-supercritical`) yields a witness
  window `w` with `RMS_mode(w) > C_env` under the supercritical mode hypothesis
  (`ERU_mode_beta β`). This is the conditional A1 used in the Plan B chain.
- The analytic core is the pointwise-to-RMS estimate derived from the mode term,
  which is recorded in `formal_proofs/ERURH/ERURH_ModeGrowthAlpha.lean` and
  feeds the paper-level A1 lemma.

3. Integration in Plan B
------------------------
- The simple LS_γ lemma + `H_b` + ERU normalization yields A2-tail control.
- The conditional A1 bridge + A2-low + A2-tail ⇒ `RMSLocalHypothesis`.
- Combined with gate closure and the master theorem, this provides the Plan B
  route to exclude `β > 1/2` modes and reach `RH xiAlpha`.
