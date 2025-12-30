# Legacy window-cofinality: gate assessment

Status note (legacy): These notes document the fixed-window cofinality gap for
`ctx_real`. The current primary route uses an abstract admissible window family
whose cofinality is definitional (see `arxiv_submission/ERURH_Conditional_Proof.tex`,
Definition `def:admissible-window`). The fixed-window route now uses the explicit
hypothesis `ModeThresholdControlOnCtxRealWindowFamily`; see
`docs/core/ROUTES_COMPARISON.md`.

## Question
Can the gate certify Lemma `ctxreal-window-cofinal` (existence of a ctx_real window above the
threshold `s0` coming from `ERU_mode_beta`)?

## Summary
Not with the current definitions. The witness `s0` in `ERU_mode_beta` is existential and
not linked to any explicit bound that the gate can check. A gate check can only certify
numerical inequalities for explicit constants.

## What would make it gate-certifiable
One of the following would be sufficient:
- An analytic lemma that provides an explicit bound `s0 <= S0(β)` for each β>1/2.
- A uniform bound `s0 <= S0` independent of β.
- A strengthened definition `ERU_mode_beta_at_ctx_real_window` that already fixes the
  threshold relative to the ctx_real window family.

## Current status
- We can certify numeric data about the window family (min/max endpoints) and envelope constants.
- We cannot certify `s0` itself, because it is produced existentially by `ERU_mode_beta`.

## Consequence
The window-cofinality step remains a paper-level lemma in the legacy route until an explicit
threshold bound is proved (analytically) or redefined into the hypothesis.
