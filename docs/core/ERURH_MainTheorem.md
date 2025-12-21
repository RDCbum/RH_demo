Main Theorem (informal)
=======================

Assuming classical results on the Riemann zeta function (explicit formula, growth of Γ and ζ′/ζ, dyadic zero counts) together with a finite set of ERURH numeric certificates (alpha and beta), the ERURH system shows there are no zeros of ζ with real part greater than 1/2. This yields a conditional proof of the Riemann Hypothesis.

What is assumed?
----------------
- Classical analytic inputs: explicit formula, growth of Γ(ρ/2) and ζ′/ζ, and zero counts in dyadic bands (Riemann–von Mangoldt).
- ERURH numeric certificates for the alpha and beta layers (energy, inertia, gates).
- The classical analytic inputs and their structured spectral consequences are collectively bundled, together with the certified numeric inputs, into `ERURH_GlobalAssumptions`.

What is proved in Lean?
-----------------------
- The ERURH / Plan B / gates / RMS machinery is formalized in Lean.
- The spectral tails LSγ^weak and H_b^weak are treated as classical assumptions packaged in `LSGammaAssumptions` and `SpectralAssumptionsAlpha` (growth of \(b_\rho\) and dyadic zero counts), not proved in Lean.
- The theorem `RH_from_ERURH_conditional` lives in Lean and consumes an `ERURH_GlobalAssumptions` bundle that aggregates external hypotheses and window assumptions.

Analytic assumptions (canonical summary)
----------------------------------------
- The conditional theorem relies on one classical analytic package for the Riemann zeta function that is not yet formalized in Lean. For clarity it is presented in two layers, but both are classical in nature:
  - (A) Classical analytic input: explicit formula for ψ/logR/jRel, growth of Γ(ρ/2) and ζ′/ζ, and zero-counting in dyadic bands (Riemann–von Mangoldt).
  - (B) Structured spectral consequences: `HbWeak_L2_tail` and `LSGammaWeak`, which factor the classical input through growth bounds, zero-counting, and simple LS_γ lemmas. They are not separate axioms: `hb_tail : H_b_L2_tail data` is a field of `SpectralAssumptionsAlpha`, and `ls_gamma_weak` is a field of `LSGammaAssumptions` (instantiated by default via `LSGammaWeak_of_simple`). Both are assumed because Lean does not yet formalize the analytic derivations.
- ERURH introduces no new axioms: all external assumptions are classical analytic theorems not yet mechanized in Lean. The Lean theorem formally proved is: if `ERURH_GlobalAssumptions` (the classical analytic package + the structured spectral consequences + the certified numeric inputs) hold, then no non-trivial zero of ζ(s) lies to the right of `Re(s) = 1/2`.
