import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_GatesAlpha

namespace ERURH
namespace Alpha

/-- A1/A2 plus the RMS decomposition contradict a closed RMS envelope. -/
theorem A1A2_decomp_envelope_inconsistent
  (ctx : RMSLocalContext)
  (hA1 : A1_mode ctx)
  (hLow : A2Low_RMS ctx)
  (hTail : A2Tail_RMS ctx)
  (hClosed : RMS_envelope_closed ctx) :
  False := by
  have hRMS : ERURH.RMSLocalHypothesis ctx :=
    ERURH.RMSLocalHypothesis_of_A2 ctx hA1 hLow hTail
  rcases hRMS with ⟨w, hgt⟩
  have hle : ctx.RMS_alpha w ≤ C_envelope_formal := hClosed w
  exact not_lt_of_ge hle hgt

end Alpha
end ERURH
