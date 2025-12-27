# RH Closure Checklist (post-NOAX)

Source of truth: `docs/core/NOAX_FINAL_STATEMENTS.txt` and `docs/core/ASSUMPTIONS_LEDGER.md`.

## Remaining requirements

| Requirement (Lean) | Lean location | Status | Paper location | Dependencies |
| --- | --- | --- | --- | --- |
| `ERURH.Alpha.PointwiseToRMSMode ERURH.Alpha.GeneratedRMSContext.ctx_real ERURH.Alpha.ctx_real_window` | `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_PointwiseToRMS.lean:10` | Analytic new | `arxiv_submission/ERURH_Conditional_Proof.tex` (No supercritical ERU modes, Lemma B.1) | Definitions of `ERU_mode_beta`, `logR_alpha`, `ctx_real_window`, `RMS_mode` |
| `AxiomsShimAccepted.alphaInterfacesBase` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:24` | Classical/citable | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumptions classical/explicit) | Explicit-formula setup and alpha interfaces |
| `AxiomsShimAccepted.explicit_alpha_via_stages` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:25` | Classical/citable | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula assumption) | Explicit-formula laws for alpha |
| `AxiomsShimAccepted.xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:26` | Classical/citable | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula bounds section) | xi bounds statements |
| `AxiomsShimAccepted.h_xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:27` | Classical/citable | Lean packaging of xi bounds | Depends on `xi_bounds_alpha` proof |
| `AxiomsShimAccepted.xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:28` | Classical/citable | `arxiv_submission/ERURH_Conditional_Proof.tex` (argument bounds section) | xi argument statements |
| `AxiomsShimAccepted.h_xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:29` | Classical/citable | Lean packaging of xi argument bounds | Depends on `xi_argument_alpha` proof |
| `AxiomsShimAccepted.xi_bounds_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:30` | Classical/citable | `arxiv_submission/assumptions_ledger.tex` (classical implications) | `xi_bounds_hypotheses_alpha` |
| `AxiomsShimAccepted.xi_argument_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:32` | Classical/citable | `arxiv_submission/assumptions_ledger.tex` (classical implications) | `xi_argument_hypotheses_alpha` |
| `AxiomsShimAccepted.rh_from_E_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:34` | Classical/citable | `arxiv_submission/assumptions_ledger.tex` (E-to-RH checklist) | `E_bound_strong_alpha` + explicit formula bundle |
| `AxiomsShimAccepted.h_inertia_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:39` | Classical/citable | `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound) | Inertia/E-bound equivalence |
| `AxiomsShimAccepted.h_inertia_of_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:41` | Classical/citable | `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound) | Inertia/E-bound equivalence |
| `AxiomsShimAccepted.h_RH_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:43` | Classical/citable | `arxiv_submission/assumptions_ledger.tex` (RH implies E-bound) | RH -> E-bound implication |
