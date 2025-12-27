import ERURH.Alpha.ModeToRMSMode_WindowBridge

open ERURH
open ERURH.Alpha

theorem window_bridge_try : ERURH.Alpha.SupercriticalModeAppliesOnCtxRealWindow := by
  intro β hβ hmode s hs
  -- goal intentionally left open for diagnostics
