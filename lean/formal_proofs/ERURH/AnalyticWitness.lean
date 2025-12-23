import Mathlib
import ERURH.ZetaLink
import ERURH.BoundsConfig
import ERURH.ComplexAbsCompat

/-!
# Analytic witness for the ERU ↔ ξ bridge

This module packages the analytic inequalities required to apply the
`BridgeToXi` interface.  By collecting them as a single structure we avoid
using axioms: downstream clients supply an explicit witness when the bounds
have been established (numerically or symbolically).
-/

namespace ERURH

open Complex

/-- Analytical bounds on the critical line for a given bridge and ξ-function. -/
structure XiWitness (B : ERUBridge) (ξ : ℂ → ℂ) where
  Ω : Set ℂ
  analytic : XiAnalytic ξ Ω
  log_bound :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
      Real.log (Complex.abs (ξ (crit t))) ≤ B.logR t
  arg_variation :
    ∀ {a b : ℝ}, B.s0R ≤ a → a ≤ b →
      |Complex.arg (ξ (crit b)) - Complex.arg (ξ (crit a))| ≤
        B.jRel b - B.jRel a

/-- Build a `BridgeToXi` instance from an explicit analytic witness. -/
def BridgeToXi.ofWitness
    {B : ERUBridge} {ξ : ℂ → ℂ}
    (witness : XiWitness B ξ) :
    BridgeToXi B ξ :=
  { Ω := witness.Ω
    , an := witness.analytic
    , log_bound := by
        intro t ht hcap
        simpa using witness.log_bound (t := t) ht hcap
    , arg_variation := by
        intro a b ha hab
        simpa using witness.arg_variation (a := a) (b := b) ha hab }

end ERURH
