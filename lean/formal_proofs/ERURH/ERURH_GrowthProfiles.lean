import Mathlib.Data.Real.Basic

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
  intro hf hg
  rcases hf with ⟨pf, Tf, hf⟩
  rcases hg with ⟨pg, Tg, hg⟩
  refine ⟨{ C := pf.C * pg.C, P := pf.P + pg.P, A := pf.A + pg.A }, max Tf Tg, ?_⟩
  intro T hT
  have hTf : Tf ≤ T := le_trans (le_max_left _ _) hT
  have hTg : Tg ≤ T := le_trans (le_max_right _ _) hT
  have hfT := hf T hTf
  have hgT := hg T hTg
  -- |f g| ≤ |f| * |g|
  have hmul_abs : |f T * g T| ≤ |f T| * |g T| := by
    have := abs_mul (f T) (g T)
    nlinarith
  -- Bound product using profiles
  have hbound :
      |f T| * |g T| ≤
        pf.C * pg.C * T ^ (pf.P + pg.P) * (Real.log T) ^ (pf.A + pg.A) := by
    have hposT : 0 ≤ T := le_trans (le_max_left _ _) hT |> by have := (le_of_lt (by linarith : (0:ℝ)<T)); linarith
    have hposlog : 0 ≤ (Real.log T) ^ pf.A := Real.rpow_nonneg (by have : 1 ≤ T := by nlinarith; exact Real.log_nonneg this) _
    nlinarith
  have := le_trans hmul_abs hbound
  -- simplify coefficient grouping
  nlinarith

end ERURH

