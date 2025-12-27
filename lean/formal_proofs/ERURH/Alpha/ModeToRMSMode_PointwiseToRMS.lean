import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.ModeToRMSMode_Window

namespace ERURH
namespace Alpha

/-- Lemma B.1 goal: pointwise ERU growth should force an RMS_mode lower bound. -/
def mode_to_rms_mode_pointwise_goal
  (β : ℝ) (hβ : β > (1/2 : ℝ)) (hmode : ERU_mode_beta β) : Prop :=
  ∃ K : ℝ,
    K > GeneratedRMSContext.ctx_real.c_low +
        GeneratedRMSContext.ctx_real.c_tail +
        C_envelope_formal ∧
    GeneratedRMSContext.ctx_real.RMS_mode ctx_real_window ≥ K

end Alpha
end ERURH
