ERURH: Pipeline ERU → Explicit Formula → E → RH (Alpha stages)
===============================================================

1. Conceptual pipeline
----------------------
`InertiaERU alphaBridge`
→ `ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi`
→ `E_bound_strong_alpha` (Chebyshev error bound)
→ `RHfromE xiAlpha AlphaPsi`
→ `RiemannHypothesis xiAlpha`.

2. Explicit-formula stages
--------------------------
- `Explicit_L1_alpha`: core explicit formula for ψ; axiomatically `Explicit_L1_alpha_of_explicit_core : explicit_core_alpha → Explicit_L1_alpha`.
- `Explicit_L2_alpha`: ξ/ζ/prefactor bounds on the contour; `Explicit_L2_alpha_of_bounds : xi_bounds_alpha → Explicit_L2_alpha`.
- `Explicit_L3_alpha`: argument/zero-count control; `Explicit_L3_alpha_of_argument : xi_argument_alpha → Explicit_L3_alpha`.
- `Explicit_L4_alpha`: flux → bridge translation (logR/jRel); `Explicit_L4_alpha_of_flux : flux_to_bridge_bounds_alpha → Explicit_L4_alpha`.
- Bundling: `explicit_alpha_of_stages : Explicit_L1_alpha → Explicit_L2_alpha → Explicit_L3_alpha → Explicit_L4_alpha → flux_energy_alpha → ExplicitFormulaLaws ...`. The hypotheses (`explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha`, `flux_energy_alpha`) are treated as external analytic inputs (packaged via `ClassicalZetaAssumptions` and related shims).

3. E → RH stages
----------------
- `EToRH_L1_alpha`: explicit + rectangle ⇒ usable explicit formula; axiom `EToRH_L1_alpha_of_explicit`.
- `EToRH_L2_alpha`: ξ/ζ bounds + rectangle ⇒ L2 stage; axiom `EToRH_L2_alpha_of_bounds`.
- `EToRH_L3_alpha`: argument control + rectangle ⇒ L3 stage; axiom `EToRH_L3_alpha_of_argument`.
- `EToRH_no_offline_zeros_alpha`: combines E-bound with L1–L3 to exclude off-line zeros; axiom `EToRH_no_offline_zeros_alpha_of_stages`.
- Final: `RHfromE_alpha_of_no_offline_zeros : E_bound_strong_alpha → EToRH_no_offline_zeros_alpha → RHfromE xiAlpha AlphaPsi`.
- Bundling: `EToRHChecklist` collects these axioms; `rh_from_E_alpha_of_hypotheses` assembles the checklist. All are treated as classical analytic assumptions, not proved in Lean.

4. Classical ψ and bounds
-------------------------
- `AlphaPsi` ties ψ and E to the classical Chebyshev functions (`ERURH.NT.psi`, `ERURH.NT.E`).
- Chebyshev bound: `chebyshevPsi_bound_alpha : ∃ C, ∀ x ≥ AlphaPsi.x0, |psi x - x| ≤ (algebraMap ℚ ℝ C) * √x * (log x)^2`, used as `E_bound_strong_alpha` within `EToRH_hypotheses_alpha`.

5. Outstanding analytic work
----------------------------
- Prove or certify the explicit-formula pieces (`explicit_core_alpha`, `xi_bounds_alpha`, `xi_argument_alpha`, `flux_to_bridge_bounds_alpha`, `flux_energy_alpha`) and the E→RH checklist (`EToRH_L1_alpha_of_explicit`, `EToRH_L2_alpha_of_bounds`, `EToRH_L3_alpha_of_argument`, `EToRH_no_offline_zeros_alpha_of_stages`, `RHfromE_alpha_of_no_offline_zeros`).
- These remain classical assumptions (packaged via `ClassicalZetaAssumptions`) in the current Lean development; the logical assembly of the pipeline is formalized, but the analytic theorems themselves are assumed.
