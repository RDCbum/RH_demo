ERURH: Pointwise Bound Program for \(H_b\)
==========================================

Objective
---------
Specify the pointwise decay targeted for the explicit-formula coefficients \(b_\rho\):
\[
  |b_\rho| \le C (1+|\gamma|)^{-(1-\varepsilon)}, \quad \beta>1/2,\ \varepsilon>0.
\]
In Lean, `H_b_pointwise` asserts existence of such \(C,\varepsilon\); it should connect to the explicit representation in `HbExplicitData`.

Analytic decomposition
----------------------
**Step A.** Using `HbExplicitData`, write
\[
  b_\rho = \text{prefactor}_1(\rho)\,\text{prefactor}_2(\rho)\,\text{kernelERU}(\rho),
\]
with prefactors from the explicit formula (Γ, \(\pi^{-\rho/2}\), possibly ζ′/ζ) and `kernelERU` from ERU normalization (\(e^{s/2}/s^2\) in \(\widetilde J_\alpha\)).

**Step B.** Separate sources:
- Classical prefactors: \(\Gamma(\rho/2)\), \(\pi^{-\rho/2}\), ζ′/ζ (if present).
- ERU normalization: factors \(e^{(\rho-1/2)s}\), divisions by \(s^2\) in \(\widetilde J_\alpha\).
- Test function / kernel regularization.

**Step C.** Expected bounds:
- Stirling: \(|\Gamma(\sigma+i\gamma)| \asymp |\gamma|^{\sigma-1/2} e^{-\pi|\gamma|/2}\) in the strip.
- Bounds on ζ′/ζ and zero-free regions for \(\Re s \ge 1/2+\varepsilon\).
- Conclude prefactor decay like \((1+|\gamma|)^{-(1-\varepsilon)}\) (or a coarse \((1+|\gamma|)^{-B}\) intermediate).

External dependencies
---------------------
- From `ClassicalZetaAssumptions`: explicit formula in the strip, bounds on ζ/ζ′, zero-free regions / zero density.
- From mathlib/classical analysis: Stirling for Γ, bounds for \(\pi^{-\rho/2}\).

Relation to `H_b_L2_tail`
-------------------------
The pointwise bound combines with Riemann–von Mangoldt / zero density to yield
\(\sum_{|\gamma|>T} |b_\rho|^2 \ll (\log T)^A\) (`H_b_L2_tail`), using dyadic bands. In Lean this tail is assumed as `hb_tail` inside `SpectralAssumptionsAlpha`.

Lean placeholders
-----------------
- `H_b_pointwise_weak`: \(|b_\rho| \le C (1+|\gamma|)^B\) with \(B>0\).
- `gamma_prefactor := π^{-ρ/2} Γ(ρ/2)` and `gamma_prefactor_bound` (coarse polynomial growth, assumed).
- `explicit_b_rho_growth_bound` is the target to bound `explicit_b_rho` from prefactors; currently a placeholder.
- `H_b_pointwise_implies_weak` and `H_b_pointwise_weak_of_explicit_and_growth` relate the strong pointwise goal to the weak form via explicit data and growth hypotheses.
