# RB16 AxiomsShimAccepted discharge checklist

| Field | Status | Discharge target |
| --- | --- | --- |
| `alphaInterfacesBase` | Paper proven | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption~\ref{assm:classical}, Assumption~\ref{assm:explicit}). |
| `explicit_alpha_via_stages` | Paper proven | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption~\ref{assm:explicit}). |
| `xi_bounds_alpha` | Paper proven | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula bounds section). |
| `h_xi_bounds_alpha` | Missing | Lean packaging once `xi_bounds_alpha` is formalized. |
| `xi_argument_alpha` | Paper proven | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula argument bounds section). |
| `h_xi_argument_alpha` | Missing | Lean packaging once `xi_argument_alpha` is formalized. |
| `xi_bounds_alpha_of_hypotheses` | Paper proven | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). |
| `xi_argument_alpha_of_hypotheses` | Paper proven | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). |
| `rh_from_E_alpha_of_hypotheses` | Paper proven | `arxiv_submission/assumptions_ledger.tex` (E-to-RH checklist). |
| `h_inertia_to_E` | Paper proven | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). |
| `h_inertia_of_E` | Paper proven | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). |
| `h_RH_to_E` | Paper proven | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). |
| `ERURH.no_supercritical_beta` | Missing | `arxiv_submission/ERURH_Conditional_Proof.tex` (Section~\ref{sec:no-supercritical}); blockers in `docs/core/RB28_BLOCKERS.md`. |

Derived (not a bundle field): `ERURH.A1_mode_of_supercritical` is now obtained from
`ERURH.no_supercritical_beta` (vacuously) and the ctx_real impossibility lemma
in `docs/core/RB20_A1_EQUIVALENCE.md`.
