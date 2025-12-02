import Mathlib
import ERURH.FluxWindows

namespace ERURH
namespace AlphaWindowCover

open scoped Real

/-- Real image of the closed bridge origin. -/
@[simp] def s0BridgeR : ℝ := (FluxWindows.s0Bridge : ℝ)

/-- Real image of the tail starting point. -/
@[simp] def tailStartR : ℝ := (FluxWindows.tailStart : ℝ)

lemma tailStartR_eq : tailStartR = s0BridgeR + 2 := by
  simp [tailStartR, FluxWindows.tailStart, FluxWindows.s0Bridge, add_comm,
    add_left_comm, add_assoc]

lemma mem_alpha49_windows_of_lt_tail
    {t : ℝ} (hs0 : s0BridgeR ≤ t) (ht : t < tailStartR) :
    t ∈ wAlpha49_shift0.IccR ∨ t ∈ wAlpha49_shift1.IccR := by
  classical
  have hs0_cast :
      (algebraMap ℚ ℝ FluxWindows.s0Bridge) ≤ t := by simpa using hs0
  have tail_le : t ≤ s0BridgeR + 2 := le_of_lt (by simpa [tailStartR_eq] using ht)
  by_cases h_upper :
      t ≤ s0BridgeR + ((109 : ℚ) / 100 : ℝ)
  · left
    have h_le :
        t ≤ algebraMap ℚ ℝ (FluxWindows.s0Bridge + 109 / 100) := by
      simpa [add_comm, add_left_comm, add_assoc] using h_upper
    have hx :
        t ∈ Icc (algebraMap ℚ ℝ FluxWindows.s0Bridge)
            (algebraMap ℚ ℝ (FluxWindows.s0Bridge + 109 / 100)) :=
      ⟨hs0_cast, h_le⟩
    simpa [Window.IccR, FluxWindows.wAlpha49_shift0, FluxWindows.windowOfOffsets,
      add_comm, add_left_comm, add_assoc] using hx
  · right
    have h_gt :
        s0BridgeR + ((109 : ℚ) / 100 : ℝ) < t :=
      lt_of_not_ge h_upper
    have h_lower :
        algebraMap ℚ ℝ (FluxWindows.s0Bridge + 89 / 100) ≤ t := by
      have : (FluxWindows.s0Bridge : ℝ) + ((89 : ℚ) / 100 : ℝ) <
          s0BridgeR + ((109 : ℚ) / 100 : ℝ) := by norm_num
      exact (le_of_lt (this.trans h_gt))
    have h_upper' :
        t ≤ algebraMap ℚ ℝ (FluxWindows.s0Bridge + 2) := by
      simpa [FluxWindows.tailStart, add_comm, add_left_comm, add_assoc] using tail_le
    have hx :
        t ∈ Icc (algebraMap ℚ ℝ (FluxWindows.s0Bridge + 89 / 100))
            (algebraMap ℚ ℝ (FluxWindows.s0Bridge + 2)) :=
      ⟨h_lower, h_upper'⟩
    simpa [Window.IccR, FluxWindows.wAlpha49_shift1, FluxWindows.windowOfOffsets,
      add_comm, add_left_comm, add_assoc] using hx

lemma tailStart_le_of_not_windows
    {t : ℝ} (hs0 : s0BridgeR ≤ t)
    (h0 : t ∉ wAlpha49_shift0.IccR)
    (h1 : t ∉ wAlpha49_shift1.IccR) :
    tailStartR ≤ t := by
  classical
  have : ¬ t < tailStartR := by
    intro hlt
    have := mem_alpha49_windows_of_lt_tail hs0 hlt
    cases this with
    | inl hx => exact h0 hx
    | inr hx => exact h1 hx
  exact le_of_not_gt this

end AlphaWindowCover
end ERURH
