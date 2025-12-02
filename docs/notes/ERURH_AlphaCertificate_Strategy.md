ERURH Alpha Certificate Strategy
================================

## 1. Introduction

The ERURH-alpha layer already formalizes the implication “four finite certificates ⇒ RH_alpha” in Lean. ERURH-beta serves as a phenomenological laboratory, but here we focus on the alpha route: completing the analytic and numeric bounds that instantiate the alpha certificates.

## 2. Current status

- Certificates: `GlobalEnergy`, `KernelBlowup`, `BridgeInertia`, `StrongInertia`.
- Nearly complete: global energy and kernel blow-up parameters; pipeline generates rational artifacts and witness bounds.
- Delicate pieces: strong inertia and \(jRel_{\sup}\) bounds, tail controls, and prefactor envelopes still require sharper analytic estimates.

## 3. High-level strategy to complete the alpha certificate

1. Refine analytic tail bounds for \(\log R\) and \(J_{\mathrm{rel}}\) using explicit-formula estimates (zero sums plus tail integrals).
2. Derive rigorous rational bounds (interval arithmetic, error control) for \(\log R\) windows and their derivatives.
3. Stabilize the strong inertia certificate by bridging from \(\log R\) bounds to \(jRel_{\sup}\) bounds on each window.
4. Close remaining analytic gaps (prefactors, kernel envelopes) to instantiate the Lean certificates without extra axioms.

ERURH-beta informs realistic scales and avoids alpha bounds that contradict explicit-model behaviour, but beta remains auxiliary.

## 4. Conclusion

Completing the alpha certificate is, by design, a viable route to a proof of RH within ERURH. The beta layer guides and validates the analytic estimates but does not replace the logical work required at the alpha level.
