import ERURH.AxiomsShimBundle
import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH

/-- Analytic gap (now explicit in the shim bundle). -/
theorem A1_mode_of_supercritical
  (hAxioms : AxiomsShimAccepted)
  (β : ℝ) (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → A1_mode Alpha.GeneratedRMSContext.ctx_real := by
  exact hAxioms.a1_mode_of_supercritical β hβ

end ERURH
