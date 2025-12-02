import Mathlib
import ERURH.BridgeCore
import ERURH.Inertia
import ERURH.BridgeScaffold

namespace ERURH

open Classical Set

/-- Windowwise rational bounds and the corresponding local inequalities. -/
structure FluxLaws (B : ERURH.ERUBridge) (W : WindowCoverCertificate B) where
  logR_q : Window → ℚ
  jRel_q : Window → ℚ
  logR_q_tail : ℚ
  jRel_q_tail : ℚ
  logR_law :
    ∀ {w : Window}, w ∈ W.windows →
      ∀ {x : ℝ}, x ∈ w.IccR →
        |B.logR x| ≤ |algebraMap ℚ ℝ (logR_q w)|
  jRel_law :
    ∀ {w : Window}, w ∈ W.windows →
      ∀ {x : ℝ}, x ∈ w.IccR →
        |B.jRel x| ≤ |algebraMap ℚ ℝ (jRel_q w)|
  logR_tail :
    ∀ {x : ℝ}, W.tailStartR ≤ x →
      |B.logR x| ≤ |algebraMap ℚ ℝ logR_q_tail|
  jRel_tail :
    ∀ {x : ℝ}, W.tailStartR ≤ x →
      |B.jRel x| ≤ |algebraMap ℚ ℝ jRel_q_tail|

/-- Numerically packaged witnesses for the flux inequalities on the mosaic and tail. -/
structure FluxNumerics (B : ERURH.ERUBridge) (W : WindowCoverCertificate B) where
  logR_q : ∀ {w : Window}, w ∈ W.windows → ℚ
  jRel_q : ∀ {w : Window}, w ∈ W.windows → ℚ
  logR_q_tail : ℚ
  jRel_q_tail : ℚ
  logR_law :
    ∀ {w : Window} (hw : w ∈ W.windows) {x : ℝ},
      x ∈ w.IccR → |B.logR x| ≤
        |algebraMap ℚ ℝ (logR_q hw)|
  jRel_law :
    ∀ {w : Window} (hw : w ∈ W.windows) {x : ℝ},
      x ∈ w.IccR → |B.jRel x| ≤
        |algebraMap ℚ ℝ (jRel_q hw)|
  logR_tail :
    ∀ {x : ℝ}, W.tailStartR ≤ x →
      |B.logR x| ≤ |algebraMap ℚ ℝ logR_q_tail|
  jRel_tail :
    ∀ {x : ℝ}, W.tailStartR ≤ x →
      |B.jRel x| ≤ |algebraMap ℚ ℝ jRel_q_tail|

/-- Build `FluxLaws` from a numerical witness bundle.  This is the entrypoint that
    auto-generated Lean files can target when instantiating the inequalities. -/
noncomputable def FluxLaws.fromNumerics
    {B : ERURH.ERUBridge} {W : WindowCoverCertificate B}
    (N : FluxNumerics B W) : FluxLaws B W := by
  classical
  refine
    { logR_q := fun w =>
        if h : w ∈ W.windows then N.logR_q h else 0,
      jRel_q := fun w =>
        if h : w ∈ W.windows then N.jRel_q h else 0,
      logR_q_tail := N.logR_q_tail,
      jRel_q_tail := N.jRel_q_tail,
      logR_law := ?log_main,
      jRel_law := ?j_main,
      logR_tail := ?log_tail,
      jRel_tail := ?j_tail }
  · intro w hw x hx
    have := N.logR_law hw hx
    simpa [dif_pos hw] using this
  · intro w hw x hx
    have := N.jRel_law hw hx
    simpa [dif_pos hw] using this
  · intro x hx
    simpa using N.logR_tail hx
  · intro x hx
    simpa using N.jRel_tail hx

/-- A global flux certificate phrased existentially over per-point rational bounds. -/
structure FluxCertificate (B : ERURH.ERUBridge) where
  bounds :
    ∀ {x : ℝ}, B.s0R ≤ x → ∃ qR qJ : ℚ,
      |B.logR x| ≤ |algebraMap ℚ ℝ qR| ∧
      |B.jRel x| ≤ |algebraMap ℚ ℝ qJ|

/-- From windowwise laws + coverage, build a global certificate. -/
noncomputable def FluxCertificate.ofLaws
    {B : ERURH.ERUBridge} {W : WindowCoverCertificate B}
    (L : FluxLaws B W) : FluxCertificate B := by
  classical
  refine ⟨?_H⟩
  intro x hx
  set tail := W.tailStartR
  by_cases hx_main : x < tail
  · have hx_cover :
      ∃ w ∈ W.windows, x ∈ w.IccR :=
        W.cover_main hx (by simpa [tail] using hx_main)
    obtain ⟨w, hwmem, hxw⟩ := hx_cover
    refine ⟨L.logR_q w, L.jRel_q w, ?_, ?_⟩
    · exact L.logR_law hwmem hxw
    · exact L.jRel_law hwmem hxw
  · have hx_tail : tail ≤ x := by
      have := not_lt.mp hx_main
      simpa [tail] using this
    refine ⟨L.logR_q_tail, L.jRel_q_tail, ?_, ?_⟩
    · simpa [tail] using L.logR_tail hx_tail
    · simpa [tail] using L.jRel_tail hx_tail

/-- Globalize: a global flux certificate implies the inertia predicate. -/
theorem inertia_from_windows
    {B : ERURH.ERUBridge} (F : FluxCertificate B) : InertiaERU B := by
  intro x hx
  simpa using F.bounds hx

end ERURH
