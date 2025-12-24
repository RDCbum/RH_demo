import ERURH.AlphaInterfaces

namespace ERURH

/-- ERU-style log-residual for the alpha bridge: `logR(s) = E(e^s) / e^s`. -/
noncomputable def logR_alpha (s : ℝ) : ℝ :=
  let x := Real.exp s
  AlphaPsi.E x / x

/-- Abstract ERU exponential mode of weight `β` for the alpha bridge. -/
def ERU_mode_beta (β : ℝ) : Prop :=
  ∃ s0 : ℝ, ∀ {s : ℝ}, s ≥ s0 →
    |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)

end ERURH
