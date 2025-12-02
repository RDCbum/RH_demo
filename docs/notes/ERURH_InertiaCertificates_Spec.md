# Inertia Certificates Specification (ERURH-alpha)

## 1. Introduction
Conceptual route:
```
ERU_energy + (no modes β > 1/2)
  ⇒ InertiaERU alphaBridge
  ⇒ InertiaERU_alpha_strong
  ⇒ RH (via ERU_RH_equiv_alpha + classical analytic axioms)
```
Energy/kernel are already modeled with rational certificates. This note specifies the intended finite conditions for the bridge and strong inertia certificates so that their `Correct` predicates express rational bounds and coverings sufficient for the ERU → RH chain.

## 2. BridgeInertiaCertificate_alpha — desired shape
Purpose: finite certificate that `alphaBridge` satisfies `InertiaERU alphaBridge`.
- Captures bridge structure (`s0`, `logR`, `jRel`) and window/tail coverage.
- Encodes rational bounds per window and tail (from FluxWindows/FluxBounds).
- Connects to the canonical witness `alphaBridge_inertia`.

`BridgeInertiaCertificateCorrect_alpha` should express (finite, rational) conditions:
- Equality with the canonical witness (`alphaBridge_inertia` from flux/energy certificates).
- Finite cover of \([s0, +∞)\) by rational windows (`alphaWindows`) and a rational tail start (`tailStart`).
- Per-window rational bounds (`logRBoundWindow`, `jRelBoundWindow`) for \(|\log R|\), \(|jRel|\); tail bounds (`logRBoundTail`, `jRelBoundTail`) from `tailStart` onward.
- Coherence of window/tail bounds to imply `InertiaERU`.
- Optional: explicit link to the underlying flux/energy certificate data.

## 3. StrongInertiaCertificate_alpha — desired shape
Purpose: certify the analytic step `InertiaERU alphaBridge → InertiaERU_alpha_strong`.

`StrongInertiaCertificateCorrect_alpha` should encode:
- Equality with the canonical morphism (`InertiaERU_alpha_strong_of_bridge_inertia_certified`).
- Rational parameters of the strong bound: prefactor `C`, threshold `S0`, form \(|\logR_\alpha s| ≤ C e^{-s/2} (\log e^s)^2\) for \(s ≥ S0\).
- Monotonicity/domain conditions ensuring the bound applies for all \(s ≥ S0\).
- Any needed harmonization with global constants (e.g., energy envelope) if required by the bridge→strong step.

## 4. Link to the ERURH-alpha theorem
Design goal: the conjunction
- `GlobalEnergyCertificateCorrect_alpha`
- `KernelBlowupCertificateCorrect_alpha`
- `BridgeInertiaCertificateCorrect_alpha`
- `StrongInertiaCertificateCorrect_alpha`
should suffice to deduce `RiemannHypothesis xiAlpha`, assuming the classical analytic package (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha` with `hb_tail`, `LSGammaAssumptions`, etc.) bundled in `ERURH_GlobalAssumptions`. Today, some predicates are simplified (equalities to witnesses); they are intended to evolve into finite rational inequalities and coverings consistent with the existing flux/energy bounds and strong \( \log R_\alpha \) targets.
