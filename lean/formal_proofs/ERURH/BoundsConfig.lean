import Mathlib
import ERURH.FluxWindows
import ERURH.RationalBounds

namespace ERURH
namespace BoundsConfig

/-- Rational cap for the analytic band height. -/
def boundsTcapQ : ℚ := 300

/-- Real embedding of `boundsTcapQ`. -/
@[simp] def boundsTcapR : ℝ := (boundsTcapQ : ℝ)

@[simp] lemma boundsTcapQ_num : boundsTcapQ = (300 : ℚ) := rfl

@[simp] lemma boundsTcapR_eq : boundsTcapR = (300 : ℝ) := rfl

lemma boundsTcapQ_pos : 0 < boundsTcapQ := by
  norm_num [boundsTcapQ]

lemma boundsTcapR_pos : 0 < boundsTcapR := by
  have : (0 : ℝ) < (boundsTcapQ : ℝ) := by
    exact_mod_cast boundsTcapQ_pos
  simpa [boundsTcapR] using this

lemma tailStart_le_boundsTcap : tailStart ≤ boundsTcapQ := by
  have hs0_raw :
      (Rat.ofInt (Int.ofNat 2604787528) /
          Rat.ofInt (Int.ofNat 183882357)) ≤ (298 : ℚ) := by
    norm_num
  have hs0 :
      s0ClosedRat ≤ (298 : ℚ) := by
    simpa [s0ClosedRat, s0Closed, QBound.toRat] using hs0_raw
  have h_add_base := add_le_add_right hs0 (2 : ℚ)
  have h_add : s0ClosedRat + 2 ≤ (300 : ℚ) := by
    simpa [show (298 : ℚ) + 2 = 300 by norm_num] using h_add_base
  simpa [tailStart, s0Bridge, boundsTcapQ, add_comm, add_left_comm, add_assoc]
    using h_add

lemma tailStartR_le_boundsTcapR :
    (tailStart : ℝ) ≤ boundsTcapR := by
  have : ((tailStart : ℚ) : ℝ) ≤ (boundsTcapQ : ℝ) := by
    exact_mod_cast tailStart_le_boundsTcap
  simpa [boundsTcapR] using this

end BoundsConfig

@[simp] def boundsTcap : ℚ := BoundsConfig.boundsTcapQ

@[simp] noncomputable def boundsTcapReal : ℝ := BoundsConfig.boundsTcapR

@[simp] lemma boundsTcap_num : boundsTcap = (300 : ℚ) := rfl

@[simp] lemma boundsTcapReal_eq : boundsTcapReal = (300 : ℝ) := rfl

namespace BoundsConfig

@[simp] def boundsTcap : ℚ := ERURH.boundsTcap

@[simp] noncomputable def boundsTcapReal : ℝ := ERURH.boundsTcapReal

end BoundsConfig

end ERURH
