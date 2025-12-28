# Legacy window model constraints

## Current data model (gate)
- `data/releases/erurh-v2-core/formal/rms_context.json`:
  - `n_windows = 1`
  - one window with fixed `s_min/s_max`, and fixed `RMS_mode/RMS_low/RMS_tail`.
- `data/releases/erurh-v2-core/formal/rms_mode_bridge.json`:
  - one witness `s_wit` and bound `u_wit` for the same window.
- Generator: `tools/make_rms_context.py` emits `GeneratedRMSContext.lean`
  with `Window := Fin n_windows` and lookup tables.

## Why the legacy gap persists
The legacy bridge selects a window above the ERU-mode threshold `s0`.
With `Window := Fin n_windows` and `n_windows = 1`, any compatibility lemma
reduces to the same bound as before: `s0 ≤ windowMin`.

## What a variable-window model would require
To allow windows chosen from `s0`, we would need **window-indexed data**:
`RMS_mode/RMS_low/RMS_tail` plus `s_wit/u_wit` for each window in a family.
That implies one of:
1) A finite window family that is provably sufficient (requires an analytic
   bound on `s0` to ensure `s0 ≤ max windowMin`).
2) A parametric window family (infinite), which would require new gate
   certificates or analytic semantics for all windows.

## Next step in the experiment
Reduce `WindowBridgeCompat` to an explicit bound of the form
`s0 ≤ max windowMin` and document the resulting gap.
If we later extend the window list in `rms_context.json`, this bound can be
weakened without changing the proof structure.
