import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.ModeToRMSMode_Window

namespace ERURH
namespace Alpha

/-- Lemma B.1 (paper): pointwise lower bound -> RMS_mode lower bound. -/
abbrev PointwiseToRMSMode (ctx : RMSLocalContext) (w : ctx.Window) : Prop :=
  ∀ (β : ℝ), β > (1/2 : ℝ) → ERU_mode_beta β →
    ∃ K : ℝ,
      K > ctx.c_low + ctx.c_tail + C_envelope_formal ∧
      ctx.RMS_mode w ≥ K

end Alpha
end ERURH
