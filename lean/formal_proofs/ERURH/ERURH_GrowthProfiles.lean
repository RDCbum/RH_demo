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
  intro hf hg
  rcases hf with ⟨gp_f, T0_f, hf⟩
  rcases hg with ⟨gp_g, T0_g, hg⟩
  refine ⟨{ C := gp_f.C * gp_g.C, P := gp_f.P + gp_g.P, A := gp_f.A + gp_g.A }, max T0_f (max T0_g 2), ?_⟩
  intro T hT
  have hT_f : T0_f ≤ T := le_trans (le_max_left _ _) hT
  have hT_g : T0_g ≤ T := by
    have h := le_trans (le_max_right _ _) hT
    exact le_trans (le_max_left _ _) h
  have hT_ge2 : (2 : ℝ) ≤ T := by
    have h := le_trans (le_max_right _ _) hT
    exact le_trans (le_max_right _ _) h
  have hT_pos : 0 < T := by linarith
  have hlog_pos : 0 < Real.log T := by
    have hT_gt1 : (1 : ℝ) < T := by linarith [hT_ge2]
    exact Real.log_pos hT_gt1
  have hf_bound := hf T hT_f
  have hg_bound := hg T hT_g
  have hA_nonneg : 0 ≤ gp_f.C * T ^ gp_f.P * (Real.log T) ^ gp_f.A := by
    exact le_trans (abs_nonneg _) hf_bound
  have hB_nonneg : 0 ≤ gp_g.C * T ^ gp_g.P * (Real.log T) ^ gp_g.A := by
    exact le_trans (abs_nonneg _) hg_bound
  have hmul :
      |f T| * |g T| ≤
        (gp_f.C * T ^ gp_f.P * (Real.log T) ^ gp_f.A) *
        (gp_g.C * T ^ gp_g.P * (Real.log T) ^ gp_g.A) := by
    exact mul_le_mul hf_bound hg_bound (abs_nonneg _) hA_nonneg
  have h_pow_T :
      T ^ gp_f.P * T ^ gp_g.P = T ^ (gp_f.P + gp_g.P) := by
    symm
    exact Real.rpow_add hT_pos gp_f.P gp_g.P
  have h_pow_log :
      (Real.log T) ^ gp_f.A * (Real.log T) ^ gp_g.A =
        (Real.log T) ^ (gp_f.A + gp_g.A) := by
    symm
    exact Real.rpow_add hlog_pos gp_f.A gp_g.A
  calc
    |f T * g T| = |f T| * |g T| := by simpa [abs_mul]
    _ ≤ (gp_f.C * T ^ gp_f.P * (Real.log T) ^ gp_f.A) *
          (gp_g.C * T ^ gp_g.P * (Real.log T) ^ gp_g.A) := hmul
    _ = (gp_f.C * gp_g.C) * T ^ (gp_f.P + gp_g.P) * (Real.log T) ^ (gp_f.A + gp_g.A) := by
      have h_rearr :
          (gp_f.C * T ^ gp_f.P * (Real.log T) ^ gp_f.A) *
          (gp_g.C * T ^ gp_g.P * (Real.log T) ^ gp_g.A)
            = (gp_f.C * gp_g.C) * (T ^ gp_f.P * T ^ gp_g.P) *
              ((Real.log T) ^ gp_f.A * (Real.log T) ^ gp_g.A) := by
        ring_nf
      calc
        (gp_f.C * T ^ gp_f.P * (Real.log T) ^ gp_f.A) *
            (gp_g.C * T ^ gp_g.P * (Real.log T) ^ gp_g.A)
            = (gp_f.C * gp_g.C) * (T ^ gp_f.P * T ^ gp_g.P) *
              ((Real.log T) ^ gp_f.A * (Real.log T) ^ gp_g.A) := h_rearr
        _ = (gp_f.C * gp_g.C) * T ^ (gp_f.P + gp_g.P) * (Real.log T) ^ (gp_f.A + gp_g.A) := by
          simp [h_pow_T, h_pow_log, mul_assoc]

end ERURH
