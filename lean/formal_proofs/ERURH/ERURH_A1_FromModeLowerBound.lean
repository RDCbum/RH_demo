import Mathlib
import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_ExpDominatesPolynomial
import ERURH.ERUModesCore
import ERURH.A1FromSupercriticalMode_Legacy

/-!
# A1-mode from a minimal mode lower bound

This module isolates the universal analytic core of A1: exponential growth
eventually beats any fixed envelope. The only external input is a minimal
lower-bound hypothesis on the mode contribution to `RMS_mode`.
-/

namespace ERURH

/-- Minimal external hypothesis: the mode contribution forces `RMS_mode`
to grow at least like `c0 * exp((β-1/2)S) / S^2` along some windows. -/
def ModeRMSLowerBound (ctx : RMSLocalContext) (β : ℝ) : Prop :=
  ∃ (c0 S0 : ℝ), 0 < c0 ∧
    ∀ S ≥ S0, ∃ w : ctx.Window,
      ctx.RMS_mode w ≥ c0 * Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ))

/-- Universal analytic core: a mode lower bound plus `β>1/2` implies A1-mode. -/
theorem A1_mode_of_ModeRMSLowerBound
  (ctx : RMSLocalContext) (β : ℝ) (hβ : (1/2 : ℝ) < β)
  (hLB : ModeRMSLowerBound ctx β) :
  A1_mode ctx := by
  rcases hLB with ⟨c0, S0, hc0, hLB⟩
  have ha : 0 < β - (1/2 : ℝ) := by linarith
  let thresh : ℝ := ctx.c_low + ctx.c_tail + C_envelope_formal
  let M : ℝ := thresh / c0 + 1
  obtain ⟨S1, hS1⟩ :=
    eventually_exp_div_pow_ge (β - (1/2 : ℝ)) ha 2 M
  let S : ℝ := max S0 S1
  have hS0 : S ≥ S0 := le_max_left _ _
  have hS1' : S ≥ S1 := le_max_right _ _
  rcases hLB S hS0 with ⟨w, hRMS⟩
  have hExp : M ≤ Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ)) := hS1 S hS1'
  have hMul :
      c0 * M ≤ c0 * Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ)) := by
    have := mul_le_mul_of_nonneg_left hExp (le_of_lt hc0)
    simpa [mul_div_assoc] using this
  have hCM : c0 * M = thresh + c0 := by
    have hc0ne : (c0 : ℝ) ≠ 0 := ne_of_gt hc0
    field_simp [M, thresh, hc0ne]
  have hK : thresh < c0 * Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ)) := by
    have h1 : thresh + c0 ≤ c0 * Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ)) := by
      simpa [hCM] using hMul
    linarith [h1, hc0]
  refine ⟨w, c0 * Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ)), ?_, hRMS⟩
  simpa [thresh] using hK

/-- If a supercritical mode yields the lower-bound hypothesis, then it yields A1. -/
theorem A1_from_supercritical_of_ModeRMSLowerBound
  (ctx : RMSLocalContext)
  (hLB : ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β → ModeRMSLowerBound ctx β) :
  A1_from_supercritical ctx := by
  intro β hβ hmode
  exact A1_mode_of_ModeRMSLowerBound ctx β hβ (hLB β hβ hmode)

end ERURH
