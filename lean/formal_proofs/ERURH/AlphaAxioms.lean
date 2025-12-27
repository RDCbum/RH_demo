import ERURH.AlphaInterfaces
import ERURH.ERUTheory
import ERURH.Inertia

namespace ERURH

/-- Axioma: existencia de leyes explícitas (fórmula explícita + cotas) para el caso alpha. -/
def explicit_alpha {h_explicit_alpha : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi} :
    ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi :=
  h_explicit_alpha

/-- Axioma: bound fuerte en el error `E(x)` implica RH para la `ξ` alpha. -/
theorem rh_from_E_alpha {h_rh_from_E_alpha : RHfromE xiAlpha AlphaPsi} :
    RHfromE xiAlpha AlphaPsi :=
  h_rh_from_E_alpha

/-- Axioma colectivo: empaqueta los testigos analíticos necesarios para `AlphaInterfaces`. -/
def alphaInterfacesBase {h_alphaInterfacesBase : AlphaInterfaces} : AlphaInterfaces :=
  h_alphaInterfacesBase

/-- Instanciación de `AlphaInterfaces` a partir de los axiomas declarados. -/
noncomputable def alphaDataFromAxioms
  (explicit_alpha : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi)
  (rh_from_E_alpha : RHfromE xiAlpha AlphaPsi)
  (alphaInterfacesBase : AlphaInterfaces) : AlphaInterfaces :=
  { analytic := alphaInterfacesBase.analytic
    cover := alphaInterfacesBase.cover
    prefactor := alphaInterfacesBase.prefactor
    lambda := alphaInterfacesBase.lambda
    zeta := alphaInterfacesBase.zeta
    log_total_main := alphaInterfacesBase.log_total_main
    log_total_tail := alphaInterfacesBase.log_total_tail
    log_to_bridge_main := alphaInterfacesBase.log_to_bridge_main
    log_to_bridge_tail := alphaInterfacesBase.log_to_bridge_tail
    arg_total := alphaInterfacesBase.arg_total
    arg_to_bridge := alphaInterfacesBase.arg_to_bridge
    explicit := explicit_alpha
    rh_from_E := rh_from_E_alpha }

/-- Teorema condicional: si se asume inercia y los axiomas alpha, entonces RH para `ξ` alpha. -/
theorem RH_from_ERURH_axiomatic
  (explicit_alpha : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi)
  (rh_from_E_alpha : RHfromE xiAlpha AlphaPsi)
  (alphaInterfacesBase : AlphaInterfaces)
  (hI : InertiaERU alphaBridge) :
  RiemannHypothesis xiAlpha :=
by
  exact alpha_rh_via_theory (alphaDataFromAxioms explicit_alpha rh_from_E_alpha alphaInterfacesBase) hI

end ERURH
