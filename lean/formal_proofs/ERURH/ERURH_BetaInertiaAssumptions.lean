import ERURH.EnergyCertificatesAlpha
import ERURH.ERUModesAlpha
import ERURH.Beta.InertiaCertificatesBeta
import ERURH.Beta.CompositeCertificateBeta

/-
# Beta inertia assumptions (external numeric package)

This package bundles the external beta-level numeric assumptions:
* correctness of the generated beta inertia certificates (strong and composite),
* the certificate-based kernel energy blow-up for β > 1/2.

These are treated as external numeric inputs, not proved within the alpha core.
-/

namespace ERURH

structure BetaInertiaAssumptions where
  strongInertiaCertificateCorrect_beta_numeric :
    Beta.StrongInertiaCertificateCorrect_beta Beta.strongInertiaCertificate_beta_numeric
  strongInertiaCompositeCorrect_beta_numeric :
    Beta.StrongInertiaCompositeCorrect_beta Beta.strongInertiaComposite_beta_numeric
  energy_kernel_blowup_of_mode_beta_of_certificate :
    ∀ {β : ℝ}, β > (1/2 : ℝ) →
      (∃ cert : KernelBlowupCertificate_alpha,
        KernelBlowupCertificateCorrect_alpha cert) →
      ERU_mode_beta β →
      ERU_energy_kernel_alpha ≥ kernel_threshold_alpha

/-- External numeric beta assumptions bundle. -/
axiom betaInertiaAssumptions_true : BetaInertiaAssumptions

end ERURH
