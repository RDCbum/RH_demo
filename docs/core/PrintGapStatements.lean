import ERURH.A1FromSupercriticalMode
import ERURH.AxiomsShimBundle
import ERURH.ERUModesCore
import ERURH.ERURH_A2Hypotheses
import ERURH.Alpha.GeneratedRMSContext

#check ERURH.no_supercritical_beta

section
  variable (mode_to_rms_mode :
    ∀ β : ℝ, β > (1/2 : ℝ) → ERURH.ERU_mode_beta β →
      ∃ w : ERURH.Alpha.GeneratedRMSContext.ctx_real.Window,
        ∃ K : ℝ,
          K > ERURH.Alpha.GeneratedRMSContext.ctx_real.c_low +
              ERURH.Alpha.GeneratedRMSContext.ctx_real.c_tail +
              ERURH.C_envelope_formal ∧
          ERURH.Alpha.GeneratedRMSContext.ctx_real.RMS_mode w ≥ K)
  #check mode_to_rms_mode
end

#print ERURH.AxiomsShimAccepted
