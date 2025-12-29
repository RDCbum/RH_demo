import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

/-!
# A2 discharge for ctx_real

This module packages the A2-low and A2-tail bounds for the generated
`ctx_real` context. The bounds are already available from the gate-generated
context; here we expose a single theorem that returns both at once.
-/

namespace ERURH

theorem ctx_real_A2 :
    A2Low_RMS Alpha.GeneratedRMSContext.ctx_real ∧
    A2Tail_RMS Alpha.GeneratedRMSContext.ctx_real := by
  exact ⟨Alpha.GeneratedRMSContext.ctx_real_A2Low,
    Alpha.GeneratedRMSContext.ctx_real_A2Tail⟩

end ERURH
