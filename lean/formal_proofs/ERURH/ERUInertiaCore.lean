import ERURH.ERUModesCore

namespace ERURH

/-- Strong ERU inertia hypothesis for the alpha bridge.

    Intuitively: the ERURH residual `logR_alpha(s)` decays like
    `C * e^{-s/2} * s^2` for large `s`, i.e. the ERU flow is
    compatible with the Riemann-type square-root barrier. -/
def InertiaERU_alpha_strong : Prop :=
  ∃ C : ℚ, ∃ S0 : ℝ, ∀ {s : ℝ}, S0 ≤ s →
    |logR_alpha s| ≤
      (algebraMap ℚ ℝ C) * Real.exp (-s / 2) * (Real.log (Real.exp s)) ^ 2

end ERURH
