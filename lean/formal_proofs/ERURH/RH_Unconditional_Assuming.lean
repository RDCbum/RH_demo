import ERURH.RH_Unconditional_Core
import ERURH.Alpha.GeneratedRMSContextEnvelope

namespace ERURH

/-- Unconditional Route B theorem with explicit axioms shim. -/
theorem RH_unconditional_assuming
    (hAxioms : AxiomsShimAccepted)
    (h_upper : _root_.ctx_real_logR_alpha_upper Alpha.ctx_real_window)
    (h_bridge : Alpha.SupercriticalModeAppliesOnCtxRealWindow) :
    RiemannHypothesis xiAlpha := by
  refine RH_unconditional_core hAxioms h_upper h_bridge ?_
  simpa [NumericCoverageAlpha] using
    ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed

end ERURH
