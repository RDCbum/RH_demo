import ERURH.RH_Unconditional_Core_Legacy
import ERURH.Alpha.GeneratedRMSContextEnvelope

namespace ERURH

/-- Legacy Route B theorem with explicit analytic A1 hypothesis. -/
theorem RH_unconditional_assuming_legacy
    (hAxioms : AxiomsShimAccepted)
    (hA1 : A1_from_supercritical Alpha.GeneratedRMSContext.ctx_real) :
    RiemannHypothesis xiAlpha := by
  refine RH_unconditional_core_legacy hAxioms hA1 ?_
  simpa [NumericCoverageAlpha] using
    ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed

end ERURH
