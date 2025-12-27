# P13 window interval + RMS semantics

## Window interval (data -> Lean)
- Added `s_min` and `s_max` to `rms_context.json` (release + paper copy).
- Generator now emits `window_interval w := Set.Icc (windowMin w) (windowMax w)` in
  `lean/formal_proofs/ERURH/Alpha/GeneratedRMSContext.lean`, with proofs that the interval is nonempty.

## Semantic RMS (Lean)
- New module: `lean/formal_proofs/ERURH/Alpha/RMSModeSemantic.lean`.
- Defines `rms_semantic_values w := {x | ∃ s ∈ window_interval w, x = |logR_alpha s|}`.
- Defines `rms_semantic w := sInf (rms_semantic_values w)` as the semantic lower bound.
- Proves `pointwise_to_rms_semantic`:
  if `|logR_alpha s| ≥ K` for all `s ∈ window_interval w`, then `rms_semantic w ≥ K`.

## Why this is minimal
- No new axioms or constants; only definitional extensions and a generic lemma.
- Avoids integrals; uses an infimum over pointwise values to keep the proof lightweight.
- Sets up the missing bridge: the remaining step is to relate the numeric table
  `ctx_real.RMS_mode` to `rms_semantic` for the same window.
