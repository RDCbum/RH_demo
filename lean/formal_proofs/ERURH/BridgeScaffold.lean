import Mathlib
import ERURH.BridgeCore
import ERURH.Inertia

namespace ERURH

open Classical Set

/-- A coverage certificate relative to a given bridge `B`, split into a finite
    alpha mosaic and a tail segment controlled by global bounds. -/
structure WindowCoverCertificate (B : ERUBridge) where
  windows : List Window
  tail_start : ℚ
  cover_main :
    ∀ {x : ℝ}, B.s0R ≤ x →
      x < algebraMap ℚ ℝ tail_start →
        ∃ w ∈ windows, x ∈ w.IccR
  cover_tail :
    ∀ {x : ℝ}, algebraMap ℚ ℝ tail_start ≤ x → B.s0R ≤ x

/-- The real image of the tail starting point. -/
@[simp] noncomputable def WindowCoverCertificate.tailStartR
    {B : ERUBridge} (W : WindowCoverCertificate B) : ℝ :=
  algebraMap ℚ ℝ W.tail_start

end ERURH
