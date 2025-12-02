ERURH → Energy Strategy (Alpha)
===============================

Introduction
------------
The ERURH energy strategy (alpha) rules out modes with β > 1/2 by comparing the global ERU energy against a certified envelope. If a β > 1/2 mode existed, the energy would exceed the envelope; since the envelope is bounded, such modes cannot occur. Strong ERU inertia then follows, and by the ERURH↔RH equivalence, `RiemannHypothesis xiAlpha` holds.

Key components and locations
----------------------------
- Residual observable: `logR_alpha`, defined in `ERUInertia.lean`.
- Strong inertia and equivalence: `InertiaERU_alpha_strong` and `ERU_RH_equiv_alpha : InertiaERU_alpha_strong ↔ RiemannHypothesis xiAlpha` (`ERUInertia.lean`).
- Energy quantities and envelope: `ERU_energy_global_alpha`, `L_global_alpha`, with bounds in `ERUEnergyAlpha.lean`.
- Modes and gates: definitions of `ERU_mode_beta`, energy blow-up lemmas, and “no modes ⇒ inertia” in `ERUModesAlpha.lean`.
- Certificate witness data: `globalEnergyCertificate_true_alpha`, `kernelBlowupCertificate_true_alpha`, and their correctness lemmas in `EnergyCertificatesAlpha.lean`.

Logical flow (certificate-based)
--------------------------------
1. **Global bound:** `GlobalEnergyCertificateCorrect_alpha globalEnergyCertificate_true_alpha` ties `kappa_book = kappaBookClosedRat` and `L_global = lGlobalFormalRat`, and shows `kappaLowFormalRat ≤ kappa_book` (`lemmaB_energy`).
2. **Kernel blow-up:** `KernelBlowupCertificateCorrect_alpha kernelBlowupCertificate_true_alpha` fixes the κ-book threshold; `ERU_energy_kernel_blowup_of_mode_beta` states any β > 1/2 mode forces kernel blow-up at that threshold.
3. **Global blow-up:** `ERU_energy_global_dominates_kernel` shows kernel blow-up implies global energy exceeds `L_global_alpha`.
4. **Excluding modes:** Since `ERU_energy_global_alpha ≤ L_global_alpha` (bound proved via the flux/checklist pipeline), no β > 1/2 mode can exist.
5. **Inertia:** Absence of modes + bridge inertia yields `InertiaERU_alpha_strong`; the equivalence `ERU_RH_equiv_alpha` then gives `RiemannHypothesis xiAlpha`.

Certificate roles and status
----------------------------
- Global energy and kernel certificates are instantiated with the published rational artifacts and proved correct (`*_true_correct_alpha`).
- The bridge and strong inertia certificates remain placeholders for future certified bounds; their predicates are designed to be finite rational conditions.
- The external analytic assumptions (explicit formula, ζ-growth, zero counts, HbWeak_L2_tail, LSGammaWeak) are packaged in `ERURH_GlobalAssumptions` and are assumed, not proved, in Lean.

Current formalization status
----------------------------
- The energy → no-modes → strong inertia → RH chain is implemented in Lean with certificate-based lemmas.
- Outstanding analytic work lies in strengthening the inertia certificates and providing certified numeric proofs, but the logical structure is fixed and conditional only on the classical analytic packages assumed in `ERURH_GlobalAssumptions`.
