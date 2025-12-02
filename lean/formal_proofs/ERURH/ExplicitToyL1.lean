import Mathlib.Data.Real.Basic
import Mathlib.Data.Nat.Interval
import Mathlib.Data.Finset.Basic

namespace ERURH
namespace ToyExplicit

/-- Toy arithmetic function with finite support: constant `1` on `n ≤ 10`, `0` otherwise. -/
def toy_f (n : ℕ) : ℝ :=
  if h : n ≤ 10 then (1 : ℝ) else 0

/-- Partial sum `F(x) = ∑_{0 ≤ n ≤ ⌊x⌋} toy_f n`, defined as `0` for `x < 0`. -/
def toy_F (x : ℝ) : ℝ :=
  if h : 0 ≤ x then
    let N := Nat.floor x
    ∑ n in Finset.Icc 0 N, toy_f n
  else 0

/-- Fixed cutoff for the “main” part of the toy explicit formula. -/
def N0 : ℕ := 5

/-- Main part of the toy sum: sum of `toy_f` up to `min N0 ⌊x⌋`. -/
def toy_F_main (x : ℝ) : ℝ :=
  let N := Nat.floor x
  ∑ n in Finset.Icc 0 (Nat.min N0 N), toy_f n

/-- Tail part of the toy sum: remainder beyond the main cutoff. -/
def toy_F_tail (x : ℝ) : ℝ :=
  toy_F x - toy_F_main x

/-- Trivial decomposition: `toy_F = main + tail`. This mirrors the idea
    `ψ = main + tail` in the explicit formula pipeline. -/
lemma toy_F_eq_main_add_tail (x : ℝ) :
    toy_F x = toy_F_main x + toy_F_tail x := by
  unfold toy_F_tail
  ring

end ToyExplicit
end ERURH
