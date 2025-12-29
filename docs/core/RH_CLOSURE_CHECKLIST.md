# RH Closure Checklist (post-NOAX)

Source of truth: `docs/core/NOAX_FINAL_STATEMENTS.txt` and `docs/core/ASSUMPTIONS_LEDGER.md`.

## Remaining requirements

Primary route (legacy window-free) is listed below. The fixed-window route
still has one open analytic item: `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily`.

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption `assm:threshold-control`, No supercritical ERU modes) | ABIERTO |
| `∀ w, ctx_real_logR_alpha_upper w` | Gate | `tools/check_rms_mode_bridge.py`; `docs/core/P16_GATE_FULL.txt`; `docs/core/P17_GATE_FULL.txt`; `docs/core/P35_GATE_FULL.txt`; `docs/core/P16_LOGR_ALPHA_UPPER_CERT.md` | CERRADO (gate) |
| `windowMinMax ≥ s0` (formal report) | Gate | `tools/check_rms_context.py`; `docs/core/P26_WINDOWMIN_THRESHOLD_CERT.md`; `docs/core/P35_GATE_FULL.txt` | CERRADO (gate) |
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

## Legacy route (experimental)

Legacy core (`RH_unconditional_core_legacy`) removes the fixed-window bridge and
instead assumes the analytic A1 implication directly.

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.A1_from_supercritical ERURH.Alpha.GeneratedRMSContext.ctx_real` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a1-from-supercritical`) | CERRADO (paper) |

## Legacy window-free route (abstract ctx)

This route removes the fixed-window cofinality step by keeping the RMS context
abstract. It requires the following analytic inputs for a chosen context `ctx`.

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.A1_from_supercritical ctx` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a1-from-supercritical`) | CERRADO (paper) |
| `ERURH.A2Low_RMS ctx` | Paper (A/B/C) | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`) | CERRADO (paper) |
| `ERURH.A2Tail_RMS ctx` | Paper (A/B/C) | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`) | CERRADO (paper) |
| `ERURH.Alpha.RMS_envelope_closed ctx` | Gate/Certs (if ctx instantiated) | `lean/formal_proofs/ERURH/ERURH_GatesAlpha.lean` | ABIERTO |
