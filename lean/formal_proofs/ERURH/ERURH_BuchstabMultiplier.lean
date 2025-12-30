import Mathlib

/-!
# Buchstab multiplier non-vanishing (ERURH helper)

We record a clean, self-contained computation for the Buchstab-style
averaging multiplier

  m(rho) = (2^(-rho) - 3^(-rho)) / rho,

where rho = beta + i*gamma. The only analytic input is beta > 0.
No kernel or numeric pipeline changes are involved.
-/

namespace ERURH

def rho (β γ : ℝ) : ℂ :=
  (β : ℂ) + Complex.I * γ

noncomputable def a_pow_neg_rho (a β γ : ℝ) : ℂ :=
  (Real.rpow a (-β) : ℂ) * Complex.exp (-(Complex.I * (γ * Real.log a)))

noncomputable def buchstab_m (β γ : ℝ) : ℂ :=
  (a_pow_neg_rho 2 β γ - a_pow_neg_rho 3 β γ) / rho β γ

lemma norm_a_pow_neg_rho (a β γ : ℝ) (ha : 0 < a) :
    ‖a_pow_neg_rho a β γ‖ = Real.rpow a (-β) := by
  have hnorm : ‖Complex.exp (-(Complex.I * (γ * Real.log a)))‖ = 1 := by
    simpa [mul_comm, mul_left_comm, mul_assoc, mul_neg, neg_mul] using
      (Complex.norm_exp_I_mul_ofReal (-(γ * Real.log a)))
  have hnonneg : 0 ≤ Real.rpow a (-β) := by
    exact Real.rpow_nonneg (le_of_lt ha) _
  have habs : |Real.rpow a (-β)| = Real.rpow a (-β) :=
    abs_of_nonneg hnonneg
  calc
    ‖a_pow_neg_rho a β γ‖
        = ‖(Real.rpow a (-β) : ℂ)‖ *
            ‖Complex.exp (-(Complex.I * (γ * Real.log a)))‖ := by
          simp [a_pow_neg_rho, norm_mul]
    _ = |Real.rpow a (-β)| * 1 := by
          simp [RCLike.norm_ofReal, hnorm]
    _ = Real.rpow a (-β) := by
          simpa [habs]

lemma abs_sub_lower_bound (β γ : ℝ) :
    |Real.rpow 2 (-β) - Real.rpow 3 (-β)| ≤
      ‖a_pow_neg_rho 2 β γ - a_pow_neg_rho 3 β γ‖ := by
  have h2 : (0 : ℝ) < 2 := by norm_num
  have h3 : (0 : ℝ) < 3 := by norm_num
  have h := abs_norm_sub_norm_le (a_pow_neg_rho 2 β γ) (a_pow_neg_rho 3 β γ)
  simpa [norm_a_pow_neg_rho, h2, h3] using h

lemma numerator_ne_zero (β γ : ℝ) (hβ : 0 < β) :
    a_pow_neg_rho 2 β γ - a_pow_neg_rho 3 β γ ≠ 0 := by
  have hlt : Real.rpow 3 (-β) < Real.rpow 2 (-β) := by
    have hz : -β < 0 := by linarith
    exact Real.rpow_lt_rpow_of_neg (by norm_num) (by norm_num) hz
  have hpos : 0 < Real.rpow 2 (-β) - Real.rpow 3 (-β) :=
    sub_pos.mpr hlt
  have hpos_abs : 0 < |Real.rpow 2 (-β) - Real.rpow 3 (-β)| := by
    exact abs_pos.mpr (ne_of_gt hpos)
  have hbound := abs_sub_lower_bound β γ
  have hnorm_pos : 0 < ‖a_pow_neg_rho 2 β γ - a_pow_neg_rho 3 β γ‖ :=
    lt_of_lt_of_le hpos_abs hbound
  intro hzero
  have hnorm_zero : (‖a_pow_neg_rho 2 β γ - a_pow_neg_rho 3 β γ‖ : ℝ) = 0 := by
    simpa [hzero]
  exact (ne_of_gt hnorm_pos) hnorm_zero

lemma rho_ne_zero (β γ : ℝ) (hβ : 0 < β) : rho β γ ≠ 0 := by
  intro hzero
  have hbeta0 : β = 0 := by
    have h := congrArg Complex.re hzero
    simpa [rho] using h
  linarith

lemma buchstab_m_ne_zero (β γ : ℝ) (hβ : 0 < β) :
    buchstab_m β γ ≠ 0 := by
  apply div_ne_zero
  · exact numerator_ne_zero β γ hβ
  · exact rho_ne_zero β γ hβ

end ERURH
