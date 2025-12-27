import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH
namespace Alpha

/-- Paper Lemma B (Route B): mode growth forces an RMS_mode witness for ctx_real. -/
axiom mode_to_rms_mode_axiom
  (β : ℝ) (hβ : β > (1/2 : ℝ)) (hmode : ERU_mode_beta β) :
  ∃ w : GeneratedRMSContext.ctx_real.Window,
    ∃ K : ℝ,
      K > GeneratedRMSContext.ctx_real.c_low +
          GeneratedRMSContext.ctx_real.c_tail +
          C_envelope_formal ∧
      GeneratedRMSContext.ctx_real.RMS_mode w ≥ K

end Alpha
end ERURH
