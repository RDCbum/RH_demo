import Mathlib
import ERURH.Inertia
import ERURH.RH
import ERURH.ZetaLink
import ERURH.PsiLayer
import ERURH.PsiLayerClassical
import ERURH.ExplicitBridge
import ERURH.BoundsConfig
import ERURH.FluxWindows
import ERURH.NumberTheory.Chebyshev
import ERURH.AnalyticWitness
import ERURH.XiCore
import ERURH.XiPrefactor
import ERURH.XiZetaIface
import ERURH.XiWitnessAssembly
import ERURH.BridgeToRH
import ERURH.ERUTheory
import ERURH.ComplexAbsCompat

namespace ERURH

open Complex Real

/-- Chebyshev layer specialised to the released bridge. -/
noncomputable def AlphaPsi : PsiLayer :=
  { psi := ERURH.NT.psi
    , E := ERURH.NT.E
    , x0 := max alphaBridge.s0R 3
    , E_is_error := by
        intro x
        simp [ERURH.NT.E_def] }

/-- `AlphaPsi.psi` is definitionally the classical Chebyshev `ψ`. -/
lemma AlphaPsi.psi_eq_nt : AlphaPsi.psi = ERURH.NT.psi := rfl

/-- Pointwise form of `AlphaPsi.psi_eq_nt`. -/
lemma AlphaPsi.psi_eq_nt_pointwise (x : ℝ) :
    AlphaPsi.psi x = ERURH.NT.psi x := rfl

/-- `AlphaPsi.E` is definitionally the classical Chebyshev error term. -/
lemma AlphaPsi.E_eq_nt : AlphaPsi.E = ERURH.NT.E := rfl

/-- Pointwise form of `AlphaPsi.E_eq_nt`. -/
lemma AlphaPsi.E_eq_nt_pointwise (x : ℝ) :
    AlphaPsi.E x = ERURH.NT.E x := rfl

/-- Specification stating that `AlphaPsi.psi` coincides with the classical `ψ` everywhere. -/
def AlphaPsi_is_classicalPsi : Prop :=
  ∀ x : ℝ, AlphaPsi.psi x = ERURH.NT.psi x

/-- Trivial witness that `AlphaPsi.psi` is the classical `ψ`. -/
theorem AlphaPsi_is_classicalPsi_true : AlphaPsi_is_classicalPsi := by
  intro x
  simp [AlphaPsi_is_classicalPsi, AlphaPsi.psi_eq_nt]

/-- Version restricted to the working threshold `AlphaPsi.x0`. -/
def AlphaPsi_is_classicalPsi_from_x0 : Prop :=
  ∀ {x : ℝ}, AlphaPsi.x0 ≤ x → AlphaPsi.psi x = ERURH.NT.psi x

/-- Trivial witness that `AlphaPsi.psi` matches the classical `ψ` for `x ≥ AlphaPsi.x0`. -/
theorem AlphaPsi_is_classicalPsi_from_x0_true :
    AlphaPsi_is_classicalPsi_from_x0 := by
  intro x hx
  simpa [AlphaPsi.psi_eq_nt]

/-- Classical ξ-function in product form. -/
@[simp] noncomputable def xiAlpha : ℂ → ℂ := xiClassic

/-- Analytic domain for `xiAlpha`. -/
def xiAlphaDomain : Set ℂ := xiAnalyticDomain

/-- Abstract package collecting the analytic data required to push
    `alphaBridge` towards the Riemann Hypothesis. -/
structure AlphaInterfaces where
  analytic : XiAnalytic xiAlpha xiAlphaDomain
  cover : WindowCoverCertificate alphaBridge
  prefactor : PrefactorWitnessOn alphaBridge cover
  lambda : LambdaWitness alphaBridge cover
  zeta : ZetaWitness alphaBridge cover
  log_total_main :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR → t ≤ ERURH.boundsTcapReal →
        Real.log (Complex.abs (xiAlpha (crit t))) ≤
          prefactor.logBound t +
            ((prefactor.pf_log_q w : ℚ) : ℝ) +
            ((zeta.ζ_log_q w : ℚ) : ℝ)
  log_total_tail :
    ∀ {t : ℝ}, cover.tailStartR ≤ t → t ≤ ERURH.boundsTcapReal →
      Real.log (Complex.abs (xiAlpha (crit t))) ≤
        prefactor.logBound t + lambda.pf_tail_log t + ((zeta.ζ_log_tail : ℚ) : ℝ)
  log_to_bridge_main :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR → t ≤ ERURH.boundsTcapReal →
        prefactor.logBound t +
            ((prefactor.pf_log_q w : ℚ) : ℝ) +
            ((zeta.ζ_log_q w : ℚ) : ℝ) ≤
          alphaBridge.logR t
  log_to_bridge_tail :
    ∀ {t : ℝ}, cover.tailStartR ≤ t → t ≤ ERURH.boundsTcapReal →
      prefactor.logBound t + lambda.pf_tail_log t + ((zeta.ζ_log_tail : ℚ) : ℝ) ≤
        alphaBridge.logR t
  arg_total :
    ∀ {a b : ℝ}, alphaBridge.s0R ≤ a → a ≤ b →
      _root_.abs (Complex.arg (xiAlpha (crit b)) -
          Complex.arg (xiAlpha (crit a))) ≤
        (prefactor.argBound b - prefactor.argBound a) +
          (zeta.argBound b - zeta.argBound a)
  arg_to_bridge :
    ∀ {a b : ℝ}, alphaBridge.s0R ≤ a → a ≤ b →
      (prefactor.argBound b - prefactor.argBound a) +
          (zeta.argBound b - zeta.argBound a) ≤
        alphaBridge.jRel b - alphaBridge.jRel a
  explicit : ExplicitFormulaLaws alphaBridge xiAlpha AlphaPsi
  rh_from_E : RHfromE xiAlpha AlphaPsi

/-- Conditional version: once the analytic data is instantiated,
    the released bridge satisfies the Riemann Hypothesis. -/
theorem alpha_rh_conditional (data : AlphaInterfaces)
    (hI : InertiaERU alphaBridge) :
    RiemannHypothesis xiAlpha :=
  let witness : XiWitness alphaBridge xiAlpha :=
    XiWitness.ofPrefactorZeta data.cover data.analytic
      data.prefactor data.lambda data.zeta data.log_total_main
      data.log_total_tail data.log_to_bridge_main data.log_to_bridge_tail
      data.arg_total data.arg_to_bridge
  let link := BridgeToXi.ofWitness witness
  eru_to_rh alphaBridge xiAlpha AlphaPsi
    link data.explicit data.rh_from_E hI

/-- Sistema ERU teórico instanciado con los datos `alpha`. -/
noncomputable def alphaSystem (data : AlphaInterfaces) : ERUTheoreticSystem :=
  { B := alphaBridge
    ξ := xiAlpha
    P := AlphaPsi
    link := by
      classical
      let witness : XiWitness alphaBridge xiAlpha :=
        XiWitness.ofPrefactorZeta data.cover data.analytic
          data.prefactor data.lambda data.zeta data.log_total_main
          data.log_total_tail data.log_to_bridge_main data.log_to_bridge_tail
          data.arg_total data.arg_to_bridge
      exact BridgeToXi.ofWitness witness
    laws := data.explicit
    rh_from_E := data.rh_from_E }

/-- Versión de `alpha_rh_conditional` vista a través de `ERUTheory_proves_RH`. -/
theorem alpha_rh_via_theory (data : AlphaInterfaces)
    (hI : InertiaERU alphaBridge) :
    RiemannHypothesis xiAlpha := by
  have h := ERUTheory_proves_RH (alphaSystem data) hI
  simpa using h

end ERURH
