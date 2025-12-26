import ERURH.RH_Unconditional_Core
import ERURH.Alpha.GeneratedRMSContextEnvelope

namespace ERURH

/-- Attempt to derive RH unconditionally by exposing missing assumptions. -/
theorem RH_unconditional_try : RiemannHypothesis xiAlpha := by
  have hAxioms : AxiomsShimAccepted := by
    skip
  have hNumeric : NumericCoverageAlpha Alpha.GeneratedRMSContext.ctx_real := by
    simpa [NumericCoverageAlpha] using
      ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed
  exact RH_unconditional_core hAxioms hNumeric

end ERURH
