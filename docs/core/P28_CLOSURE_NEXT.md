# P28 Closure Next Plan

This plan enumerates remaining open items from `docs/core/RH_CLOSURE_CHECKLIST.md`
and groups them into: (i) window-bridge, (ii) AxiomsShimAccepted, (iii) Lean packaging.

## (i) Window-bridge

- `ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow`
  - Lean location: `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:15-18`
  - TeX location: `arxiv_submission/ERURH_Conditional_Proof.tex`, Section "No supercritical ERU modes",
    Lemma "Window-compatibility bridge"
  - Missing evidence: full paper proof of the window-above-threshold step
    (showing `I_ctx ⊆ [s0,∞)` after unpacking `ERU_mode_beta β`).

## (ii) AxiomsShimAccepted (paper/citation closure)

Lean fields live in `lean/formal_proofs/ERURH/AxiomsShimBundle.lean:24-43`.
Each item below needs an explicit paper statement + reference/proof.

- `alphaInterfacesBase` (`AxiomsShimBundle.lean:24`)
  - TeX location: `arxiv_submission/ERURH_Conditional_Proof.tex`, Assumption~\ref{assm:explicit}
  - Missing evidence: explicit statement that the alpha interface package
    (explicit formula data for `log R` and `J_rel`) is assumed/proved.
- `explicit_alpha_via_stages` (`AxiomsShimBundle.lean:25`)
  - TeX location: `arxiv_submission/ERURH_Conditional_Proof.tex`, Assumption~\ref{assm:explicit}
  - Missing evidence: explicit statement that the explicit-formula laws used by Lean
    hold (with citation or proof).
- `xi_bounds_alpha` (`AxiomsShimBundle.lean:26`)
  - TeX location: to add in `arxiv_submission/assumptions_ledger.tex` or a dedicated
    subsection in `ERURH_Conditional_Proof.tex`
  - Missing evidence: statement of the xi bounds and citation/proof.
- `xi_argument_alpha` (`AxiomsShimBundle.lean:28`)
  - TeX location: to add in `arxiv_submission/assumptions_ledger.tex` or a dedicated
    subsection in `ERURH_Conditional_Proof.tex`
  - Missing evidence: statement of the xi argument bounds and citation/proof.
- `xi_bounds_alpha_of_hypotheses` (`AxiomsShimBundle.lean:30-31`)
  - TeX location: `arxiv_submission/assumptions_ledger.tex` (classical implications)
  - Missing evidence: explicit implication statement from hypotheses to `xi_bounds_alpha`.
- `xi_argument_alpha_of_hypotheses` (`AxiomsShimBundle.lean:32-33`)
  - TeX location: `arxiv_submission/assumptions_ledger.tex` (classical implications)
  - Missing evidence: explicit implication statement from hypotheses to `xi_argument_alpha`.
- `rh_from_E_alpha_of_hypotheses` (`AxiomsShimBundle.lean:34-37`)
  - TeX location: `arxiv_submission/assumptions_ledger.tex` (E-to-RH checklist)
  - Missing evidence: explicit statement that the classical hypotheses imply `RHfromE`.
- `h_inertia_to_E` (`AxiomsShimBundle.lean:39`)
  - TeX location: `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound link)
  - Missing evidence: explicit statement + citation for ERU inertia ⇒ strong E-bound.
- `h_inertia_of_E` (`AxiomsShimBundle.lean:41`)
  - TeX location: `arxiv_submission/assumptions_ledger.tex` (ERU inertia/E-bound link)
  - Missing evidence: explicit statement + citation for strong E-bound ⇒ ERU inertia.
- `h_RH_to_E` (`AxiomsShimBundle.lean:43`)
  - TeX location: `arxiv_submission/assumptions_ledger.tex` (RH ⇒ E-bound link)
  - Missing evidence: explicit statement + citation for RH ⇒ strong E-bound.

## (iii) Lean packaging (non-mathematical glue)

These are proof-packaging fields that should be marked closed once the paper
statements for `xi_bounds_alpha` and `xi_argument_alpha` are explicit.

- `h_xi_bounds_alpha` (`AxiomsShimBundle.lean:27`)
  - TeX location: same as `xi_bounds_alpha`
  - Missing evidence: explicit statement of `xi_bounds_alpha` (then the proof term
    is just the Lean witness for that assumption).
- `h_xi_argument_alpha` (`AxiomsShimBundle.lean:29`)
  - TeX location: same as `xi_argument_alpha`
  - Missing evidence: explicit statement of `xi_argument_alpha`.
