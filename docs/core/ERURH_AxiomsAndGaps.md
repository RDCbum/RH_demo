ERURH Axioms and Analytic Gaps
==============================

Status: historical snapshot. For the current NOAX state and gap framing, see
`docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

This note lists the axioms (Lean `axiom` exports) and remaining `sorry` gaps that affect the ERURH → RH implication. Paths are workspace-relative.

External assumption packages (inputs, not proved internally)
------------------------------------------------------------
- `ClassicalZetaAssumptions` — `ERURH_ClassicalZetaAssumptions.lean`. Classical explicit-formula / ξ-bounds / RH-from-E bundle.
- `SpectralAssumptionsAlpha` — `ERURH_ExplicitFormulaAlpha.lean`. Structured into `H_b_explicit` (coefficients), `H_b_pointwise` (decay), and `H_b_L2_tail` (HbWeak_L2_tail); all are assumed, not derived.
- `LSGammaAssumptions` — `ERURH_LargeSieveGammaSketch.lean`. Carries the refined LS_γ hypothesis (assumed).
- `BetaInertiaAssumptions` — `ERURH_BetaInertiaAssumptions.lean`. Beta numeric certificate correctness and beta-driven energy blow-up.

External zeta-theory axioms (H_zeta,standard / H_ERU,explicit)
--------------------------------------------------------------
- `explicit_alpha` — `formal_proofs/ERURH/AlphaAxioms.lean`. Explicit-formula laws for the alpha bridge.
- `rh_from_E_alpha` — `AlphaAxioms.lean`. Analytic equivalence RH ↔ bound on `E`.
- `alphaInterfacesBase` — `AlphaAxioms.lean`. Packaged analytic witnesses (prefactor/zeta/lambda), assumed externally.
- `explicit_rect_alpha_true` — `ExplicitCoreBridge.lean`. Existence of the analytic rectangle witness (external).
- `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha` — `ExplicitDecomposition.lean` (exported via the shim). Explicit-formula components.
- `Explicit_L1_alpha_of_explicit_core`, `Explicit_L1_alpha_strong_to_L1`, `Explicit_L2_alpha_of_bounds`, `Explicit_L3_alpha_of_argument`, `Explicit_L4_alpha_of_flux`, `explicit_alpha_of_stages`, `explicit_alpha_of_pieces`, `rh_from_E_alpha_of_pieces`, `flux_to_bridge_alpha_of_hypotheses`, `xi_bounds_alpha_of_hypotheses`, `xi_argument_alpha_of_hypotheses` — `ExplicitDecomposition.lean`.
- `EToRH_L1_alpha_of_explicit`, `EToRH_L2_alpha_of_bounds`, `EToRH_L3_alpha_of_argument`, `EToRH_no_offline_zeros_alpha_of_stages`, `RHfromE_alpha_of_no_offline_zeros`, `rh_from_E_alpha_of_hypotheses` — `EToRHChecklist.lean`.
- `RH_to_E_bound_alpha`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha` — `ERUInertia.lean` (analytic equivalence components).

ERU-specific analytic gaps (energy / modes / inertia)
-----------------------------------------------------
- `ERU_energy_alpha_bounded` — `ERUEnergyAlpha.lean` (proved lemma via flux/checklist route).
- `ERU_energy_global_dominates_kernel_legacy` — `ERUEnergyAlpha.lean` (lemma via certificate-based blow-up).
- `ERU_energy_global_dominates_kernel_of_certificate` — `EnergyCertificatesAlpha.lean` (certificate-based global blow-up).
- `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` — `EnergyCertificatesAlpha.lean` (external via `BetaInertiaAssumptions`).
- `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta` — `ERUModesAlpha.lean` (legacy wrappers).
- `InertiaERU_alpha_strong_of_bridge_inertia_legacy` — `ERUInertia.lean` (bridge inertia → strong inertia, legacy).
- `ERU_energy_alpha_bounded_of_checklist` — `EnergyBoundsAlpha.lean` (proved lemma: flux checklist ⇒ global energy bound).

Flux checklist unpacking (`EnergyBoundChecklist_alpha_of_hypotheses`) and the bridge `ERU_energy_alpha_supported_by_flux` are lemmas proved in `EnergyBoundsAlpha.lean`. Bridge inertia (`InertiaERU_alphaBridge_of_certificate`) and the no-modes bridges (`alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes`) are also lemmas backed by the explicit certificates.

Outstanding `sorry` gaps (Plan B analytic)
------------------------------------------
- `H_b_from_explicit_formula` — `ERURH_ExplicitCoefficientsSketch.lean`. Gap: explicit formula ⇒ coefficient decay `H_b` (currently assumed via `SpectralAssumptionsAlpha`).
- `LS_gamma_fine` (packaged) — `ERURH_LargeSieveGammaSketch.lean`. Refined large-sieve-on-γ inequality, assumed via `LSGammaAssumptions`.
- `LS_gamma_large_sieve` — `ERURH_LargeSieveGammaSketch.lean`. Refined large-sieve bound (gap).
- `mode_RMS_lower_bound` — `ERURH_ModeGrowthAlpha.lean`. A1-mode RMS growth estimate.
- `A2Tail_RMS_from_Hb_LS_simple` — `ERURH_A2Hypotheses.lean`. Currently a placeholder using `RMS_tail_bound_simple`; does not yet derive tail RMS from `H_b` + LS_γ.
- `RMSLocalHypothesis_of_A2` — `ERURH_A2Hypotheses.lean`. A1-mode + A2-low/tail ⇒ `RMSLocalHypothesis` (gap).
- `RMS_local_lemma`, `RMS_local_lemma_beta` — `ERURH_RMSLocalLemma.lean`. Dominant mode ⇒ window with RMS above envelope (gap).
- `gate_opens_from_RMS_alpha`, `gate_opens_from_RMS_beta` — `ERURH_GatesFromRMS.lean`. Bridge from RMS exceedance to gate opening (gap; depends on RMS=envelope clause).

Non-axiomatic but noteworthy constants
--------------------------------------
Formal constants (from `RationalBounds` / `CertificateValues`) used in gates and certificates—`lGlobalFormalRat`, `kappaLowFormalRat`, `kappaHighFormalRat`, `cEnvelopeFormalRat`, `kappaBookClosedRat`, `s0ClosedRat`, etc.—are defined data, not axioms.

Summary
-------
- External zeta-classical axioms: `explicit_alpha`, `rh_from_E_alpha`, `explicit_rect_alpha_true`, `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `EToRH_*`, `RH_to_E_bound_alpha`, `ERU_inertia_*_E_bound_alpha`.
- ERU-specific analytic gaps: energy/mode/inertia blow-up and bridges (`ERU_energy_*` family, no-modes bridges, checklist-to-bound). Bundles `ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha`, `LSGammaAssumptions`, and `BetaInertiaAssumptions` feed the master conditional theorem.
- Plan B analytic gaps: coefficient decay (`H_b_from_explicit_formula`), refined LS_γ (assumed via `LSGammaAssumptions`), A1-mode RMS growth, A2-tail bridge, RMS-local lemmas, gate-open lemmas. The decay hypothesis `H_b` enters via `SpectralAssumptionsAlpha`; there is no standalone axiom.

Appendix: spectral hypotheses
-----------------------------
- `H_b_explicit`, `H_b_pointwise`, `H_b_L2_tail` — `ERURH_ExplicitFormulaAlpha.lean`. Structured spectral assumptions: explicit formula for `b_ρ`, pointwise decay, and L² tail bound.

