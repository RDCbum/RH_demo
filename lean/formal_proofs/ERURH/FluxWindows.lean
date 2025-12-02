import Mathlib
import ERURH.BridgeCore
import ERURH.BridgeScaffold
import ERURH.RationalBounds

namespace ERURH

open Classical
open scoped Rat

/-- Closed bridge threshold reused across the coverage certificate. -/
def s0Bridge : ℚ := s0ClosedRat

/-- Tail starting point (translated to the `s`-axis). -/
def tailStart : ℚ := s0Bridge + 2

/-- Helper building a window from offsets relative to `s₀`. -/
def windowOfOffsets (offsetMin offsetMax : ℚ) : Window :=
  { s_min := s0Bridge + offsetMin
    s_max := s0Bridge + offsetMax }

/-- Window for α = 0.49, shift 0. -/
@[simp] def wAlpha49_shift0 : Window := windowOfOffsets 0 (109 / 100)

/-- Window for α = 0.50, shift 0. -/
@[simp] def wAlpha50_shift0 : Window := windowOfOffsets 0 (11 / 10)

/-- Window for α = 0.51, shift 0. -/
@[simp] def wAlpha51_shift0 : Window := windowOfOffsets 0 (111 / 100)

/-- Window for α = 0.49, shift 1. -/
@[simp] def wAlpha49_shift1 : Window := windowOfOffsets (89 / 100) 2

/-- Window for α = 0.50, shift 1. -/
@[simp] def wAlpha50_shift1 : Window := windowOfOffsets (9 / 10) 2

/-- Window for α = 0.51, shift 1. -/
@[simp] def wAlpha51_shift1 : Window := windowOfOffsets (91 / 100) 2

/-- Alpha mosaic specialised to `α ∈ {0.49, 0.50, 0.51}` with shifts 0/1. -/
def alphaWindows : List Window :=
  [ wAlpha49_shift0,
    wAlpha50_shift0,
    wAlpha51_shift0,
    wAlpha49_shift1,
    wAlpha50_shift1,
    wAlpha51_shift1 ]

lemma s0Bridge_le_tailStart : s0Bridge ≤ tailStart := by
  have : (0 : ℚ) ≤ 2 := by norm_num
  simpa [tailStart, s0Bridge, add_comm] using add_le_add_left this s0Bridge

lemma alpha_cover_aux
    {x : ℝ}
    (hx_lower : algebraMap ℚ ℝ s0Bridge ≤ x)
    (hx_upper : x < algebraMap ℚ ℝ tailStart) :
    ∃ w ∈ alphaWindows, x ∈ w.IccR := by
  classical
  set s0R : ℝ := algebraMap ℚ ℝ s0Bridge
  have hx_lower' : s0R ≤ x := by simpa [s0R] using hx_lower
  have hx_upper' : x < s0R + (2 : ℝ) := by
    simpa [s0R, tailStart, add_comm, add_left_comm, add_assoc]
      using hx_upper
  set ux : ℝ := x - s0R
  have h_ux_lt_two : ux < (2 : ℝ) := by
    have hx_upper'' : x < (2 : ℝ) + s0R := by
      simpa [add_comm, add_left_comm, add_assoc] using hx_upper'
    have h := (sub_lt_iff_lt_add).mpr hx_upper''
    simpa [ux] using h
  by_cases h_ux_le : ux ≤ (111 : ℝ) / 100
  · refine ⟨windowOfOffsets 0 (111 / 100), ?_, ?_⟩
    · simp [alphaWindows]
    · have hx_upper'' :
        x ≤ algebraMap ℚ ℝ (s0Bridge + 111 / 100) := by
        have := add_le_add_right h_ux_le s0R
        simpa [ux, s0R, add_comm, add_left_comm, add_assoc] using this
      have hx_lower'' :
        algebraMap ℚ ℝ s0Bridge ≤ x := by
          simpa [s0R] using hx_lower'
      simpa [windowOfOffsets, Window.IccR, s0Bridge, ux, s0R,
        add_comm, add_left_comm, add_assoc] using
        And.intro hx_lower'' hx_upper''
  · have h_ux_gt : (111 : ℝ) / 100 < ux := lt_of_not_ge h_ux_le
    have h_offset_le : (89 : ℝ) / 100 ≤ ux := by
      have : (89 : ℝ) / 100 < (111 : ℝ) / 100 := by norm_num
      exact le_of_lt (this.trans h_ux_gt)
    refine ⟨windowOfOffsets (89 / 100) 2, ?_, ?_⟩
    · simp [alphaWindows]
    · have hx_lower'' :
        algebraMap ℚ ℝ (s0Bridge + 89 / 100) ≤ x := by
        have := add_le_add_right h_offset_le s0R
        simpa [ux, s0R, add_comm, add_left_comm, add_assoc] using this
      have hx_upper'' :
        x ≤ algebraMap ℚ ℝ (s0Bridge + 2) := by
        have := add_le_add_right (le_of_lt h_ux_lt_two) s0R
        simpa [ux, s0R, add_comm, add_left_comm, add_assoc]
          using this
      simpa [windowOfOffsets, Window.IccR, s0Bridge,
        tailStart, ux, s0R, add_comm, add_left_comm, add_assoc] using
        And.intro hx_lower'' hx_upper''

/-- Instantiate the coverage certificate for bridges whose base point matches `s0Bridge`. -/
noncomputable def alphaCoverCertificate (B : ERUBridge)
    (hS0 : B.s0 = s0Bridge) : WindowCoverCertificate B :=
  {
    windows := alphaWindows,
    tail_start := tailStart,
    cover_main := by
      intro x hx_lower hx_upper
      have hx_lower' :
          algebraMap ℚ ℝ s0Bridge ≤ x := by
        simpa [ERUBridge.s0R, hS0] using hx_lower
      have hx_upper' :
          x < algebraMap ℚ ℝ tailStart := by
        simpa [tailStart] using hx_upper
      exact alpha_cover_aux hx_lower' hx_upper',
    cover_tail := by
      intro x hx_tail
      have hs0_le_tail :
          algebraMap ℚ ℝ s0Bridge ≤ algebraMap ℚ ℝ tailStart := by
        have : (s0Bridge : ℝ) ≤ (tailStart : ℝ) := by
          exact_mod_cast s0Bridge_le_tailStart
        simpa using this
      have hs0_le_x :
          algebraMap ℚ ℝ s0Bridge ≤ x := hs0_le_tail.trans hx_tail
      simpa [ERUBridge.s0R, hS0] using hs0_le_x
  }

/-- Window bound for `logR`, matching the released flux certificate. -/
def logRBoundWindow : ℚ := (35010938607 : ℚ) / 200000000000

/-- Window bound for `jRel`. -/
def jRelBoundWindow : ℚ := (49287667 : ℚ) / 62500000000

/-- Tail bound for `logR`. -/
def logRBoundTail : ℚ := (17505486809 : ℚ) / 100000000000

/-- Tail bound for `jRel`. -/
def jRelBoundTail : ℚ := (1363890281 : ℚ) / 200000000000

lemma logRBoundWindow_nonneg : (0 : ℚ) ≤ logRBoundWindow := by
  norm_num [logRBoundWindow]

lemma jRelBoundWindow_nonneg : (0 : ℚ) ≤ jRelBoundWindow := by
  norm_num [jRelBoundWindow]

lemma logRBoundTail_nonneg : (0 : ℚ) ≤ logRBoundTail := by
  norm_num [logRBoundTail]

lemma jRelBoundTail_nonneg : (0 : ℚ) ≤ jRelBoundTail := by
  norm_num [jRelBoundTail]

lemma logRWindow_le_tail : logRBoundWindow ≤ logRBoundTail := by
  norm_num [logRBoundWindow, logRBoundTail]

lemma jRelWindow_le_tail : jRelBoundWindow ≤ jRelBoundTail := by
  norm_num [jRelBoundWindow, jRelBoundTail]

/-- Simplified bridge obtained from the numerical artefacts. -/
noncomputable def alphaBridge : ERUBridge :=
  { s0 := s0Bridge,
    logR := fun _ => algebraMap ℚ ℝ logRBoundWindow,
    jRel := fun _ => algebraMap ℚ ℝ jRelBoundWindow }

@[simp] lemma alphaBridge_s0 :
    alphaBridge.s0 = s0Bridge := rfl

namespace FluxWindows

@[simp] def s0Bridge : ℚ := ERURH.s0Bridge

@[simp] def tailStart : ℚ := ERURH.tailStart

@[simp] def windowOfOffsets (offsetMin offsetMax : ℚ) : Window :=
  ERURH.windowOfOffsets offsetMin offsetMax

@[simp] def wAlpha49_shift0 : Window := ERURH.wAlpha49_shift0

@[simp] def wAlpha49_shift1 : Window := ERURH.wAlpha49_shift1

@[simp] def wAlpha50_shift0 : Window := ERURH.wAlpha50_shift0

@[simp] def wAlpha50_shift1 : Window := ERURH.wAlpha50_shift1

@[simp] def wAlpha51_shift0 : Window := ERURH.wAlpha51_shift0

@[simp] def wAlpha51_shift1 : Window := ERURH.wAlpha51_shift1

lemma s0Bridge_le_tailStart : s0Bridge ≤ tailStart :=
  ERURH.s0Bridge_le_tailStart

end FluxWindows

end ERURH
