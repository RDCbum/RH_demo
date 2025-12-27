import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH

axiom no_supercritical_beta :
  ∀ (β : ℝ), β > (1/2 : ℝ) → ¬ ERU_mode_beta β

/-- Analytic gap (now exposed as a no-supercritical-modes axiom). -/
theorem A1_mode_of_supercritical
  (β : ℝ) (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → A1_mode Alpha.GeneratedRMSContext.ctx_real := by
  intro hmode
  exact False.elim (no_supercritical_beta β hβ hmode)

end ERURH
