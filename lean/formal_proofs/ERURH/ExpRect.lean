import Mathlib
import ERURH.RH
import ERURH.ZetaLink

/-!
# ERURH.ExpRect

Wrapper encoding the analytic hypotheses needed to run the explicit
formula inside a vertical rectangle.  The goal is to isolate the
boundary-control requirements from the combinatorial certificates so
that they can be discharged independently.
-/

namespace ERURH

open Complex

/-- Minimal analytic package required to apply the explicit formula on a strip
bounded between the heights `t_left` and `t_right`. -/
structure ExpRect (ξ : ℂ → ℂ) where
  log_bound : ℝ → ℝ
  arg_bound : ℝ → ℝ
  Tcap : ℝ

end ERURH
