import ERURH.A1FromSupercriticalMode
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.RMS_Incompatibility
import ERURH.ERUModesAlpha
import ERURH.ERURH_MasterTheoremPlanB

namespace ERURH

/-- Attempt to derive RH unconditionally by exposing missing assumptions. -/
theorem RH_unconditional_try : RiemannHypothesis xiAlpha := by
  let ctx := Alpha.GeneratedRMSContext.ctx_real
  have hLow : A2Low_RMS ctx := Alpha.GeneratedRMSContext.ctx_real_A2Low
  have hTail : A2Tail_RMS ctx := Alpha.GeneratedRMSContext.ctx_real_A2Tail
  have hAxioms : AxiomsShimAccepted := by
    exact ?hAxioms
  have hNumeric : NumericCoverageAlpha ctx := by
    exact ?hNumeric
  have h_no_modes : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
    intro β hβ h_mode
    have hA1 : A1_mode ctx := A1_mode_of_supercritical β hβ h_mode
    have hClosed : Alpha.RMS_envelope_closed ctx := by
      simpa [NumericCoverageAlpha] using hNumeric
    exact Alpha.A1A2_decomp_envelope_inconsistent ctx hA1 hLow hTail hClosed
  have h_inertia : InertiaERU_alpha_strong :=
    InertiaERU_alpha_strong_of_no_modes_via_certificates hAxioms h_no_modes
  exact (ERU_RH_equiv_alpha_of_axioms hAxioms).1 h_inertia

end ERURH
