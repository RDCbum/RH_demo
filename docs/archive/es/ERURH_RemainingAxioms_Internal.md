ERURH Remaining Axioms (internal after external packages)
==========================================================

Scope: axioms still present under `formal_proofs/ERURH` after externalising `SpectralAssumptionsAlpha` (H_b), `LSGammaAssumptions` (LS_γ), and `ClassicalZetaAssumptions`. Package axioms themselves are excluded.

Axiom inventory (name — type — file — brief description)
--------------------------------------------------------
- `explicit_alpha : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi` — formal_proofs/ERURH/AlphaAxioms.lean — classical explicit-formula laws.
- `rh_from_E_alpha : RHfromE xiAlpha AlphaPsi` — AlphaAxioms.lean — classical RH-from-E equivalence.
- `alphaInterfacesBase : AlphaInterfaces` — AlphaAxioms.lean — bundle of analytic witnesses (prefactor/cover/zeta/etc.).
- `strongInertiaCompositeCorrect_beta_numeric` — Beta/CompositeCertificateBeta.lean — numerical correctness for beta strong inertia composite certificate.
- `strongInertiaCertificateCorrect_beta_numeric` — Beta/InertiaCertificatesBeta.lean — numerical correctness for beta strong inertia certificate.
- `ERU_energy_global_dominates_kernel_of_certificate` — EnergyCertificatesAlpha.lean — certificate-based global energy blow-up from kernel threshold.
- `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` — EnergyCertificatesAlpha.lean — certificate-based kernel blow-up from a β>1/2 mode.
- `ERU_energy_kernel_blowup_of_mode_beta_legacy` — ERUModesAlpha.lean — legacy kernel blow-up from β>1/2 mode.
- `ERU_energy_blowup_of_mode_beta` — ERUModesAlpha.lean — legacy global energy blow-up from β>1/2 mode.
- `ERU_energy_alpha_bounded_of_checklist` — EnergyBoundsAlpha.lean — checklist ⇒ global energy bound. *(now lemma, proved via `flux_energy_alpha_of_checklist` + `ERU_energy_alpha_supported_by_flux`).*
- `ERU_energy_alpha_bounded` — ERUEnergyAlpha.lean — deprecated primitive global energy bound. *(now lemma via `ERU_energy_alpha_bounded_from_hypotheses`).*
- `ERU_energy_global_dominates_kernel_legacy` — ERUEnergyAlpha.lean — legacy kernel threshold ⇒ global blow-up. *(now lemma via `ERU_energy_global_dominates_kernel` certificate pathway).*
- `InertiaERU_alpha_strong_of_bridge_inertia_legacy` — ERUInertia.lean — legacy bridge inertia ⇒ strong inertia.
- `ERU_inertia_to_E_bound_alpha` — ERUInertia.lean — ERU inertia ⇒ E-bound.
- `ERU_inertia_of_E_bound_alpha` — ERUInertia.lean — E-bound ⇒ ERU inertia.
- `RH_to_E_bound_alpha` — ERUInertia.lean — RH ⇒ E-bound.
- `explicit_rect_alpha_true` — ExplicitCoreBridge.lean — existence of critical rectangle for xiAlpha.
- `explicit_core_alpha : Prop` — ExplicitDecomposition.lean — core explicit-formula stage.
- `xi_bounds_alpha : Prop` — ExplicitDecomposition.lean — modulus bounds for xiAlpha.
- `Explicit_L2_alpha_of_bounds` — ExplicitDecomposition.lean — bounds ⇒ explicit L2 stage.
- `xi_argument_alpha : Prop` — ExplicitDecomposition.lean — argument control for xiAlpha.
- `Explicit_L3_alpha_of_argument` — ExplicitDecomposition.lean — argument control ⇒ explicit L3 stage.
- `xi_argument_alpha_of_hypotheses` — ExplicitDecomposition.lean — intermediate hypotheses ⇒ argument control.
- `flux_to_bridge_bounds_alpha : Prop` — ExplicitDecomposition.lean — flux ⇒ bridge bounds.
- `Explicit_L4_alpha_of_flux` — ExplicitDecomposition.lean — flux ⇒ explicit L4 stage.
- `flux_to_bridge_alpha_of_hypotheses` — ExplicitDecomposition.lean — intermediate hypotheses ⇒ flux-to-bridge bounds.
- `xi_bounds_alpha_of_hypotheses` — ExplicitDecomposition.lean — intermediate hypotheses ⇒ xi bounds.
- `xi_argument_alpha_of_hypotheses` — ExplicitDecomposition.lean — intermediate hypotheses ⇒ xi argument.
- `Explicit_L1_alpha_of_explicit_core` — ExplicitDecomposition.lean — explicit core ⇒ L1 stage.
- `Explicit_L1_alpha_strong_to_L1` — ExplicitDecomposition.lean — strong L1 ⇒ abstract L1.
- `explicit_alpha_of_stages` — ExplicitDecomposition.lean — L1–L4 + flux/energy ⇒ explicit_alpha.
- `explicit_alpha_of_pieces` — ExplicitDecomposition.lean — pieces ⇒ explicit_alpha.
- `rh_from_E_alpha_of_pieces` — ExplicitDecomposition.lean — pieces ⇒ rh_from_E_alpha.
- `EToRH_L1_alpha_of_explicit` — EToRHChecklist.lean — explicit_alpha + rectangle ⇒ EToRH L1 stage.
- `EToRH_L2_alpha_of_bounds` — EToRHChecklist.lean — xi_bounds + rectangle ⇒ EToRH L2.
- `EToRH_L3_alpha_of_argument` — EToRHChecklist.lean — xi_argument + rectangle ⇒ EToRH L3.
- `EToRH_no_offline_zeros_alpha_of_stages` — EToRHChecklist.lean — L1–L3 stages ⇒ no off-line zeros.
- `RHfromE_alpha_of_no_offline_zeros` — EToRHChecklist.lean — checklist ⇒ RHfromE.
- `rh_from_E_alpha_of_hypotheses` — EToRHChecklist.lean — hypotheses ⇒ rh_from_E_alpha.
- `EToRH_L1_alpha_of_explicit` (duplicate listing) — EToRHChecklist.lean — explicit ⇒ EToRH L1.

Classification
--------------
- **Grupo A (clásicos externos, deberían estar en paquetes)**: `explicit_alpha`, `rh_from_E_alpha`, `alphaInterfacesBase`, `explicit_rect_alpha_true`, all explicit/xi/flux-to-bridge stages and “of_hypotheses” in ExplicitDecomposition.lean, all EToRHChecklist axioms, and the classical ERU↔E axioms in ERUInertia (`ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha`, `RH_to_E_bound_alpha`). These belong in `ClassicalZetaAssumptions` (or subpackages) rather than as free axioms.
- **Grupo B (ERU internos probablemente redundantes/deprecated)**: `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta`, `InertiaERU_alpha_strong_of_bridge_inertia_legacy`, certificate-based energy axioms might be provable from existing certificates (`ERU_energy_global_dominates_kernel_of_certificate`, `ERU_energy_kernel_blowup_of_mode_beta_of_certificate`), Beta numeric certificate axioms (`strongInertiaCompositeCorrect_beta_numeric`, `strongInertiaCertificateCorrect_beta_numeric`).
- **Grupo C (ERU internos aún necesarios o hard gaps)**: current certificate-based energy/inertia axioms if no proof pathway exists yet; any core blow-up implications that lack formal certificates.

Refactor proposals for Grupo B
------------------------------
- `ERU_energy_alpha_bounded`: **done** — lemma via `ERU_energy_alpha_bounded_from_hypotheses`.
- `ERU_energy_global_dominates_kernel_legacy`: **done** — lemma via `ERU_energy_global_dominates_kernel` (certificate-based).
- `ERU_energy_kernel_blowup_of_mode_beta_legacy` / `ERU_energy_blowup_of_mode_beta`: **done** — lemmas via certificate-based pathway (`ERU_energy_kernel_blowup_of_mode_beta` + `ERU_energy_blowup_of_mode_beta_via_kernel`).
- `ERU_energy_alpha_bounded_of_checklist`: **done** — now a lemma using `flux_energy_alpha_of_checklist` + `ERU_energy_alpha_supported_by_flux`.
- `InertiaERU_alpha_strong_of_bridge_inertia_legacy`: replace with the certified route `InertiaERU_alpha_strong_of_bridge_inertia_of_certificate`; if already available, downgrade legacy axiom to lemma using that certificate.
- Certificate-based energy axioms (`ERU_energy_global_dominates_kernel_of_certificate`, `ERU_energy_kernel_blowup_of_mode_beta_of_certificate`): investigate whether existing concrete certificates (`*_exists_alpha`) can discharge them; if so, convert to lemmas.
- Beta numeric certificate axioms: if concrete numeric data exist, turn these into lemmas by unfolding correctness predicates or by packaging them into a beta-specific assumptions record.



