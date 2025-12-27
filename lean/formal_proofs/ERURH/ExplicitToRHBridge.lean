import ERURH.ExplicitDecomposition
import ERURH.ExplicitBridge
import ERURH.AlphaInterfaces
import ERURH.ExplicitCoreBridge

namespace ERURH

/-- De un testigo explícito concreto se obtiene el bound fuerte sobre `E(x)` pedido por `RHfromE`. -/
theorem E_bound_strong_alpha_of_explicitWitness :
    (Nonempty (ExplicitWitness alphaBridge xiAlpha AlphaPsi)) →
      E_bound_strong_alpha := by
  intro h
  rcases h with ⟨w⟩
  refine ⟨w.C, ?_⟩
  intro x hx
  exact w.estimate (x := x) hx

/-- De un testigo explícito se obtiene el bound fuerte sobre `E(x)` para `AlphaPsi`. -/
lemma explicit_witness_to_E_bound_alpha
  (W : ExplicitWitness alphaBridge xiAlpha AlphaPsi) :
  E_bound_strong_alpha :=
by
  refine ⟨W.C, ?_⟩
  intro x hx
  exact W.estimate (x := x) hx

/-- Bound fuerte sobre `E(x)` para alpha, obtenido a partir del testigo explícito construido previamente. -/
theorem E_bound_strong_alpha_true (data : AlphaInterfaces) : E_bound_strong_alpha :=
by
  rcases explicit_integral_representation_alpha_true data with ⟨W⟩
  exact explicit_witness_to_E_bound_alpha W

/-- Si tenemos un bound fuerte sobre `E(x)` para `AlphaPsi`, entonces
    obtenemos un bound equivalente sobre `ψ(x) - x`. -/
lemma psi_bound_from_E_bound_alpha :
  E_bound_strong_alpha →
    ∃ C : ℚ, ∀ {x : ℝ}, AlphaPsi.x0 ≤ x →
      |AlphaPsi.psi x - x| ≤
        (algebraMap ℚ ℝ C) * Real.sqrt x * (Real.log x) ^ 2 :=
by
  intro hE
  rcases hE with ⟨C, hC⟩
  refine ⟨C, ?_⟩
  intro x hx
  have hEdef : AlphaPsi.E x = AlphaPsi.psi x - x := AlphaPsi.E_is_error x
  have h := hC (x := x) hx
  simpa [hEdef] using h

/-- Classical Chebyshev `ψ` bound specialised to the alpha bridge. -/
theorem chebyshevPsi_bound_alpha (data : AlphaInterfaces) :
    ∃ C : ℚ, ∀ {x : ℝ}, AlphaPsi.x0 ≤ x →
      |ERURH.NT.psi x - x| ≤
        (algebraMap ℚ ℝ C) * Real.sqrt x * (Real.log x) ^ 2 :=
by
  classical
  obtain ⟨C, hC⟩ := psi_bound_from_E_bound_alpha (E_bound_strong_alpha_true data)
  refine ⟨C, ?_⟩
  intro x hx
  simpa [AlphaPsi.psi_eq_nt_pointwise] using hC (x := x) hx

end ERURH

