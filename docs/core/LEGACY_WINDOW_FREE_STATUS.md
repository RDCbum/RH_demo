# Legacy Window-Free Route (exp/legacy_window_free)

## Goal
Recover the legacy Plan B route without fixing a ctx_real window family. The window
in A1_mode is existential in the RMSLocalContext, so no cofinality/threshold bridge
is required.

## Core theorem
- `lean/formal_proofs/ERURH/RH_Unconditional_Core_WindowFree.lean`
  (`RH_unconditional_core_window_free`).

## Inputs (explicit hypotheses)
- `A1_from_supercritical ctx`: analytic A1 implication (paper).
- `A2Low_RMS ctx`, `A2Tail_RMS ctx`: analytic RMS controls (paper / classical A/B/C).
- `RMS_envelope_closed ctx`: numeric envelope closure (gate/certificates if available).
- `AxiomsShimAccepted`: classical α-bridge / inertia implications.

## Gap status
The only analytic gap unique to this route is the proof of
`A1_from_supercritical` for the chosen context (paper Lemma
`a1-from-supercritical` in `arxiv_submission/ERURH_Conditional_Proof.tex`).
There is no fixed-window cofinality gap.

## Notes
This route decouples the contradiction from the concrete ctx_real window family.
If one wants to instantiate with ctx_real, additional data is needed to show that
A1_from_supercritical holds for ctx_real.
