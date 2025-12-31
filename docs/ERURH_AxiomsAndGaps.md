ERURH Axioms and Analytic Gaps
==============================

Status: historical snapshot. For the current NOAX state and gap framing, see
`docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

Listing of axioms (Lean `axiom`/`export` of axioms) and outstanding `sorry` gaps relevant to the ERURH -> RH chain. Paths are workspace-relative.

External assumption packages
----------------------------
- `ClassicalZetaAssumptions` - ERURH_ClassicalZetaAssumptions.lean. Bundle of classical explicit-formula / ξ-bounds / RH-from-E assumptions.
- `SpectralAssumptionsAlpha` - ERURH_ExplicitFormulaAlpha.lean. Structured into `H_b_explicit` (coefficients), `H_b_pointwise` (decay), and `H_b_L2_tail` (tail bound).
- `LSGammaAssumptions` - ERURH_LargeSieveGammaSketch.lean. Carries the refined LS_γ hypothesis.
- `BetaInertiaAssumptions` - ERURH_BetaInertiaAssumptions.lean. Carries beta numeric certificate correctness and the beta certificate-based energy blow-up.

External zeta-theory axioms (H_zeta,standard / H_ERU,explicit)
--------------------------------------------------------------
- `explicit_alpha` - formal_proofs/ERURH/AlphaAxioms.lean. Explicit formula laws for the alpha bridge (external analytic theory).
- `rh_from_E_alpha` - AlphaAxioms.lean. Analytic equivalence RH <-> E-bound (external analytic theory).
- `alphaInterfacesBase` - AlphaAxioms.lean. Packaged analytic witnesses (prefactor/zeta/lambda) assumed externally.
- `explicit_rect_alpha_true` - ExplicitCoreBridge.lean. Existence of the analytic rectangle/witness (treated as external hypothesis).
- `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha` - ExplicitDecomposition.lean (exported via shim). Analytic explicit-formula pieces.
- `Explicit_L1_alpha_of_explicit_core`, `Explicit_L1_alpha_strong_to_L1`, `Explicit_L2_alpha_of_bounds`, `Explicit_L3_alpha_of_argument`, `Explicit_L4_alpha_of_flux`, `explicit_alpha_of_stages`, `explicit_alpha_of_pieces`, `rh_from_E_alpha_of_pieces`, `flux_to_bridge_alpha_of_hypotheses`, `xi_bounds_alpha_of_hypotheses`, `xi_argument_alpha_of_hypotheses` - ExplicitDecomposition.lean.
- `EToRH_L1_alpha_of_explicit`, `EToRH_L2_alpha_of_bounds`, `EToRH_L3_alpha_of_argument`, `EToRH_no_offline_zeros_alpha_of_stages`, `RHfromE_alpha_of_no_offline_zeros`, `rh_from_E_alpha_of_hypotheses` - EToRHChecklist.lean.
- `RH_to_E_bound_alpha`, `ERU_inertia_to_E_bound_alpha`, `ERU_inertia_of_E_bound_alpha` - ERUInertia.lean (analytic equivalence pieces).

ERU-specific analytic gap axioms (energy / modes / inertia)
-----------------------------------------------------------
- `ERU_energy_alpha_bounded` - ERUEnergyAlpha.lean. (proved lemma via flux/checklist route).
- `ERU_energy_global_dominates_kernel_legacy` - ERUEnergyAlpha.lean. (lemma via certificate-based `ERU_energy_global_dominates_kernel`).
- `ERU_energy_global_dominates_kernel_of_certificate` - EnergyCertificatesAlpha.lean. (lemma: certificate-based global blow-up from kernel threshold).
- `ERU_energy_kernel_blowup_of_mode_beta_of_certificate` - EnergyCertificatesAlpha.lean. (external via `BetaInertiaAssumptions` bundle).
- `ERU_energy_kernel_blowup_of_mode_beta_legacy`, `ERU_energy_blowup_of_mode_beta` - ERUModesAlpha.lean. (lemmas: legacy wrappers via certificate-based blow-up).
- `InertiaERU_alpha_strong_of_bridge_inertia_legacy` - ERUInertia.lean. Bridge inertia -> strong inertia (legacy).
- `ERU_energy_alpha_bounded_of_checklist` - EnergyBoundsAlpha.lean. (proved lemma: flux checklist -> global energy bound).

The flux checklist unpacking (`EnergyBoundChecklist_alpha_of_hypotheses`) and the bridge
`ERU_energy_alpha_supported_by_flux` are now lemmas proved in `EnergyBoundsAlpha.lean`. Likewise,
bridge inertia (`InertiaERU_alphaBridge_of_certificate`) and the no-modes bridges
(`alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes`) are lemmas backed by
the explicit certificates.

Outstanding `sorry` gaps (Plan B analytic)
------------------------------------------
- `H_b_from_explicit_formula` - formal_proofs/ERURH/ERURH_ExplicitCoefficientsSketch.lean. External analytic gap: explicit formula -> coefficient decay H_b (now packaged via `SpectralAssumptionsAlpha`).
- `LS_gamma_fine` (packaged) - formal_proofs/ERURH/ERURH_LargeSieveGammaSketch.lean. Refined large-sieve-on-γ inequality now enters via `LSGammaAssumptions`.
- `LS_gamma_large_sieve` - ERURH_LargeSieveGammaSketch.lean. Refined large-sieve-on-? bound (analytic gap).
- `mode_RMS_lower_bound` - ERURH_ModeGrowthAlpha.lean. A1-mode RMS growth; integral estimate left as gap.
- `A2Tail_RMS_from_Hb_LS_simple` - ERURH_A2Hypotheses.lean. Closed: lemma from `H_b` via simple LS_γ packaged tail bound.
- `RMSLocalHypothesis_of_A2` - ERURH_A2Hypotheses.lean. A1-mode + A2-low/tail -> RMSLocalHypothesis (analytic gap).
- `RMS_local_lemma`, `RMS_local_lemma_beta` - ERURH_RMSLocalLemma.lean. Dominant mode -> window with RMS above envelope (analytic gap).
- `gate_opens_from_RMS_alpha`, `gate_opens_from_RMS_beta` - ERURH_GatesFromRMS.lean. Conceptual bridge; pending explicit RMS=envelope clause in gate definition.

Non-axiomatic but noteworthy noncomputables/constants
------------------------------------------------------
- Formal constants (from RationalBounds/CertificateValues) used in gates/certificates: `lGlobalFormalRat`, `kappaLowFormalRat`, `kappaHighFormalRat`, `cEnvelopeFormalRat`, `kappaBookClosedRat`, `s0ClosedRat`, etc. These are defined, not axiomatic.

Summary grouping
----------------
- **External zeta-classical axioms**: explicit formula and RH<->E bundle (`explicit_alpha`, `rh_from_E_alpha`, `explicit_rect_alpha_true`, `explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `EToRH_*`, `RH_to_E_bound_alpha`, `ERU_inertia_*_E_bound_alpha`).
- **ERU-specific analytic gaps**: energy/mode/inertia blow-up and bridges (`ERU_energy_*` family, `alphaBridge_inertia_of_no_modes`, `InertiaERU_alpha_strong_of_no_modes`, `InertiaERU_alphaBridge_of_certificate`, checklist-to-bound axioms). External bundles (`ClassicalZetaAssumptions`, `SpectralAssumptionsAlpha`, `LSGammaAssumptions`, `BetaInertiaAssumptions`) are inputs to the master theorem summary `RH_from_ERURH_conditional`.
- **Plan B analytic gaps (`sorry`)**: coefficient decay (`H_b_from_explicit_formula`), refined LS_γ (`LSGammaAssumptions` provides the hypothesis), classical ζ-theory package (`ClassicalZetaAssumptions`), A1-mode RMS growth, A2-tail bridge, RMS-local lemmas, gate-open lemmas. These must be closed to remove Plan B analytic assumptions. The decay hypothesis `H_b` now enters via `SpectralAssumptionsAlpha` (no standalone axiom).

- H_b_explicit, H_b_pointwise, H_b_L2_tail — ERURH_ExplicitFormulaAlpha.lean. Structured spectral hypotheses: explicit formula for b_ρ, pointwise decay, and L² tail bound.

