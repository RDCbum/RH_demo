ERURH Alpha Certificate Strategy
================================

## 1. Introduction
The ERURH-alpha layer formalizes the implication “four finite certificates ⇒ RH for `xiAlpha`” in Lean. Beta remains a phenomenological laboratory; the alpha route is the logical path to RH once analytic and numeric bounds are instantiated.

## 2. Current status
- Certificates: `GlobalEnergy`, `KernelBlowup`, `BridgeInertia`, `StrongInertia` (see `CertificatesCorrectAlpha`).
- Instantiated with data: global energy and kernel blow-up certificates (`globalEnergyCertificate_true_alpha`, `kernelBlowupCertificate_true_alpha`) generated from the published rational artifacts.
- Remaining fragile pieces: strong inertia and \(jRel\) sup bounds, tail controls, and prefactor envelopes still rely on classical analytic inputs and certified numerics that are not yet formalized in Lean.

## 3. High-level strategy to complete the alpha certificates
1. Tighten analytic tail bounds for \(\log R\) and \(j_{\mathrm{rel}}\) using explicit-formula estimates (zero sums plus tail integrals), consistent with `SpectralAssumptionsAlpha` and `LSGammaAssumptions`.
2. Produce certified rational bounds (interval arithmetic, error control) for \(\log R\) windows and derivatives, feeding the Lean certificates.
3. Stabilize the strong inertia certificate by bridging \(\log R\) bounds to window-wise \(jRel_{\sup}\) bounds and inertia predicates.
4. Close residual analytic gaps (prefactors, kernel envelopes) so the certificates can be justified without additional axioms beyond the classical analytic package.

## 4. Role of beta
Beta guides realistic scales and sanity-checks the alpha numerics but remains auxiliary: the RH implication in Lean uses the alpha certificates together with the assumed classical analytic packages (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha`, `LSGammaAssumptions`) bundled in `ERURH_GlobalAssumptions`.
