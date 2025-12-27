import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.ModeToRMSMode
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.CtxRealNonVacuityAudit

namespace ERURH

theorem no_supercritical_beta :
  ∀ (β : ℝ), β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
  intro β hβ hmode
  have hA1 : A1_mode Alpha.GeneratedRMSContext.ctx_real := by
    exact Alpha.mode_to_rms_mode β hβ hmode
  exact _root_.ctx_real_not_A1_mode hA1

/-- Analytic consequence of Lemma B + ctx_real_not_A1_mode. -/
theorem A1_mode_of_supercritical
  (β : ℝ) (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → A1_mode Alpha.GeneratedRMSContext.ctx_real := by
  intro hmode
  exact False.elim (no_supercritical_beta β hβ hmode)

end ERURH
