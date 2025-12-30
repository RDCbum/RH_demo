import ERURH.ERURH_A1_BuchstabBridge
import ERURH.ERURH_ExplicitFormulaAlpha

open ERURH

/-- If the mode coefficient is known nonzero, we can package the Buchstab bridge. -/
theorem buchstab_coeff_of_nonzero
  (ρ : ERURH.Alpha.ZeroOfZeta)
  (hβ : ERURH.Alpha.beta ρ > (1/2 : ℝ))
  (hb : ERURH.Alpha.b_rho ρ ≠ 0) :
  ERURH.SupercriticalModeCoefficient
    (β := ERURH.Alpha.beta ρ)
    (γ := ERURH.Alpha.gamma ρ)
    (coeff := ERURH.Alpha.b_rho ρ) := by
  refine ⟨ERURH.Alpha.b_rho ρ / ERURH.buchstab_m (ERURH.Alpha.beta ρ) (ERURH.Alpha.gamma ρ), ?_, ?_⟩
  · have hm : ERURH.buchstab_m (ERURH.Alpha.beta ρ) (ERURH.Alpha.gamma ρ) ≠ 0 := by
      have hβpos : 0 < ERURH.Alpha.beta ρ := by linarith
      exact ERURH.buchstab_m_ne_zero _ _ hβpos
    exact div_ne_zero hb hm
  · have hm : ERURH.buchstab_m (ERURH.Alpha.beta ρ) (ERURH.Alpha.gamma ρ) ≠ 0 := by
      have hβpos : 0 < ERURH.Alpha.beta ρ := by linarith
      exact ERURH.buchstab_m_ne_zero _ _ hβpos
    field_simp [hm]

-- The remaining missing input is `b_rho ρ ≠ 0` with a proof from the explicit formula package.
