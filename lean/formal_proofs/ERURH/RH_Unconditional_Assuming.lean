import ERURH.RH_Unconditional_Core
import ERURH.Alpha.GeneratedRMSContextEnvelope

namespace ERURH

/-- Unconditional Route B theorem with explicit axioms shim. -/
theorem RH_unconditional_assuming
    (hAxioms : AxiomsShimAccepted)
    (h_upper : ∀ w : Alpha.GeneratedRMSContext.ctx_real.Window,
      _root_.ctx_real_logR_alpha_upper w)
    (h_compat : Alpha.WindowBridgeCompat) :
    RiemannHypothesis xiAlpha := by
  refine RH_unconditional_core hAxioms h_upper h_compat ?_
  simpa [NumericCoverageAlpha] using
    ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed

end ERURH
