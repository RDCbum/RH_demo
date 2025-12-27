import ERURH.Alpha.ModeToRMSMode_WindowBridge
import ERURH.Alpha.GeneratedRMSModeBridge
import ERURH.Alpha.ModeToRMSMode_PointwiseToRMS
import ERURH.Alpha.ModeToRMSMode_Window
import ERURH.Alpha.GeneratedRMSContext

open ERURH
open ERURH.Alpha

example
    (h_upper : _root_.ctx_real_logR_alpha_upper ctx_real_window)
    (h_bridge : SupercriticalModeAppliesOnCtxRealWindow) :
    PointwiseToRMSMode GeneratedRMSContext.ctx_real ctx_real_window :=
  pointwise_to_RMS_mode_of_ctx_real_logR_alpha_upper_and_window_bridge
    h_upper h_bridge
