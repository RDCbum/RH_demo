import ERURH.RH_Unconditional_Core
import ERURH.Alpha.GeneratedRMSContextEnvelope

namespace ERURH

/-- Attempt to derive RH unconditionally by exposing missing assumptions. -/
theorem RH_unconditional_try
    (hAxioms : AxiomsShimAccepted)
    (h_upper : ∀ w : Alpha.GeneratedRMSContext.ctx_real.Window,
      _root_.ctx_real_logR_alpha_upper w)
    (h_ctrl : Alpha.ModeThresholdControlOnCtxRealWindowFamily) :
    RiemannHypothesis xiAlpha := by
  have hNumeric : NumericCoverageAlpha Alpha.GeneratedRMSContext.ctx_real := by
    simpa [NumericCoverageAlpha] using
      ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed
  exact RH_unconditional_core hAxioms h_upper h_ctrl hNumeric

end ERURH
