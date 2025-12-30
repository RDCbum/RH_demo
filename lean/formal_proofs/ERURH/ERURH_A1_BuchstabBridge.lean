import Mathlib
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
import ERURH.ERURH_A1_FromModeLowerBound
import ERURH.ERURH_BuchstabMultiplier
import ERURH.ERURH_ExplicitFormulaAlpha

/-!
# Buchstab multiplier bridge (ERURH helper)

This file isolates the algebraic core: if the supercritical mode coefficient
is proportional to the Buchstab multiplier and the structural factor is nonzero,
then the mode coefficient is nonzero. This is a purely algebraic step that does
not touch kernels, certificates, or main theorem signatures.
-/

namespace ERURH

/-- Minimal algebraic hook: the mode coefficient equals a nonzero structural
factor times the Buchstab multiplier. -/
def SupercriticalModeCoefficient (β γ : ℝ) (coeff : ℂ) : Prop :=
  ∃ c_struct : ℂ, c_struct ≠ 0 ∧ coeff = c_struct * buchstab_m β γ

/-- Minimal external input: the explicit-formula coefficient is nonzero for
supercritical zeros. -/
def BuchstabCoefficientNonzero : Prop :=
  ∀ ρ : Alpha.ZeroOfZeta, Alpha.beta ρ > (1/2 : ℝ) → Alpha.b_rho ρ ≠ 0

/-- Explicit-formula identification for `b_ρ`. -/
def ExplicitBRhoExpression : Prop :=
  ∀ ρ : Alpha.ZeroOfZeta, Alpha.b_rho ρ = Alpha.explicit_b_rho_expression ρ

lemma mode_coeff_ne_zero_of_supercritical
    (β γ : ℝ) (hβ : 0 < β) {coeff : ℂ}
    (hcoeff : SupercriticalModeCoefficient β γ coeff) :
    coeff ≠ 0 := by
  rcases hcoeff with ⟨c_struct, hc_struct, hcoeff⟩
  have hm : buchstab_m β γ ≠ 0 := buchstab_m_ne_zero β γ hβ
  have hmul : c_struct * buchstab_m β γ ≠ 0 := mul_ne_zero hc_struct hm
  simpa [hcoeff] using hmul

lemma supercritical_mode_coefficient_of_buchstab_nonzero
    (h : BuchstabCoefficientNonzero)
    (ρ : Alpha.ZeroOfZeta) (hβ : Alpha.beta ρ > (1/2 : ℝ)) :
    SupercriticalModeCoefficient
      (β := Alpha.beta ρ)
      (γ := Alpha.gamma ρ)
      (coeff := Alpha.b_rho ρ) := by
  have hb : Alpha.b_rho ρ ≠ 0 := h ρ hβ
  refine ⟨Alpha.b_rho ρ / buchstab_m (Alpha.beta ρ) (Alpha.gamma ρ), ?_, ?_⟩
  · have hβpos : 0 < Alpha.beta ρ := by linarith
    have hm : buchstab_m (Alpha.beta ρ) (Alpha.gamma ρ) ≠ 0 :=
      buchstab_m_ne_zero _ _ hβpos
    exact div_ne_zero hb hm
  · have hβpos : 0 < Alpha.beta ρ := by linarith
    have hm : buchstab_m (Alpha.beta ρ) (Alpha.gamma ρ) ≠ 0 :=
      buchstab_m_ne_zero _ _ hβpos
    field_simp [hm]

lemma gamma_prefactor_ne_zero_of_beta_pos
    (ρ : Alpha.ZeroOfZeta) (hβ : 0 < Alpha.beta ρ) :
    Alpha.gamma_prefactor ρ ≠ 0 := by
  have hpi : (Real.pi : ℂ) ≠ 0 := by
    exact_mod_cast Real.pi_ne_zero
  have hpi_pow : (Real.pi : ℂ) ^ (-(Alpha.rho_complex ρ) / 2) ≠ 0 := by
    exact (Complex.cpow_ne_zero_iff).2 (Or.inl hpi)
  have hre : 0 < (Alpha.rho_half ρ).re := by
    have hre' : (Alpha.rho_half ρ).re = Alpha.beta ρ / 2 := by
      simp [Alpha.rho_half, Alpha.rho_complex, Complex.add_re, Complex.mul_re,
        Complex.div_ofReal_re]
    have htwo : (0 : ℝ) < 2 := by norm_num
    simpa [hre'] using (div_pos hβ htwo)
  have hgamma : Complex.Gamma (Alpha.rho_half ρ) ≠ 0 :=
    Complex.Gamma_ne_zero_of_re_pos hre
  exact mul_ne_zero hpi_pow hgamma

lemma explicit_b_rho_expression_ne_zero_of_beta_pos
    (ρ : Alpha.ZeroOfZeta) (hβ : 0 < Alpha.beta ρ) :
    Alpha.explicit_b_rho_expression ρ ≠ 0 := by
  have hpref : Alpha.gamma_prefactor ρ ≠ 0 :=
    gamma_prefactor_ne_zero_of_beta_pos ρ hβ
  simpa [Alpha.explicit_b_rho_expression] using hpref

lemma b_rho_ne_zero_of_explicit_b_rho_expr
    (h_b_rho_expr : ExplicitBRhoExpression)
    (ρ : Alpha.ZeroOfZeta) (hβ : Alpha.beta ρ > (1/2 : ℝ)) :
    Alpha.b_rho ρ ≠ 0 := by
  have hβpos : 0 < Alpha.beta ρ := by linarith
  have hne : Alpha.explicit_b_rho_expression ρ ≠ 0 :=
    explicit_b_rho_expression_ne_zero_of_beta_pos ρ hβpos
  simpa [h_b_rho_expr ρ] using hne

lemma buchstab_coefficient_nonzero_of_explicit_b_rho_expr
    (h_b_rho_expr : ExplicitBRhoExpression) :
    BuchstabCoefficientNonzero := by
  intro ρ hβ
  exact b_rho_ne_zero_of_explicit_b_rho_expr h_b_rho_expr ρ hβ

/-- External analytic bridge: RMS_mode lower bound driven by a nonzero
structural coefficient times the Buchstab multiplier. -/
def ModeRMSLowerBound_from_buchstab
    (ctx : RMSLocalContext) (β γ : ℝ) : Prop :=
  ∃ c_struct : ℂ, c_struct ≠ 0 ∧
    ∃ S0 : ℝ, ∀ S ≥ S0, ∃ w : ctx.Window,
      ctx.RMS_mode w ≥
        ‖c_struct * buchstab_m β γ‖ *
          Real.exp ((β - (1/2 : ℝ)) * S) / (S ^ (2 : ℕ))

lemma ModeRMSLowerBound_of_buchstab
    (ctx : RMSLocalContext) (β γ : ℝ) (hβ : (1/2 : ℝ) < β)
    (hLB : ModeRMSLowerBound_from_buchstab ctx β γ) :
    ModeRMSLowerBound ctx β := by
  rcases hLB with ⟨c_struct, hc_struct, S0, hS⟩
  have hβpos : 0 < β := by linarith
  have hm : buchstab_m β γ ≠ 0 := buchstab_m_ne_zero β γ hβpos
  have hmul : c_struct * buchstab_m β γ ≠ 0 := mul_ne_zero hc_struct hm
  have hnorm : 0 < ‖c_struct * buchstab_m β γ‖ := by
    simpa using (norm_pos_iff.mpr hmul)
  refine ⟨‖c_struct * buchstab_m β γ‖, S0, hnorm, ?_⟩
  intro S hS0
  rcases hS S hS0 with ⟨w, hRMS⟩
  exact ⟨w, hRMS⟩

theorem A1_mode_of_buchstab_lower_bound
    (ctx : RMSLocalContext) (β γ : ℝ) (hβ : (1/2 : ℝ) < β)
    (hLB : ModeRMSLowerBound_from_buchstab ctx β γ) :
    A1_mode ctx := by
  exact A1_mode_of_ModeRMSLowerBound ctx β hβ
    (ModeRMSLowerBound_of_buchstab ctx β γ hβ hLB)

/-- If the supercritical mode yields the Buchstab lower-bound bridge, then A1 follows. -/
def A1_from_supercritical_buchstab (ctx : RMSLocalContext) : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    ∃ γ : ℝ, ModeRMSLowerBound_from_buchstab ctx β γ

theorem A1_from_supercritical_of_buchstab
    (ctx : RMSLocalContext)
    (hB : A1_from_supercritical_buchstab ctx) :
    A1_from_supercritical ctx := by
  intro β hβ hmode
  rcases hB β hβ hmode with ⟨γ, hLB⟩
  exact A1_mode_of_buchstab_lower_bound ctx β γ hβ hLB

end ERURH
