import ERURH.A1FromSupercriticalMode_Legacy
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.RMS_Incompatibility
import ERURH.ERUModesAlpha
import ERURH.ERURH_MasterTheoremPlanB

namespace ERURH

/-- Legacy core route: A1 (analytic), A2 (ctx_real), and numeric envelope imply RH. -/
theorem RH_unconditional_core_legacy
  (hAxioms : AxiomsShimAccepted)
  (hA1 : A1_from_supercritical Alpha.GeneratedRMSContext.ctx_real)
  (hNumeric : NumericCoverageAlpha Alpha.GeneratedRMSContext.ctx_real) :
  RiemannHypothesis xiAlpha := by
  let ctx := Alpha.GeneratedRMSContext.ctx_real
  have hLow : A2Low_RMS ctx := by
    simpa [ctx] using Alpha.GeneratedRMSContext.ctx_real_A2Low
  have hTail : A2Tail_RMS ctx := by
    simpa [ctx] using Alpha.GeneratedRMSContext.ctx_real_A2Tail
  have hClosed : Alpha.RMS_envelope_closed ctx := by
    simpa [ctx, NumericCoverageAlpha] using hNumeric
  have h_no_modes : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
    intro β hβ hmode
    have hA1' : A1_mode ctx := hA1 β hβ hmode
    exact Alpha.A1A2_decomp_envelope_inconsistent ctx hA1' hLow hTail hClosed
  have h_inertia : InertiaERU_alpha_strong :=
    InertiaERU_alpha_strong_of_no_modes_via_certificates hAxioms h_no_modes
  exact (ERU_RH_equiv_alpha_of_axioms hAxioms).1 h_inertia

end ERURH
