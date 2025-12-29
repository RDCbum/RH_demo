import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses

namespace ERURH

/-- Legacy analytic hypothesis: supercritical mode implies A1_mode. -/
def A1_from_supercritical (ctx : RMSLocalContext) : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β → A1_mode ctx

end ERURH
