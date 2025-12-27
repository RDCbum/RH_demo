import ERURH.Alpha.ModeToRMSMode_PointwiseToRMS
import ERURH.Alpha.ModeToRMSMode_Window

namespace ERURH
namespace Alpha

/-- Paper Lemma B (Route B): mode growth forces an RMS_mode witness for ctx_real. -/
theorem mode_to_rms_mode
  (β : ℝ) (hβ : β > (1/2 : ℝ)) (hmode : ERU_mode_beta β) :
  ∃ w : GeneratedRMSContext.ctx_real.Window,
    ∃ K : ℝ,
      K > GeneratedRMSContext.ctx_real.c_low +
          GeneratedRMSContext.ctx_real.c_tail +
          C_envelope_formal ∧
      GeneratedRMSContext.ctx_real.RMS_mode w ≥ K := by
  obtain ⟨K, hK, hRMS⟩ := pointwise_to_RMS_mode β hβ hmode
  exact ⟨ctx_real_window, K, hK, hRMS⟩

end Alpha
end ERURH
