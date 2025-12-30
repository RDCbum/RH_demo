import Mathlib

open Filter

/-!
# Exponential dominates polynomial (ERURH helper)

We record a simple real-analysis lemma: for any `a > 0` and any fixed
polynomial rate `S^k`, the quantity `exp(a*S) / S^k` eventually exceeds
any fixed bound. This is used to isolate the universal analytic core of A1.
-/

namespace ERURH

lemma eventually_exp_div_pow_ge (a : ℝ) (ha : 0 < a) (k : ℕ) (M : ℝ) :
    ∃ S0 : ℝ, ∀ S ≥ S0, M ≤ Real.exp (a * S) / (S ^ k) := by
  have h :=
    (tendsto_exp_mul_div_rpow_atTop (k : ℝ) a ha)
  have h' : ∀ᶠ S in atTop, M ≤ Real.exp (a * S) / (S ^ (k : ℝ)) :=
    (tendsto_atTop.1 h) M
  rcases (eventually_atTop.1 h') with ⟨S0, hS0⟩
  refine ⟨S0, ?_⟩
  intro S hS
  have hS' : M ≤ Real.exp (a * S) / (S ^ (k : ℝ)) := hS0 S hS
  simpa [Real.rpow_natCast] using hS'

end ERURH
