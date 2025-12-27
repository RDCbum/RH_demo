import ERURH.EnergyCertificatesAlpha
import ERURH.ERUModesAlpha
import ERURH.Beta.InertiaCertificatesBeta
import ERURH.Beta.CompositeCertificateBeta
import ERURH.Beta.GeneratedBetaCertificate

/-
# Beta inertia assumptions (external numeric package)

This package bundles the external beta-level numeric assumptions:
* correctness of the beta inertia certificates (strong and composite),
* the certificate-based kernel energy blow-up for beta > 1/2.

These are treated as external numeric inputs, not proved within the alpha core.
-/

namespace ERURH.Beta

/-- Bundle of beta numeric data and correctness proofs (explicit assumptions). -/
structure BetaInertiaBundle where
  cert : StrongInertiaCertificate_beta
  h_cert : StrongInertiaCertificateCorrect_beta cert
  comp : StrongInertiaComposite_beta
  h_comp : StrongInertiaCompositeCorrect_beta comp

end ERURH.Beta

namespace ERURH

structure BetaInertiaAssumptions where
  bundle : Beta.BetaInertiaBundle
  energy_kernel_blowup_of_mode_beta_of_certificate :
    ∀ {β : ℝ}, β > (1/2 : ℝ) →
      (∃ cert : KernelBlowupCertificate_alpha,
        KernelBlowupCertificateCorrect_alpha cert) →
      ERU_mode_beta β →
      ERU_energy_kernel_alpha ≥ kernel_threshold_alpha

/-- External numeric beta assumptions bundle (generated from frozen JSON). -/
noncomputable def betaInertiaAssumptions_true
  (h_kernel_blowup :
    ∀ {β : ℝ}, β > (1/2 : ℝ) →
      (∃ cert : KernelBlowupCertificate_alpha,
        KernelBlowupCertificateCorrect_alpha cert) →
      ERU_mode_beta β →
      ERU_energy_kernel_alpha ≥ kernel_threshold_alpha) :
  BetaInertiaAssumptions := by
  refine
    { bundle :=
        { cert := Beta.strongInertiaCertificate_beta_numeric
          h_cert := Beta.strongInertiaCertificate_beta_numeric_correct
          comp := Beta.strongInertiaComposite_beta_numeric
          h_comp := Beta.strongInertiaComposite_beta_numeric_correct }
      energy_kernel_blowup_of_mode_beta_of_certificate := h_kernel_blowup }

end ERURH

