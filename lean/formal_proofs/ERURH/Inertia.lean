import Mathlib
import ERURH.BridgeCore

namespace ERURH

open Classical

/-- Abstract analytic bridge: only the pieces the bridge needs. -/
structure ERUBridge where
  s0  : ℚ
  logR : ℝ → ℝ
  jRel : ℝ → ℝ
  deriving Inhabited

/-- s0 cast to ℝ. -/
@[simp] noncomputable def ERUBridge.s0R (B : ERUBridge) : ℝ :=
  algebraMap ℚ ℝ B.s0

/-- A "local" inertia signature: per-point rational bounds. -/
structure InertiaBounds (B : ERUBridge) where
  logRq : ℝ → ℚ
  jRelq : ℝ → ℚ

/-- Inertia predicate phrased via pointwise rational bounds. -/
def InertiaERU (B : ERUBridge) : Prop :=
  ∀ x : ℝ, B.s0R ≤ x →
    ∃ qR qJ : ℚ,
      |B.logR x| ≤ |algebraMap ℚ ℝ qR| ∧
      |B.jRel x| ≤ |algebraMap ℚ ℝ qJ|

end ERURH
