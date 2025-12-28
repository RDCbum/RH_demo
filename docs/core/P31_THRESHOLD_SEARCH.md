# P31 Threshold search (ERU_mode_beta → windowMin)

## Ripgrep results (high level)

- `ERU_mode_beta` appears only as a hypothesis; no lemmas bound its `s0`:
  - `lean/formal_proofs/ERURH/ERUModesCore.lean:11-13` (definition).
  - `lean/formal_proofs/ERURH/Alpha/ModeToRMSMode_WindowBridge.lean:15-18` (bridge).
- No lemma found that relates `s0` from `ERU_mode_beta` to `windowMin` or any fixed threshold.

## Conclusion

There is currently **no material** in the repository that bounds the `s0`
witness of `ERU_mode_beta` or replaces it by an explicit threshold. Any attempt
to prove `windowMin ≥ s0` requires a **new analytic hypothesis** (or a strengthened
definition of `ERU_mode_beta`).

## Needed new hypothesis (minimal)

Use the proposed lemma in `docs/core/P30_MODE_THRESHOLD_CONTROL.md`:

`ModeThresholdControlOnCtxRealWindow` — existence of `s0 ≤ windowMin` such that
the mode bound applies for all `s ≥ s0`. This is sufficient to derive
`SupercriticalModeAppliesOnCtxRealWindow`.
