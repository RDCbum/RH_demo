import ERURH.Alpha.GeneratedRMSContext
import ERURH.ERURH_GatesAlpha

namespace ERURH
namespace Alpha
namespace GeneratedRMSContext

/-- RMS envelope closure for the fixed gate/data context. -/
theorem ctx_real_RMS_envelope_closed :
    ERURH.Alpha.RMS_envelope_closed ctx_real := by
  intro w
  have h_rat : _root_.cEnvelopeCtxRat = ERURH.cEnvelopeFormalRat := by
    native_decide
  have h_rat_real : (_root_.cEnvelopeCtxRat : ℝ) = (ERURH.cEnvelopeFormalRat : ℝ) := by
    exact_mod_cast h_rat
  have h_eq : _root_.cEnvelopeCtx = ERURH.C_envelope_formal := by
    simpa [_root_.cEnvelopeCtx, ERURH.C_envelope_formal] using h_rat_real
  simpa [ctx_real] using (le_of_eq h_eq)

end GeneratedRMSContext
end Alpha
end ERURH
