import ERURH.Alpha.CtxRealNonVacuityAudit
import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

open ERURH

/-- If A1_mode_of_supercritical holds but ctx_real fails A1_mode, then no supercritical modes exist. -/
theorem a1_impplies_no_supercritical
  (hA1 : ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
      A1_mode Alpha.GeneratedRMSContext.ctx_real) :
  ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
  intro β hβ hmode
  have hNotA1 : ¬ A1_mode Alpha.GeneratedRMSContext.ctx_real := ctx_real_not_A1_mode
  exact hNotA1 (hA1 β hβ hmode)

/-- If there are no supercritical modes, A1_mode_of_supercritical holds vacuously. -/
theorem no_supercritical_implies_a1
  (hNo : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β) :
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    A1_mode Alpha.GeneratedRMSContext.ctx_real := by
  intro β hβ hmode
  exact False.elim (hNo β hβ hmode)
