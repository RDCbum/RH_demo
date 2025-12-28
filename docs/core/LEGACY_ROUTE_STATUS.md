# Legacy route status (exp/legacy_window_route)

## What changed
- Route B core now uses the legacy window bridge (window chosen above the ERU-mode threshold).
- The fixed-window hypothesis `SupercriticalModeAppliesOnCtxRealWindow` is replaced by:
  - `Alpha.WindowBridgeCompat` (compatibility between threshold windows and ctx_real windows),
  - and the gate side condition `∀ w, ctx_real_logR_alpha_upper w`.

## Current remaining gaps
- `Alpha.WindowBridgeCompat` (analytic/structural bridge; not discharged).
- `ctx_real_logR_alpha_upper` remains gate-certified (same as before).

## Evidence
- Statements: `docs/core/LEGACY_ROUTE_FINAL_STATEMENTS.txt`
- Gap export: `docs/core/LEGACY_ROUTE_GAP_STATEMENTS.txt`
- Build log: `docs/core/LEGACY_ROUTE_BUILD.txt`

## Notes
This route avoids the fixed-window threshold step `s0 ≤ windowMin`, but introduces
the compatibility condition between arbitrary threshold windows and the fixed
ctx_real window set. That new condition is the legacy gap to analyze next.
