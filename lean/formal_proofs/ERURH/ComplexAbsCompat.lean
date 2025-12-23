import Mathlib

namespace Complex

/-- Compatibility alias: `Complex.abs` is `‖·‖`. -/
noncomputable def abs (z : ℂ) : ℝ := ‖z‖

@[simp] lemma abs_def (z : ℂ) : Complex.abs z = ‖z‖ := rfl

@[simp] lemma abs.ofReal (r : ℝ) : Complex.abs (Complex.ofReal r) = |r| := by
  simpa [Complex.abs] using (Complex.norm_real r)

lemma abs.mul (z w : ℂ) : Complex.abs (z * w) = Complex.abs z * Complex.abs w := by
  simpa [Complex.abs] using (Complex.norm_mul z w)

lemma abs.pos {z : ℂ} : 0 < Complex.abs z ↔ z ≠ 0 := by
  simpa [Complex.abs] using (norm_pos_iff : 0 < ‖z‖ ↔ z ≠ 0)

end Complex
