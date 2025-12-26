# RB16 AxiomsShimAccepted discharge checklist

| Field | Status | Discharge target |
| --- | --- | --- |
| `alphaInterfacesBase` | citable | Assumption~\ref{assm:classical} (explicit formula framework) + Lean `ERURH/AlphaInterfaces.lean`. |
| `explicit_alpha_via_stages` | citable | Assumption~\ref{assm:explicit} (explicit formula package) + Lean `ERURH/ExplicitDecomposition.lean`. |
| `xi_bounds_alpha` | paper proof | Section on explicit formula bounds; Lean `ERURH/ExplicitDecomposition.lean`. |
| `h_xi_bounds_alpha` | packaging | Follows once `xi_bounds_alpha` is proved. |
| `xi_argument_alpha` | paper proof | Section on explicit formula argument bounds; Lean `ERURH/ExplicitDecomposition.lean`. |
| `h_xi_argument_alpha` | packaging | Follows once `xi_argument_alpha` is proved. |
| `xi_bounds_alpha_of_hypotheses` | paper proof | Bridge from `xi_bounds_hypotheses_alpha` (Assumptions Ledger) to `xi_bounds_alpha`; Lean `ERURH/ExplicitDecomposition.lean`. |
| `xi_argument_alpha_of_hypotheses` | paper proof | Bridge from `xi_argument_hypotheses_alpha` (Assumptions Ledger) to `xi_argument_alpha`; Lean `ERURH/ExplicitDecomposition.lean`. |
| `rh_from_E_alpha_of_hypotheses` | paper proof | E-to-RH checklist; Lean `ERURH/EToRHChecklist.lean` (classical/citable implications). |
| `h_inertia_to_E` | citable | Classical implication; Lean `ERURH/ERUInertia.lean`. |
| `h_inertia_of_E` | citable | Classical implication; Lean `ERURH/ERUInertia.lean`. |
| `h_RH_to_E` | citable | Classical implication; Lean `ERURH/ERUInertia.lean`. |
| `a1_mode_of_supercritical` | new proof | Route B analytic gap; see `docs/core/RB16_A1_PROOF_PLAN.md`. |
