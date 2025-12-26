import ERURH.ERURH_MasterTheoremSummary
import ERURH.EnergyCertificatesAlpha
import ERURH.InertiaCertificatesAlpha
import ERURH.ERURH_GatesAlpha
import ERURH.ERURH_BetaInertiaAssumptions
import ERURH.RH_Unconditional_Core

#print axioms ERURH.RH_from_ERURH_conditional
#print axioms ERURH.RH_unconditional_core

#print axioms ERURH.GlobalEnergyCertificateCorrect_alpha
#print axioms ERURH.globalEnergyCertificate_true_alpha

#print axioms ERURH.KernelBlowupCertificateCorrect_alpha
#print axioms ERURH.kernelBlowupCertificate_true_alpha

#print axioms ERURH.Alpha.RMS_envelope_closed

-- Beta side: explicit assumptions (no global numeric constants in release).
#check ERURH.Beta.BetaInertiaBundle
#check ERURH.Beta.StrongInertiaCertificate_beta
#check ERURH.Beta.StrongInertiaComposite_beta
#check ERURH.Beta.StrongInertiaCertificateCorrect_beta
#check ERURH.Beta.StrongInertiaCompositeCorrect_beta
