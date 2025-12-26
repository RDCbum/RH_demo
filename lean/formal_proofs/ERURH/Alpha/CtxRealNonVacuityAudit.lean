import Mathlib
import ERURH.Alpha.GeneratedRMSContext
import ERURH.Alpha.GeneratedRMSContextEnvelope
import ERURH.ERURH_A2Hypotheses

open ERURH

-- Audit references for RMS assumptions and decomposition.
#check ERURH.A1_mode
#check ERURH.A2Low_RMS
#check ERURH.A2Tail_RMS
#check ERURH.Alpha.RMS_envelope_closed
#check ERURH.RMSLocalContext.RMS_decomp

/-- Non-vacuity audit: ctx_real does not satisfy A1_mode with current numeric data. -/
theorem ctx_real_not_A1_mode :
    ¬ ERURH.A1_mode ERURH.Alpha.GeneratedRMSContext.ctx_real := by
  classical
  intro h
  rcases h with ⟨w, K, hK, hmode⟩
  have hbound :
      ERURH.Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≤
        ERURH.Alpha.GeneratedRMSContext.ctx_real.c_low +
          ERURH.Alpha.GeneratedRMSContext.ctx_real.c_tail +
            ERURH.C_envelope_formal := by
    dsimp [ERURH.Alpha.GeneratedRMSContext.ctx_real, ctx_real] at w ⊢
    fin_cases w <;>
      norm_num [ERURH.Alpha.GeneratedRMSContext.ctx_real, ctx_real,
        rmsMode, rmsModeRat, rmsModeList,
        cLow, cLowRat, cTail, cTailRat,
        cEnvelopeCtx, cEnvelopeCtxRat,
        ERURH.C_envelope_formal, ERURH.cEnvelopeFormalRat,
        ERURH.cEnvelopeFormal, ERURH.QBound.toRat]
  have hKle :
      K ≤
        ERURH.Alpha.GeneratedRMSContext.ctx_real.c_low +
          ERURH.Alpha.GeneratedRMSContext.ctx_real.c_tail +
            ERURH.C_envelope_formal := by
    linarith
  linarith
