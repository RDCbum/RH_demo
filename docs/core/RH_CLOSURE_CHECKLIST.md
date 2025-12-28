# RH Closure Checklist (post-NOAX)

Source of truth: `docs/core/NOAX_FINAL_STATEMENTS.txt` and `docs/core/ASSUMPTIONS_LEDGER.md`.

## Remaining requirements

Only open analytic item: `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`.

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption `assm:threshold-control`, No supercritical ERU modes) | ABIERTO |
| `∀ w, ctx_real_logR_alpha_upper w` | Gate | `tools/check_rms_mode_bridge.py`; `docs/core/P16_GATE_FULL.txt`; `docs/core/P17_GATE_FULL.txt`; `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md` | CERRADO (gate) |
| `windowMinMax ≥ s0` (formal report) | Gate | `tools/check_rms_context.py`; `docs/core/P26_WINDOWMIN_THRESHOLD_CERT.md` | CERRADO (gate) |
| `AxiomsShimAccepted.alphaInterfacesBase` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.explicit_alpha_via_stages` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.xi_bounds_alpha` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.h_xi_bounds_alpha` | Lean packaging | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (Lean packaging) |
| `AxiomsShimAccepted.xi_argument_alpha` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.h_xi_argument_alpha` | Lean packaging | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (Lean packaging) |
| `AxiomsShimAccepted.xi_bounds_alpha_of_hypotheses` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.xi_argument_alpha_of_hypotheses` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.rh_from_E_alpha_of_hypotheses` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.h_inertia_to_E` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.h_inertia_of_E` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
| `AxiomsShimAccepted.h_RH_to_E` | Paper | `arxiv_submission/assumptions_ledger.tex` (AxiomsShimAccepted field map) | CERRADO (paper) |
