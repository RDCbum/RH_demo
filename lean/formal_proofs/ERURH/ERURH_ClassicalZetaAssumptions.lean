import ERURH.AlphaInterfaces
import ERURH.ExplicitCoreBridge
import ERURH.ExplicitDecomposition
import ERURH.AlphaAxioms

/-
# Classical zeta assumptions (external package)

Paquete externo con la teoría clásica de ζ usada por ERURH: leyes de fórmula
explícita, testigos de rectángulo, cotas de ξ (módulo y argumento), el puente
RH-from-E y el bound de conteo de ceros en bandas. Se agrupan para que Plan B /
shims consuman un único registro en vez de axiomas dispersos.

Comentario: de estas hipótesis (fórmula explícita + Stirling + bounds de ζ'/ζ +
conteo de ceros en bandas) se espera obtener también la cola L² débil
`H_b^weak` para los coeficientes `b_ρ`; en Lean se empaqueta como `hb_tail` en
`SpectralAssumptionsAlpha`.
-/

namespace ERURH

/-- Bound clásico de conteo de ceros en bandas dyádicas (ZB):
existen `C, A, T0` tales que para todo `T ≥ T0` y todo conjunto finito de ceros
en la banda `(T, 2T]`, su cardinal está acotado por `C * T * (Real.log T) ^ A`. -/
def ZeroBandCountBound : Prop :=
  ∃ (C A T0 : ℝ), 2 ≤ T0 ∧ 0 < C ∧ 0 ≤ A ∧
    ∀ (T : ℝ) (s : Finset ZeroOfZeta),
      T0 ≤ T →
      (∀ ρ ∈ s, T < |gamma ρ| ∧ |gamma ρ| ≤ 2 * T) →
      (s.card : ℝ) ≤ C * T * (Real.log T) ^ A

structure ClassicalZetaAssumptions where
  explicit_alpha        : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi
  rh_from_E_alpha       : RHfromE xiAlpha AlphaPsi
  alphaInterfacesBase   : AlphaInterfaces
  explicit_rect_alpha   : explicit_rect_alpha
  explicit_core_alpha   : Prop
  xi_bounds_alpha       : Prop
  xi_argument_alpha     : Prop
  flux_to_bridge_bounds_alpha : Prop
  /-- Hipótesis clásica (ZB): bound de conteo de ceros en bandas dyádicas. -/
  zero_band_count_bound : ZeroBandCountBound

end ERURH
