Main Theorem (informal)
=======================

Assuming classical results on the Riemann zeta function (explicit formula, growth of Γ and ζ'/ζ, dyadic zero counts) and a finite set of ERURH numeric certificates (alpha and beta), the ERURH system shows there are no zeros of ζ with real part greater than 1/2. Thus, it yields a conditional proof of the Riemann Hypothesis.

What is assumed?
----------------
- Classical analytic number theory inputs: explicit formula, growth of Γ(ρ/2) and ζ'/ζ, zero counts in dyadic bands (Riemann–von Mangoldt).
- ERURH numeric certificates for the alpha and beta layers (energy, inertia, gates).

What is proved in Lean?
-----------------------
- The full ERURH/Plan B/gates/RMS machinery is formalized in Lean.
- The spectral tails LS_γ^weak and H_b^weak are reduced to classical theorems (growth of b_ρ and dyadic zero counts).
- The theorem `RH_from_ERURH_conditional` lives in Lean and consumes an `ERURH_GlobalAssumptions` bundle collecting external hypotheses and window assumptions.
