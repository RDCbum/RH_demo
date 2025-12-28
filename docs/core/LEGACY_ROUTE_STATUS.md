# Legacy route status (exp/legacy_window_route)

## What changed
- The legacy bridge now uses a threshold-control gap tied to the ctx_real window family.
- The fixed-window hypothesis is replaced by `Alpha.ModeThresholdControlOnCtxRealWindowFamily`,
  which requires the ERU-mode lower bound to start no later than the smallest ctx_real window min.
- The gate side condition `∀ w, ctx_real_logR_alpha_upper w` remains unchanged.

## Current remaining gaps
- `Alpha.ModeThresholdControlOnCtxRealWindowFamily` (analytic threshold-control bridge; not discharged).
- `ctx_real_logR_alpha_upper` remains gate-certified (same as before).

## Evidence
- Statements: `docs/core/LEGACY_ROUTE_FINAL_STATEMENTS.txt`
- Gap export: `docs/core/LEGACY_ROUTE_GAP_STATEMENTS.txt`
- Build log: `docs/core/LEGACY_WINDOW_REPLAN_BUILD.txt`
- Gate log: `docs/core/LEGACY_WINDOW_REPLAN_GATE_FULL.txt`

## Notes
This route avoids the fixed-window threshold step `s0 ≤ windowMin` by requiring a
uniform threshold control over the ctx_real window family. That new condition is
the legacy gap to analyze next.
