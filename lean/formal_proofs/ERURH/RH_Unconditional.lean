import ERURH.RH_Unconditional_Core

namespace ERURH

/-- Attempt to derive RH unconditionally by exposing missing assumptions. -/
theorem RH_unconditional_try : RiemannHypothesis xiAlpha := by
  exact RH_unconditional_core ?hAxioms ?hNumeric

end ERURH
