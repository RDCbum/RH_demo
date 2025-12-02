ERURH LS_γ and A1-mode Demonstrations
=====================================

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

2. A1-mode lemma (β > 1/2 ⇒ exploding RMS)
------------------------------------------
- Hypotheses: `ρ = β + iγ` with `β > 1/2` (H_(ρ)), mode contribution `J(s) = a e^{(ρ - 1)s}` (H_mode), ERU normalization `\tilde J(s) = a s^{-2} e^{(β - 1/2)s} e^{iγs}` (H_norm), and windows `[S, S+L]` with `1 ≪ L ≪ S^α`, 0 < α < 1 (H_range).
- Conclusion (refined): there exist `c > 0`, `S0 > 0` such that, for all `S ≥ S0` and `1 ≤ L ≤ S^α`,
  \[
    \mathrm{RMS}_0(S, L) := \sqrt{\frac{1}{L} \int_S^{S+L} |\tilde J(s)|^2 ds}
      \gtrsim c \frac{e^{(β - 1/2) S}}{S^2}.
  \]
- Proof sketch: `|\tilde J(s)|^2 = |a|^2 s^{-4} e^{2(β - 1/2)s}`; on `[S, S+L]` with `S` large, `s^{-4} ≳ S^{-4}` and `e^{2(β - 1/2)s} ≳ e^{2(β - 1/2)S}`; integrate to get `(1/L)∫|.|^2 ≳ |a|^2 S^{-4} e^{2(β - 1/2)S}` and take square roots.
- In Lean, `formal_proofs/ERURH/ERURH_ModeGrowthAlpha.lean` records an explicit bound with existential constants `S0, c0` of the form `(1/L) ∫ |mode_contrib|^2 ≤ c0 * exp(2(β-1/2)S) / S^4` under `S ≥ S0`, `1 ≤ L ≤ S^α`, marking the remaining analytic gap.

3. Integration in Plan B
------------------------
- The simple LS_γ lemma + `H_b` + ERU normalization yields A2-tail control.
- A1-mode + A2-low + A2-tail ⇒ `RMSLocalHypothesis`.
- Combined with gate closure and the master theorem, this provides the Plan B
  route to exclude `β > 1/2` modes and reach `RH xiAlpha`.
