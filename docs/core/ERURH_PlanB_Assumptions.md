ERURH Plan B Assumptions (Conditional Route)
============================================

1. Analytic assumptions on ζ (H_ζ,standard)
-------------------------------------------
- Explicit formula for ψ(x) / E(x).
- Equivalence RH ↔ bound on E(x) (Chebyshev error) of order x^{1/2} log^2 x.
- Zero-density / local counting (Riemann–von Mangoldt) to control N(T+Δ) − N(T−Δ).

2. ERU explicit observable assumptions (H_ERU,explicit)
-------------------------------------------------------
- ExplicitFormulaERU: ψ/E/logR/jRel decomposition compatible with the ERU observable.
- H_b: decay of the coefficients b_ρ associated to zeros in the ERU explicit formula.
- A1-mode: growth lemma for modes with β > 1/2 (mode_RMS_lower_bound).

3. Large-sieve and RMS tail (H_LS + H_A2)
-----------------------------------------
- LS_gamma_simple_RMS: L-average bound for Σ b_j e^{iγ_j u} on [0, L].
- A2Low_RMS: RMS control for the low part of jRel.
- A2Tail_RMS: RMS control for the tail part (β > 1/2, |γ| > T) via H_b + LS_γ + normalisation.

4. Certificates and numeric coverage (H_certs + num)
----------------------------------------------------
- CertificatesCorrectAlpha: GlobalEnergy/KernelBlowup/BridgeInertia/StrongInertia predicates.
- NumericCoverageAlpha: windows/tails coverage from s upwards (FluxWindows, etc.).

5. Summary: PlanB_Cond assumptions ⇒ RH
---------------------------------------
- Assume H_ζ,standard + H_ERU,explicit + H_LS + H_A2 + H_certs+num. Then, via the Lean master theorem and the RMS/gates bridge, we obtain RiemannHypothesis xiAlpha.

6. External analytic assumptions (classical ζ-theory)
-----------------------------------------------------
- H_ζ,standard (external):
  - Explicit formula for ψ(x) (e.g., Titchmarsh, *The Theory of the Riemann Zeta-Function*).
  - Equivalence RH ↔ bound on E(x) = ψ(x) − x of order x^{1/2} log^2 x (see Davenport, Montgomery–Vaughan).
  - Riemann–von Mangoldt for N(T) (zero counting / local density).
- H_ERU,explicit (partly external, partly ERURH-specific):
  - Compatibility of the ERU observable (logR/jRel) with the classical explicit formula (ψ/E/logR/jRel).
  - H_b on the coefficients b_ρ as an abstraction of the expected behaviour in the ERU-adapted explicit formula.

References (classical): Titchmarsh, Davenport, Montgomery–Vaughan, Ivić.
