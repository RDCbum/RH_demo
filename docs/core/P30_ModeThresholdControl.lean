import ERURH.ERUModesCore
import ERURH.Alpha.ModeToRMSMode_Window
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH
namespace Alpha

/-- Proposed bridge lemma (Option 2):
the supercritical-mode threshold can be chosen below the fixed window. -/
def ModeThresholdControlOnCtxRealWindow : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    ∃ s0 : ℝ, s0 ≤ _root_.windowMin ctx_real_window ∧
      ∀ {s : ℝ}, s ≥ s0 →
        |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)

end Alpha
end ERURH
