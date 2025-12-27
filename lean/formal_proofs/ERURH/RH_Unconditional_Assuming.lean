import ERURH.RH_Unconditional_Core
import ERURH.Alpha.GeneratedRMSContextEnvelope

namespace ERURH

/-- Unconditional Route B theorem with explicit axioms shim. -/
theorem RH_unconditional_assuming
    (hAxioms : AxiomsShimAccepted)
    (hB1 : Alpha.PointwiseToRMSMode Alpha.GeneratedRMSContext.ctx_real Alpha.ctx_real_window) :
    RiemannHypothesis xiAlpha := by
  refine RH_unconditional_core hAxioms hB1 ?_
  simpa [NumericCoverageAlpha] using
    ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed

end ERURH
