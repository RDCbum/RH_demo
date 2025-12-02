import Mathlib

namespace ERURH.NT

open Nat Real
open scoped Classical

/-- Von Mangoldt function `Λ(n) = log p` if `n = p^k` with `p` prime and `k ≥ 1`,
    and `0` otherwise. -/
noncomputable def Lambda (n : ℕ) : ℝ :=
  if h : ∃ p k : ℕ, Nat.Prime p ∧ 0 < k ∧ n = p ^ k then
    let p : ℕ := Classical.choose h
    Real.log (p : ℝ)
  else 0

end ERURH.NT

