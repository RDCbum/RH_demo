import ERURH.A1FromSupercriticalMode_Legacy
import ERURH.Alpha.RMS_Incompatibility
import ERURH.ERUModesAlpha
import ERURH.ERURH_MasterTheoremPlanB

namespace ERURH

/-- Legacy window-free core: abstract context, no fixed window family. -/
theorem RH_unconditional_core_window_free
  (ctx : RMSLocalContext)
  (hAxioms : AxiomsShimAccepted)
  (hA1 : A1_from_supercritical ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx)
  (hClosed : Alpha.RMS_envelope_closed ctx) :
  RiemannHypothesis xiAlpha := by
  have h_no_modes : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
    intro β hβ hmode
    have hA1' : A1_mode ctx := hA1 β hβ hmode
    exact Alpha.A1A2_decomp_envelope_inconsistent ctx hA1' hLow hTail hClosed
  have h_inertia : InertiaERU_alpha_strong :=
    InertiaERU_alpha_strong_of_no_modes_via_certificates hAxioms h_no_modes
  exact (ERU_RH_equiv_alpha_of_axioms hAxioms).1 h_inertia

end ERURH
