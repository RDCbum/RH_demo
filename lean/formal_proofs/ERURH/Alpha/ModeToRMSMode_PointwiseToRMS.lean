import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.ModeToRMSMode_Window

namespace ERURH
namespace Alpha

/-- Lemma B.1 (paper): pointwise lower bound -> RMS_mode lower bound. -/
axiom pointwise_to_RMS_mode
  (β : ℝ) (hβ : β > (1/2 : ℝ)) (hmode : ERU_mode_beta β) :
  ∃ K : ℝ,
    K > GeneratedRMSContext.ctx_real.c_low +
        GeneratedRMSContext.ctx_real.c_tail +
        C_envelope_formal ∧
    GeneratedRMSContext.ctx_real.RMS_mode ctx_real_window ≥ K

end Alpha
end ERURH
