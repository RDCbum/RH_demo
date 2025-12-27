import ERURH.Alpha.ModeToRMSMode_PointwiseToRMS
import ERURH.Alpha.ModeToRMSMode_Window

namespace ERURH
namespace Alpha

/-- Placeholder for the Pointwise-to-RMS proof target (not wired into the core). -/
def pointwise_to_rms_mode_goal : Prop :=
  PointwiseToRMSMode GeneratedRMSContext.ctx_real ctx_real_window

end Alpha
end ERURH
