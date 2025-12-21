ERURH Plan B Assumptions (Conditional Route)
============================================

1. Analytic assumptions on ζ (H_ζ,standard)
-------------------------------------------
- Explicit formula for ψ(x) / E(x).
- Equivalence RH ↔ bound on \(E(x)\) (Chebyshev error) of order \(x^{1/2} \log^2 x\).
- Zero-density / local counting (Riemann–von Mangoldt) to control \(N(T+\Delta) - N(T-\Delta)\).

2. ERU explicit observable assumptions (H_ERU,explicit)
-------------------------------------------------------
- `ExplicitFormulaERU`: ψ/E/logR/jRel decomposition compatible with the ERU observable.
- `H_b`: decay of the coefficients \(b_\rho\) associated to zeros in the ERU explicit formula.
- A1-mode: growth lemma for modes with β > 1/2 (`mode_RMS_lower_bound`).

3. Large-sieve and RMS tail (H_LS + H_A2)
-----------------------------------------
- `LS_gamma_simple_RMS`: L-average bound for \(\sum b_j e^{i\gamma_j u}\) on \([0, L]\).
- `A2Low_RMS`: RMS control for the low part of \(jRel\).
- `A2Tail_RMS`: RMS control for the tail part (β > 1/2, \(|\gamma| > T\)) via `H_b` + LS\_γ + normalisation.

4. Certificates and numeric coverage (H_certs + num)
----------------------------------------------------
- `CertificatesCorrectAlpha`: predicates for GlobalEnergy / KernelBlowup / BridgeInertia / StrongInertia.
- `NumericCoverageAlpha`: windows and tails coverage from `s` upward (e.g., `FluxWindows`).

5. Summary: PlanB_Cond assumptions ⇒ RH
---------------------------------------
- Assuming \(H_ζ,\mathrm{standard}\) + \(H_{\mathrm{ERU},\mathrm{explicit}}\) + \(H_{\mathrm{LS}}\) + \(H_{\mathrm{A2}}\) + \(H_{\mathrm{certs+num}}\), the Lean master theorem and the RMS/gates bridge give `RiemannHypothesis xiAlpha`.

6. External analytic assumptions (classical ζ-theory)
-----------------------------------------------------
- H_ζ,standard (external):
  - Explicit formula for ψ(x) (e.g., Titchmarsh, *The Theory of the Riemann Zeta-Function*).
  - Equivalence RH ↔ bound on \(E(x) = \psi(x) - x\) of order \(x^{1/2} \log^2 x\) (see Davenport, Montgomery–Vaughan).
  - Riemann–von Mangoldt for \(N(T)\) (zero counting / local density).
- H_ERU,explicit (partly external, partly ERURH-specific):
  - Compatibility of the ERU observables (logR/jRel) with the classical explicit formula (ψ/E/logR/jRel).
  - `H_b` on the coefficients \(b_\rho\) as an abstraction of expected ERU-adapted behaviour.

References (classical): Titchmarsh, Davenport, Montgomery–Vaughan, Ivić.
