import Mathlib
import Mathlib.Algebra.BigOperators.Group.Finset.Defs
import ERURH.NumberTheory.VonMangoldt

namespace ERURH
namespace NT

open Nat Real
open BigOperators
open scoped BigOperators

/-- Chebyshev function `psi(x) = ∑_{1 ≤ n ≤ ⌊x⌋} Λ n` for `x ≥ 1`, and `0` otherwise. -/
noncomputable def psi (x : ℝ) : ℝ :=
  if _hx : (1 : ℝ) ≤ x then
    let N := Nat.floor x
    ∑ n ∈ Finset.Icc 1 N, Lambda n
  else 0

/-- Error term `E(x) = psi(x) - x`. -/
noncomputable def E (x : ℝ) : ℝ :=
  psi x - x

lemma psi_zero_of_lt_one {x : ℝ} (hx : x < 1) : psi x = 0 := by
  classical
  unfold psi
  have hx' : ¬ (1 : ℝ) ≤ x := not_le_of_gt hx
  simp [hx']

@[simp] lemma E_def (x : ℝ) : E x = psi x - x := rfl

lemma E_add (x : ℝ) : E x + x = psi x := by
  simp [E_def, add_comm, add_left_comm, add_assoc]

end NT
end ERURH
