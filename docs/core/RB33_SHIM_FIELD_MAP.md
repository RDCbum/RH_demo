# RB33 AxiomsShimAccepted field map

| Field | Lean location | Paper/citation | Status |
| --- | --- | --- | --- |
| `alphaInterfacesBase` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:19` | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption~\ref{assm:classical}, Assumption~\ref{assm:explicit}). | Paper proven |
| `explicit_alpha_via_stages` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:20` | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption~\ref{assm:explicit}). | Paper proven |
| `xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:21` | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula bounds section). | Paper proven |
| `h_xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:22` | Lean packaging once `xi_bounds_alpha` is formalized. | Missing |
| `xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:23` | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula argument bounds section). | Paper proven |
| `h_xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:24` | Lean packaging once `xi_argument_alpha` is formalized. | Missing |
| `xi_bounds_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:25` | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). | Paper proven |
| `xi_argument_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:27` | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). | Paper proven |
| `rh_from_E_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:29` | `arxiv_submission/assumptions_ledger.tex` (E-to-RH checklist). | Paper proven |
| `h_inertia_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:34` | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). | Paper proven |
| `h_inertia_of_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:36` | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). | Paper proven |
| `h_RH_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:38` | `arxiv_submission/assumptions_ledger.tex` (classical/citable implications). | Paper proven |

Note: the remaining analytic gap is `ERURH.Alpha.mode_to_rms_mode` (see `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode.lean`).
