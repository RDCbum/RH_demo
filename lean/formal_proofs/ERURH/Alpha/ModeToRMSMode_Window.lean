import Mathlib
import ERURH.Alpha.GeneratedRMSContext

namespace ERURH
namespace Alpha

/-- The unique window for `ctx_real` (since `n_windows = 1`). -/
def ctx_real_window : GeneratedRMSContext.ctx_real.Window := by
  refine ⟨0, ?_⟩
  simp [n_windows]

/-- Window extraction for `ctx_real`: the existential reduces to the unique window. -/
lemma ctx_real_exists_window_ge_iff (K : ℝ) :
  (∃ w : GeneratedRMSContext.ctx_real.Window,
      GeneratedRMSContext.ctx_real.RMS_mode w ≥ K) ↔
    GeneratedRMSContext.ctx_real.RMS_mode ctx_real_window ≥ K := by
  simpa [GeneratedRMSContext.ctx_real, ctx_real, ctx_real_window, n_windows]

end Alpha
end ERURH
