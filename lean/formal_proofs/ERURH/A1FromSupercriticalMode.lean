import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH

/-- Analytic gap: a supercritical ERU mode forces the A1-mode hypothesis
for the RMS context fixed by gate/data. -/
axiom A1_mode_of_supercritical
  (β : ℝ) (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → A1_mode Alpha.GeneratedRMSContext.ctx_real

end ERURH
