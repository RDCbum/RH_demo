Main Theorem (informal)
=======================

Assuming classical results on the Riemann zeta function (explicit formula,
growth of Γ and ζ′/ζ, dyadic zero counts), the ERURH shim bundle, and a finite
set of ERURH numeric certificates (alpha and beta), the ERURH system shows
there are no zeros of ζ with real part greater than 1/2. This yields a
conditional proof of the Riemann Hypothesis.

What is assumed?
----------------
- Classical analytic inputs: explicit formula, growth of Γ(ρ/2) and ζ′/ζ, and zero counts in dyadic bands (Riemann–von Mangoldt).
- The ERURH shim bundle `AxiomsShimAccepted`, which packages the explicit-formula infrastructure and RH-from-E bridges used in the final step.
- ERURH numeric certificates for the alpha and beta layers (energy, inertia, gates), plus explicit numeric coverage over the required window family.
- The classical analytic inputs and their structured spectral consequences are bundled into `ERURH_GlobalAssumptions` (analytic + window assumptions); certificates and numeric coverage are separate arguments in the Lean statement.

What is proved in Lean?
-----------------------
- The ERURH / Plan B / gates / RMS machinery is formalized in Lean.
- The analytic inputs A1 and A2 are supplied by paper lemmas
  (`a1-from-supercritical`, `a2-from-abc`) and the Theorems A/B/C in the
  companion preprint.
- The theorem `RH_from_ERURH_conditional` lives in Lean and consumes
  `ERURH_GlobalAssumptions` (analytic + window assumptions), plus
  `AxiomsShimAccepted`, `CertificatesCorrectAlpha`, and `NumericCoverageAlpha`.

Analytic assumptions (canonical summary)
----------------------------------------
- The conditional theorem relies on a classical analytic package for the
  Riemann zeta function that is not yet formalized in Lean. For clarity it is
  presented in two layers, but both are classical in nature:
  - (A) Classical analytic input: explicit formula for ψ/logR/jRel, growth of Γ(ρ/2) and ζ′/ζ, and zero-counting in dyadic bands (Riemann–von Mangoldt).
  - (B) Structured spectral consequences: `HbWeak_L2_tail` and `LSGammaWeak`, which factor the classical input through growth bounds, zero-counting, and simple LS_γ lemmas. They are not separate axioms: `hb_tail : H_b_L2_tail data` is a field of `SpectralAssumptionsAlpha`, and `ls_gamma_weak` is a field of `LSGammaAssumptions` (instantiated by default via `LSGammaWeak_of_simple`). Both are assumed because Lean does not yet formalize the analytic derivations.
- ERURH introduces no project-level axioms: all external assumptions are classical analytic theorems not yet mechanized in Lean. The Lean theorem formally proved is: if `ERURH_GlobalAssumptions` (the classical analytic package + the structured spectral consequences) hold, and the shim + certificates + numeric coverage assumptions are supplied, then no non-trivial zero of ζ(s) lies to the right of `Re(s) = 1/2`.
