# ERURH Energy/Inertia Axiom Inventory (Alpha)

Status: historical inventory. For the current certificate state and assumptions,
see `docs/core/ASSUMPTIONS_LEDGER.md` and `arxiv_submission/assumptions_ledger.tex`.

This note summarizes the energy- and inertia-related axioms used in the alpha layer, their locations, the current certificate interfaces, and the plan to eliminate legacy assumptions.

## 1. Axiom map by file

- **formal_proofs/ERURH/EnergyCertificatesAlpha.lean**
  - Existence (Type A): `GlobalEnergyCertificate_exists_alpha`, `KernelBlowupCertificate_exists_alpha`.
  - Implications (Type B): `ERU_energy_global_dominates_kernel_of_certificate` (lemma), `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` (via `BetaInertiaAssumptions`).
  - Legacy: none.

- **formal_proofs/ERURH/EnergyBoundsAlpha.lean**
  - Implication (Type B): `ERU_energy_alpha_bounded_of_checklist` (proved lemma via checklist + flux).
  - Supporting lemmas: `EnergyBoundChecklist_alpha_of_hypotheses`, `ERU_energy_alpha_supported_by_flux`.
  - Legacy: none.

- **formal_proofs/ERURH/ERUEnergyAlpha.lean**
  - Legacy (Type C): `ERU_energy_global_dominates_kernel_legacy` (certificate-based legacy route).

- **formal_proofs/ERURH/ERUModesAlpha.lean**
  - Legacy (Type C): `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta` (legacy wrappers; superseded by certificate route).
  - Current lemmas: `alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes` (supported by certificates).

- **formal_proofs/ERURH/ERUInertia.lean**
  - Legacy (Type C): `InertiaERU_alpha_strong_of_bridge_inertia_legacy`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha`.

- **formal_proofs/ERURH/InertiaCertificatesAlpha.lean**
  - Existence (Type A): `BridgeInertiaCertificate_exists_alpha`, `StrongInertiaCertificate_exists_alpha`.
  - Implications (Type B): `InertiaERU_alphaBridge_of_certificate`, `InertiaERU_alpha_strong_of_bridge_inertia_of_certificate`.
  - Legacy: none.

- **Other classical analytic modules** (AlphaAssumptions, ExplicitDecomposition, ExplicitCoreBridge, EToRHChecklist, AlphaAxioms): classical explicit-formula / RH axioms; out of scope for ERU-specific desaxiomatization.

## 2. Certificate interfaces (current state)

- **GlobalEnergyCertificate_alpha**
  - Fields: `kappa_book : ℚ`, `L_global : ℚ`, equalities to generated values (`h_kappa`, `h_L`).
  - Correctness: identities plus inequality `kappaLowFormalRat ≤ kappa_book`.

- **KernelBlowupCertificate_alpha**
  - Fields: `kappa_book : ℚ`, equality `h_kappa`.
  - Correctness: identity `h_kappa` (no inequality yet).

- **BridgeInertiaCertificate_alpha**
  - Field: `inertia_proof : InertiaERU alphaBridge`.
  - Correctness: equality with witness `alphaBridge_inertia`.

- **StrongInertiaCertificate_alpha**
  - Field: marker `marker : Unit` (placeholder).
  - Correctness: `True` (placeholder).

## 3. De-axiomatization plan and priorities

- Replace legacy (Type C) axioms with certificate-driven lemmas:
  - Supply concrete `_true` certificates with numeric data (windows, κ, `L_global`) and lemmas `*_true_correct_alpha`.
  - Replace direct energy/inertia/mode axioms with lemmas that consume correct certificates.
  - Keep only the minimal analytic axioms not yet supported by generated certificates.
- Priorities:
  1) Kernel/global energy: certificates with κ/L and numeric inequalities.
  2) Bridge inertia: package `alphaFluxCertificate` / window data in a certificate record.
  3) Strong inertia: connect prefactor/zeta/bridge-to-`logR_alpha` certificates.
  4) Eliminate legacy axioms (`*_legacy`, `*_of_no_modes`) once the certificate route is complete.
