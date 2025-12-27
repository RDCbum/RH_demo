# RH Closure Checklist (post-NOAX)

Source of truth: `docs/core/NOAX_FINAL_STATEMENTS.txt` and `docs/core/ASSUMPTIONS_LEDGER.md`.

## Remaining requirements

| Lean type | Lean location | Discharge (paper/gate) | Status | Notes |
| --- | --- | --- | --- | --- |
| `ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow` | `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:13` | Paper: `arxiv_submission/ERURH_Conditional_Proof.tex` (No supercritical ERU modes, window bridge) | Analytic new | Window-compatibility of `ERU_mode_beta` with `ctx_real_window_interval` |
| `ctx_real_logR_alpha_upper ERURH.Alpha.ctx_real_window` | `lean/formal_proofs/ERURH/Alpha/GeneratedRMSModeBridge.lean:35` | Gate: `tools/check_rms_mode_bridge.py` (interval arithmetic) | Gate-certified | Evidence: `docs/core/P16_GATE_FULL.txt`, `docs/core/P17_GATE_FULL.txt`, `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md` |
| `AxiomsShimAccepted.alphaInterfacesBase` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:24` | Paper: `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumptions classical/explicit) | Classical/citable | Explicit-formula setup and alpha interfaces |
| `AxiomsShimAccepted.explicit_alpha_via_stages` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:25` | Paper: `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula assumption) | Classical/citable | Explicit-formula laws for alpha |
| `AxiomsShimAccepted.xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:26` | Paper: `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula bounds section) | Classical/citable | xi bounds statements |
| `AxiomsShimAccepted.h_xi_bounds_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:27` | Lean packaging | Classical/citable | Depends on `xi_bounds_alpha` proof |
| `AxiomsShimAccepted.xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:28` | Paper: `arxiv_submission/ERURH_Conditional_Proof.tex` (argument bounds section) | Classical/citable | xi argument statements |
| `AxiomsShimAccepted.h_xi_argument_alpha` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:29` | Lean packaging | Classical/citable | Depends on `xi_argument_alpha` proof |
| `AxiomsShimAccepted.xi_bounds_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:30` | Paper: `arxiv_submission/assumptions_ledger.tex` (classical implications) | Classical/citable | `xi_bounds_hypotheses_alpha` |
| `AxiomsShimAccepted.xi_argument_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:32` | Paper: `arxiv_submission/assumptions_ledger.tex` (classical implications) | Classical/citable | `xi_argument_hypotheses_alpha` |
| `AxiomsShimAccepted.rh_from_E_alpha_of_hypotheses` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:34` | Paper: `arxiv_submission/assumptions_ledger.tex` (E-to-RH checklist) | Classical/citable | `E_bound_strong_alpha` + explicit formula bundle |
| `AxiomsShimAccepted.h_inertia_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:39` | Paper: `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound) | Classical/citable | Inertia/E-bound equivalence |
| `AxiomsShimAccepted.h_inertia_of_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:41` | Paper: `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound) | Classical/citable | Inertia/E-bound equivalence |
| `AxiomsShimAccepted.h_RH_to_E` | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:43` | Paper: `arxiv_submission/assumptions_ledger.tex` (RH implies E-bound) | Classical/citable | RH -> E-bound implication |
