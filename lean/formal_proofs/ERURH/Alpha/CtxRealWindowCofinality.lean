import ERURH.Alpha.GeneratedRMSContext

namespace ERURH
namespace Alpha

/-- Existence of a ctx_real window above a given threshold. -/
def ctx_real_window_above (s0 : ℝ) : Prop :=
  ∃ w : GeneratedRMSContext.ctx_real.Window,
    ∀ s ∈ GeneratedRMSContext.ctx_real_window_interval w, s ≥ s0

/-- If the threshold is below the maximal window minimum, a ctx_real window sits above it. -/
lemma ctx_real_window_above_of_le_windowMinMax
  (s0 : ℝ) (hs0 : s0 ≤ _root_.windowMinMax) :
  ctx_real_window_above s0 := by
  refine ⟨_root_.windowMinMaxIndex, ?_⟩
  intro s hs
  have hmin : _root_.windowMin _root_.windowMinMaxIndex ≤ s := hs.1
  have hmin_eq : _root_.windowMin _root_.windowMinMaxIndex = _root_.windowMinMax := by
    simpa [windowMinMax_eq]
  have hs0_le : s0 ≤ _root_.windowMin _root_.windowMinMaxIndex := by
    simpa [hmin_eq] using hs0
  exact le_trans hs0_le hmin

end Alpha
end ERURH
