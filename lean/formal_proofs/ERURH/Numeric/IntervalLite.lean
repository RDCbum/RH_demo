import ERURH.Numeric.Semantics

open scoped BigOperators

namespace ERURH.Numeric.IntervalLite

/-- Cobertura local con puntos ubicados dentro de `[a, b]`. -/
structure LocalGridCover (a b : ℝ) :=
  (h : ℝ)
  (h_pos : 0 < h)
  (pts : List ℝ)
  (pts_in_Icc : ∀ {u : ℝ}, u ∈ pts → u ∈ Set.Icc a b)
  (cover :
    ∀ {t : ℝ}, t ∈ Set.Icc a b →
      ∃ u ∈ pts, |t - u| ≤ h / 2)

/-- Variante ligera del cierre Lipschitz basada en una cobertura discreta. -/
theorem sup_le_from_grid_Lip_local
    (f : ℝ → ℝ) (a b L M : ℝ) (L_nonneg : 0 ≤ L)
    (gc : LocalGridCover a b)
    (lip :
      ∀ {x y : ℝ},
        x ∈ Set.Icc a b → y ∈ Set.Icc a b →
          |f x - f y| ≤ L * |x - y|)
    (Msamp : ∀ {u : ℝ}, u ∈ gc.pts → f u ≤ M) :
    ∀ {t : ℝ}, t ∈ Set.Icc a b → f t ≤ M + L * (gc.h / 2) := by
  intro t ht
  obtain ⟨u, hu_pts, hdist⟩ := gc.cover ht
  have hu_mem : u ∈ Set.Icc a b := gc.pts_in_Icc hu_pts
  have hdiff : f t - f u ≤ L * |t - u| := (abs_le.mp (lip ht hu_mem)).2
  have hft_le : f t ≤ f u + L * |t - u| := by
    have := add_le_add_right hdiff (f u)
    simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using this
  have hfu_le : f u ≤ M := Msamp hu_pts
  have hLipBound : L * |t - u| ≤ L * (gc.h / 2) :=
    mul_le_mul_of_nonneg_left hdist L_nonneg
  have := add_le_add hfu_le hLipBound
  exact hft_le.trans (by simpa [one_div, mul_comm, mul_left_comm, mul_assoc] using this)

end ERURH.Numeric.IntervalLite
