import ERURH.RH_Unconditional_Core

namespace ERURH

/-- Attempt to derive RH unconditionally by exposing missing assumptions. -/
theorem RH_unconditional_try : RiemannHypothesis xiAlpha := by
  refine RH_unconditional_core ?_ ?_
  · exact ?hAxioms
  · simpa [NumericCoverageAlpha] using
      ERURH.Alpha.GeneratedRMSContext.ctx_real_RMS_envelope_closed

end ERURH
