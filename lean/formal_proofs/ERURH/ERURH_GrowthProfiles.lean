import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic

namespace ERURH

/-- Perfil de crecimiento polinomial-polilogarítmico: `C * T^P * (log T)^A`. -/
structure GrowthProfile :=
  (C : ℝ)
  (P : ℝ)
  (A : ℝ)

/-- Predicado abstracto: la función `f` está acotada por algún perfil
`C * T^P * (log T)^A` para `T` suficientemente grande. -/
def has_growth_profile (f : ℝ → ℝ) : Prop :=
  ∃ gp : GrowthProfile, ∃ T0 : ℝ,
    ∀ T : ℝ, T0 ≤ T →
      |f T| ≤ gp.C * T ^ gp.P * (Real.log T) ^ gp.A

/-- Combinación de perfiles: si `f` y `g` tienen perfiles, su producto también
tiene un perfil (sumando exponentes y multiplicando constantes). -/
lemma has_growth_profile.mul {f g : ℝ → ℝ} :
  has_growth_profile f → has_growth_profile g → has_growth_profile (fun T => f T * g T) :=
by
  classical
  sorry

end ERURH
