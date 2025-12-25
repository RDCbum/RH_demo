import ERURH.ERURH_MasterTheoremSummary

namespace ERURH

/-- Attempt to derive RH unconditionally by exposing missing assumptions. -/
theorem RH_unconditional_try : RiemannHypothesis xiAlpha := by
  refine RH_from_ERURH_conditional ?G ?hAxioms ?hCerts ?hNumeric
  · -- Build the global assumptions bundle to surface required fields.
    refine ERURH_GlobalAssumptions.mk ?eru ?window
    · refine ERURH_Assumptions.mk ?classical ?spectral ?ls_gamma ?explicit_formula_ERU ?beta_inert
    · refine WindowScalingAssumptions.mk ?ctx ?hA1 ?hLow ?hTail

end ERURH
