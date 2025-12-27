# RH Closure Checklist (post-NOAX)

Source of truth: `docs/core/NOAX_FINAL_STATEMENTS.txt` and `docs/core/ASSUMPTIONS_LEDGER.md`.

## Remaining requirements

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (No supercritical ERU modes, Lemma ``Window-compatibility bridge'') | ABIERTO |
| `ctx_real_logR_alpha_upper ERURH.Alpha.ctx_real_window` | Gate | `tools/check_rms_mode_bridge.py`; `docs/core/P16_GATE_FULL.txt`; `docs/core/P17_GATE_FULL.txt`; `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md` | CERRADO (gate) |
| `AxiomsShimAccepted.alphaInterfacesBase` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumptions classical/explicit) | ABIERTO |
| `AxiomsShimAccepted.explicit_alpha_via_stages` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula assumption) | ABIERTO |
| `AxiomsShimAccepted.xi_bounds_alpha` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (explicit-formula bounds section) | ABIERTO |
| `AxiomsShimAccepted.h_xi_bounds_alpha` | Lean packaging | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:27` | ABIERTO |
| `AxiomsShimAccepted.xi_argument_alpha` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (argument bounds section) | ABIERTO |
| `AxiomsShimAccepted.h_xi_argument_alpha` | Lean packaging | `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:29` | ABIERTO |
| `AxiomsShimAccepted.xi_bounds_alpha_of_hypotheses` | Paper | `arxiv_submission/assumptions_ledger.tex` (classical implications) | ABIERTO |
| `AxiomsShimAccepted.xi_argument_alpha_of_hypotheses` | Paper | `arxiv_submission/assumptions_ledger.tex` (classical implications) | ABIERTO |
| `AxiomsShimAccepted.rh_from_E_alpha_of_hypotheses` | Paper | `arxiv_submission/assumptions_ledger.tex` (E-to-RH checklist) | ABIERTO |
| `AxiomsShimAccepted.h_inertia_to_E` | Paper | `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound) | ABIERTO |
| `AxiomsShimAccepted.h_inertia_of_E` | Paper | `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound) | ABIERTO |
| `AxiomsShimAccepted.h_RH_to_E` | Paper | `arxiv_submission/assumptions_ledger.tex` (RH implies E-bound) | ABIERTO |
