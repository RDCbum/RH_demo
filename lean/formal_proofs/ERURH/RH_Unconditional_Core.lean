import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.ModeToRMSMode
import ERURH.Alpha.ModeToRMSMode_WindowBridge_Legacy
import ERURH.Alpha.RMS_Incompatibility
import ERURH.ERUModesAlpha
import ERURH.ERURH_MasterTheoremPlanB

namespace ERURH

/-- Core unconditional route: if the axioms shim and numeric coverage hold for
the fixed RMS context, then there are no supercritical modes and RH follows. -/
theorem RH_unconditional_core
  (hAxioms : AxiomsShimAccepted)
  (h_upper : ∀ w : Alpha.GeneratedRMSContext.ctx_real.Window,
      _root_.ctx_real_logR_alpha_upper w)
  (h_compat : Alpha.WindowBridgeCompat)
  (hNumeric : NumericCoverageAlpha Alpha.GeneratedRMSContext.ctx_real) :
  RiemannHypothesis xiAlpha := by
  let ctx := Alpha.GeneratedRMSContext.ctx_real
  have h_bridge : Alpha.SupercriticalModeAppliesOnSomeCtxRealWindow :=
    Alpha.supercritical_mode_applies_on_some_ctx_real_window
      Alpha.ERU_mode_beta_implies_SupercriticalModeAppliesOnSomeWindow
      h_compat
  have hB1 : Alpha.PointwiseToRMSModeSomeWindow Alpha.GeneratedRMSContext.ctx_real :=
    Alpha.pointwise_to_RMS_mode_some_window_of_logR_alpha_upper_and_window_bridge
      h_upper h_bridge
  have hLow : A2Low_RMS ctx := by
    simpa [ctx] using Alpha.GeneratedRMSContext.ctx_real_A2Low
  have hTail : A2Tail_RMS ctx := by
    simpa [ctx] using Alpha.GeneratedRMSContext.ctx_real_A2Tail
  have h_no_modes : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
    intro β hβ h_mode
    have hA1 : A1_mode ctx := by
      simpa [ctx] using (hB1 β hβ h_mode)
    have hClosed : Alpha.RMS_envelope_closed ctx := by
      simpa [ctx, NumericCoverageAlpha] using hNumeric
    exact Alpha.A1A2_decomp_envelope_inconsistent ctx hA1 hLow hTail hClosed
  have h_inertia : InertiaERU_alpha_strong :=
    InertiaERU_alpha_strong_of_no_modes_via_certificates hAxioms h_no_modes
  exact (ERU_RH_equiv_alpha_of_axioms hAxioms).1 h_inertia

end ERURH
