import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.ModeToRMSMode_Window
import ERURH.Alpha.RMSModeSemantic
import ERURH.Alpha.GeneratedRMSModeBridge

open ERURH

/-- Bridge attempt: semantic RMS bound -> numeric table bound. -/
theorem pointwise_to_rms_mode_bridge_try
    (K : ℝ)
    (hpoint : ∀ s ∈ Alpha.GeneratedRMSContext.ctx_real_window_interval Alpha.ctx_real_window,
      |logR_alpha s| ≥ K)
    (h_upper : ctx_real_logR_alpha_upper Alpha.ctx_real_window) :
    Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥ K := by
  have h_semantic : Alpha.rms_semantic Alpha.ctx_real_window ≥ K :=
    Alpha.pointwise_to_rms_semantic Alpha.ctx_real_window K hpoint
  have h_bridge :
      Alpha.GeneratedRMSContext.ctx_real.RMS_mode Alpha.ctx_real_window ≥
        Alpha.rms_semantic Alpha.ctx_real_window :=
    ctx_real_rms_mode_ge_semantic Alpha.ctx_real_window h_upper
  exact le_trans h_semantic h_bridge
