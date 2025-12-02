/-
# Mode growth (A1-mode) for ERURH-alpha

This module makes the A1-mode growth bound explicit. A single mode with
β > 1/2 contributes a normalised term whose RMS on high windows grows like
`e^{(β-1/2)S} / S^2`. The main estimates here are elementary: monotonicity of
`exp` and bounds on `s⁻⁴` over `[S, S+L]` when `L ≤ S`.
-/

namespace ERURH
namespace Alpha

open scoped BigOperators
open MeasureTheory

/-- Abstract mode data: real part `beta`, frequency `gamma` (irrelevant after
taking modulus), and amplitude `a` (assumed real here for simplicity). -/
structure ModeData where
  beta : ℝ
  gamma : ℝ
  a : ℝ
  beta_gt_half : beta > (1/2)

/-- Normalised mode contribution squared (already absolute value squared):
`a^2 * s^{-4} * exp(2(β-1/2)s)`. -/
def mode_contrib_sq (m : ModeData) (s : ℝ) : ℝ :=
  m.a ^ 2 * (1 / (s ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * s)

/-- Pointwise lower bound for the integrand on `[S, S+L]` when `L ≤ S`: we can
replace `s^{-4}` by `(2S)^{-4}` and the exponential by its value at `S`. -/
lemma mode_kernel_lower_bound
  (m : ModeData) (S L : ℝ)
  (hS : 0 < S) (hL0 : 0 < L) (hLS : L ≤ S) :
  ∀ {s}, s ∈ Set.Icc S (S + L) →
    mode_contrib_sq m s ≥
      m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S) :=
by
  intro s hs
  rcases hs with ⟨hsS, hsSL⟩
  have hs_pos : 0 < s := lt_of_lt_of_le hS hsS
  -- bound s by 2S using L ≤ S
  have hs_le_2S : s ≤ 2 * S := by
    have : s ≤ S + L := hsSL
    have hSL : S + L ≤ S + S := by nlinarith
    nlinarith
  -- bound 1 / s^4 from below by 1 / (2S)^4
  have h_pow_le : s ^ (4 : ℕ) ≤ (2 * S) ^ (4 : ℕ) := by
    have hs_nonneg : 0 ≤ s := le_of_lt hs_pos
    have h2S_nonneg : 0 ≤ 2 * S := by nlinarith
    exact pow_le_pow_of_nonneg hs_nonneg hs_le_2S (by decide)
  have h_inv_ge :
      (1 / (s ^ (4 : ℕ))) ≥ 1 / ((2 * S) ^ (4 : ℕ)) := by
    have hpos : 0 < (s ^ (4 : ℕ)) := by
      have : (0 : ℝ) < s := hs_pos
      have : (0 : ℝ) < s ^ (4 : ℕ) := by positivity
      simpa using this
    have hpos2 : 0 < (2 * S) ^ (4 : ℕ) := by
      have : (0 : ℝ) < 2 * S := by nlinarith
      have : (0 : ℝ) < (2 * S) ^ (4 : ℕ) := by positivity
      simpa using this
    have h_div := one_div_le_one_div_of_le hpos hpos2 h_pow_le
    simpa using h_div
  -- exponential is increasing for β>1/2, so s≥S gives exp(2(β-1/2)s) ≥ exp(2(β-1/2)S)
  have h_exp :
      Real.exp (2 * (m.beta - (1/2)) * s) ≥ Real.exp (2 * (m.beta - (1/2)) * S) := by
    have hcoef : 0 ≤ 2 * (m.beta - (1/2)) := by nlinarith [m.beta_gt_half]
    have : S ≤ s := hsS
    exact Real.exp_le_exp.mpr (by nlinarith)
  -- assemble bounds
  unfold mode_contrib_sq
  have h_nonneg_a : 0 ≤ m.a ^ 2 := by nlinarith
  nlinarith

/-- A1-mode lemma: RMS (squared) lower bound for a supercritical mode. -/
theorem mode_RMS_sq_lower_bound
  (m : ModeData) (α : ℝ) (hα : 0 < α) :
  ∃ S0 c0 : ℝ, 0 < S0 ∧ 0 < c0 ∧
    ∀ ⦃S L : ℝ⦄, S ≥ S0 → 1 ≤ L → L ≤ S ^ α →
      (1 / L) *
        (∫ s in Set.Icc S (S + L), mode_contrib_sq m s) ≥
        c0 * Real.exp (2 * (m.beta - 1/2) * S) / (S ^ (4 : ℕ)) :=
by
  classical
  -- choose S0 so that S0 ≥ 1 (for convenience)
  refine ⟨1, 1 / (2 ^ (4 : ℕ)), by norm_num, ?_, ?_⟩
  · have h_c0 : 0 < 1 / (2 ^ (4 : ℕ) : ℝ) := by positivity
    exact h_c0
  · intro S L hS hL1 hLpow
    have hSpos : 0 < S := lt_of_lt_of_le (by norm_num) hS
    have hLS : L ≤ S := by
      have hSpos' : 0 < S ^ α := by
        have hpos : 0 < S := hSpos
        have : 0 ≤ S := le_of_lt hpos
        have hpow : 0 < S ^ α := by
          have hlog : 0 ≤ α := le_of_lt hα
          have h : (0 : ℝ) < S := hSpos
          have h' : (0 : ℝ) ≤ S := le_of_lt h
          have hpospow : 0 < S ^ α := by positivity
          simpa using hpospow
        exact hpow
      have : L ≤ S := by nlinarith
      exact this
    -- pointwise lower bound on the integrand
    have hpt :
        ∀ s ∈ Set.Icc S (S + L),
          mode_contrib_sq m s ≥
            m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S) :=
      mode_kernel_lower_bound m S L hSpos (lt_of_lt_of_le (by norm_num) hL1) hLS
    have h_meas : MeasurableSet (Set.Icc S (S + L)) := isClosed_Icc.measurableSet
    have h_nonneg :
        ∀ s ∈ Set.Icc S (S + L), 0 ≤ mode_contrib_sq m s := by
      intro s hs; unfold mode_contrib_sq; positivity
    -- integrate the pointwise bound
    have h_integral :
        ∫ s in Set.Icc S (S + L), mode_contrib_sq m s ≥
          ∫ _ in Set.Icc S (S + L),
            m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S) := by
      refine integral_ge_of_forall_integrand_ge measurableSet_Icc ?h_meas h_nonneg ?hpt
      intro s hs; exact hpt s hs
    -- integral of the constant
    have h_length : (∫ _s in Set.Icc S (S + L), (1 : ℝ)) = L := by
      simp [measure_Icc, hSpos.le, hLpow.trans hS, hL1]
    have h_const :
        ∫ _s in Set.Icc S (S + L),
          m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S)
        = L * (m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S)) := by
      simp [h_length, mul_comm, mul_left_comm, mul_assoc]
    have h_final :
        (1 / L) *
          (∫ s in Set.Icc S (S + L), mode_contrib_sq m s) ≥
          (1 / L) * (L *
            (m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S))) := by
      have := mul_le_mul_of_nonneg_left (le_of_eq h_const ▸ h_integral) (by positivity)
      simpa [mul_comm, mul_left_comm, mul_assoc] using this
    -- simplify (1/L)*L to 1 and repackage constants as c0 / S^4
    have hLpos : (L : ℝ) ≠ 0 := by linarith
    have h_simplify :
        (1 / L) * (L *
          (m.a ^ 2 * (1 / ((2 * S) ^ (4 : ℕ))) * Real.exp (2 * (m.beta - (1/2)) * S)))
        = (m.a ^ 2 / (2 : ℝ) ^ (4 : ℕ)) * Real.exp (2 * (m.beta - (1/2)) * S) / (S ^ (4 : ℕ)) := by
      field_simp [hLpos, pow_mul, pow_bit0, pow_one, mul_comm, mul_left_comm, mul_assoc]
    have h_rewrite :
        (m.a ^ 2 / (2 : ℝ) ^ (4 : ℕ)) =
          (1 / (2 : ℝ) ^ (4 : ℕ)) * m.a ^ 2 := by ring
    have h_div :
        (1 / (2 : ℝ) ^ (4 : ℕ)) * m.a ^ 2 * Real.exp (2 * (m.beta - (1/2)) * S) / (S ^ (4 : ℕ)) =
          (1 / (2 : ℝ) ^ (4 : ℕ)) * Real.exp (2 * (m.beta - (1/2)) * S) / (S ^ (4 : ℕ)) * m.a ^ 2 := by
      ring_nf
    -- define c0 := 1 / 2^4
    have h_goal :
        (1 / L) *
          (∫ s in Set.Icc S (S + L), mode_contrib_sq m s) ≥
        (1 / (2 : ℝ) ^ (4 : ℕ)) * Real.exp (2 * (m.beta - (1/2)) * S) / (S ^ (4 : ℕ)) := by
      have htmp : (m.a ^ 2 / (2 : ℝ) ^ (4 : ℕ)) ≥ (1 / (2 : ℝ) ^ (4 : ℕ)) := by
        nlinarith
      nlinarith [h_final, h_simplify]
    -- match the shape with c0 defined above
    have hSpos4 : (S ^ (4 : ℕ)) ≠ 0 := by
      have : (S : ℝ) ≠ 0 := by linarith
      have hpow : (S ^ (4 : ℕ)) ≠ 0 := by
        have hpos : (0 : ℝ) < S := hSpos
        have hpowpos : (0 : ℝ) < S ^ (4 : ℕ) := by positivity
        exact ne_of_gt hpowpos
      exact hpow
    have h_expr :
        (1 / (2 : ℝ) ^ (4 : ℕ)) * Real.exp (2 * (m.beta - (1/2)) * S) / (S ^ (4 : ℕ))
        = (1 / (2 : ℝ) ^ (4 : ℕ)) * Real.exp (2 * (m.beta - 1/2) * S) / (S ^ (4 : ℕ)) := by ring_nf
    simpa [h_expr] using h_goal

end Alpha
end ERURH
