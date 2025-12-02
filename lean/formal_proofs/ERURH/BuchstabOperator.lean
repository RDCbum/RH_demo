/-
# Buchstab operator scaffold

Simplified symbolic surrogate used for the Lean checks.
-/

import Init.Data.Rat.Basic

namespace ERURH

/-- Discrete surrogate for the Buchstab operator on rational functions. -/
def buchstab : (Rat -> Rat) -> Rat -> Rat :=
  fun f u => f u

lemma buchstab_zero (u : Rat) :
    buchstab (fun _ => 0) u = 0 := by
  simp [buchstab]

lemma buchstab_linear
    (f g : Rat -> Rat) (u : Rat) :
    buchstab (fun t => f t + g t) u =
      buchstab f u + buchstab g u := by
  simp [buchstab, add_comm, add_left_comm, add_assoc]

/-- Scaling law for the surrogate Buchstab operator. -/
lemma buchstab_scale (f : Rat -> Rat) (c u : Rat) :
    buchstab (fun t => c * f t) u = c * buchstab f u := by
  simp [buchstab, mul_comm, mul_left_comm, mul_assoc]

end ERURH
