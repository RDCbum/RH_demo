import Mathlib

namespace ERURH

open Set

/-- A window on the s-axis, with rational endpoints. -/
structure Window where
  s_min : ℚ
  s_max : ℚ
  deriving DecidableEq, Repr

/-- The closed real interval corresponding to a window. -/
noncomputable def Window.IccR (w : Window) : Set ℝ :=
  Icc (algebraMap ℚ ℝ w.s_min) (algebraMap ℚ ℝ w.s_max)

lemma mem_IccR_iff (w : Window) {x : ℝ} :
    x ∈ w.IccR ↔ (algebraMap ℚ ℝ w.s_min) ≤ x ∧ x ≤ algebraMap ℚ ℝ w.s_max := by
  simp [Window.IccR]

end ERURH
