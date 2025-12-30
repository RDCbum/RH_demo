# RH Closure Checklist (post-NOAX)

Source of truth: `docs/core/NOAX_FINAL_STATEMENTS.txt` and `docs/core/ASSUMPTIONS_LEDGER.md`.

## Remaining requirements

Two routes are maintained. The legacy window-free route is the primary
paper-driven path; the fixed-window route is the alternative computational path.

## Primary route (legacy window-free)

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.A1_from_supercritical ctx` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a1-from-supercritical`) | ABIERTO (paper) |
| `ERURH.A2Low_RMS ctx` | Paper (A/B/C) | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`) | CERRADO (paper) |
| `ERURH.A2Tail_RMS ctx` | Paper (A/B/C) | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `a2-from-abc`) | CERRADO (paper) |
| `ERURH.Alpha.RMS_envelope_closed ctx` | Gate/Certs (if ctx instantiated) | `lean/formal_proofs/ERURH/ERURH_GatesAlpha.lean` | ABIERTO |
| `AxiomsShimAccepted.*` | Paper | `arxiv_submission/assumptions_ledger.tex` (field map) | CERRADO (paper) |

## Alternative route (fixed-window computational)

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.Alpha.ModeThresholdControlOnCtxRealWindowFamily` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Assumption `assm:threshold-control`, proof outline) | ABIERTO (paper; proof sketch) |
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

## Optional derivation of A1 (Buchstab bridge)

The Buchstab bridge provides one analytic derivation of
`ERURH.A1_from_supercritical`. The Lean gap statements export the Buchstab
package explicitly.

| Hypothesis (Lean) | How discharged | Evidence | Status |
| --- | --- | --- | --- |
| `ERURH.A1_from_supercritical_buchstab ctx` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemmas `a1-from-supercritical-buchstab`, `buchstab-coefficient`) | ABIERTO (paper) |
| `ERURH.ExplicitBRhoExpression` | Paper | `arxiv_submission/ERURH_Conditional_Proof.tex` (Lemma `buchstab-coefficient`, explicit-formula identification) | ABIERTO (paper) |
