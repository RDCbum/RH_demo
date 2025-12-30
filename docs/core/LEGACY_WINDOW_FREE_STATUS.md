# Legacy Window-Free Route (exp/legacy_window_free)

## Goal
Recover the legacy Plan B route without fixing a ctx_real window family. The window
in A1_mode is existential in the RMSLocalContext, so no cofinality/threshold bridge
is required.

## Core theorem
- `lean/formal_proofs/ERURH/RH_Unconditional_Core_WindowFree.lean`
  (`RH_unconditional_core_window_free`).

## Inputs (explicit hypotheses)
- `A1_from_supercritical ctx`: analytic A1 implication (derived in Lean from
  `A1_from_supercritical_buchstab`; paper Lemmas `a1-from-supercritical-buchstab`
  and `buchstab-coefficient`).
- `A2Low_RMS ctx`, `A2Tail_RMS ctx`: analytic RMS controls derived from A/B/C
  (paper Lemma `a2-from-abc`).
- `RMS_envelope_closed ctx`: numeric envelope closure (gate/certificates if available).
- `AxiomsShimAccepted`: classical α-bridge / inertia implications.

## Gap status
The only remaining requirement is instantiating the abstract context with
gate/certified data if desired; the A1 and A2 analytic steps are covered in the
paper (Lemmas `a1-from-supercritical-buchstab` and `a2-from-abc`). There is no
fixed-window cofinality gap.

## Notes
This route decouples the contradiction from the concrete ctx_real window family.
If one wants to instantiate with ctx_real, additional data is needed to show that
`A1_from_supercritical` holds for ctx_real (via the Buchstab bridge and explicit
formula identification).
