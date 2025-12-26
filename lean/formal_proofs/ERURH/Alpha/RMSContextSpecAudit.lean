import ERURH.ERURH_A2Hypotheses
import ERURH.ERURH_GatesAlpha

namespace ERURH
namespace Alpha

/-!
Audit: surface the exact shapes of RMSLocalContext and A1/A2 predicates.
The examples are intentionally left open after unfolding/simp.
-/

#print RMSLocalContext
#print A1_mode
#print A2Low_RMS
#print A2Tail_RMS
#print Alpha.RMS_envelope_closed

section
variable (ctx : RMSLocalContext)

example : A1_mode ctx := by
  simp [A1_mode]

example : A2Low_RMS ctx := by
  simp [A2Low_RMS]

example : A2Tail_RMS ctx := by
  simp [A2Tail_RMS]

example : Alpha.RMS_envelope_closed ctx := by
  simp [Alpha.RMS_envelope_closed]

end

end Alpha
end ERURH
