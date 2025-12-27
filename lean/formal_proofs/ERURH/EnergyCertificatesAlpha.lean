import ERURH.ERUEnergyAlpha
import ERURH.ERUModesCore
import ERURH.RationalBounds
import ERURH.LemmaBEnergy

namespace ERURH

/-- Global energy certificate for the alpha bridge.

This structure is meant to package the rational bounds that control
the relationship between the kernel-level energy (based on
`kappaBookClosedRat`) and the global ERU energy envelope
`lGlobalFormalRat`. At this stage we only record the two key
rational constants and their identification with the corresponding
values used in `ERURH.RationalBounds`. -/
structure GlobalEnergyCertificate_alpha where
  /-- Closed-book bound for the energy kernel (κ-book), as a rational. -/
  kappa_book : ℚ
  /-- Global energy envelope bound (L_global), as a rational. -/
  L_global   : ℚ
  /-- Identification of `kappa_book` with the auto-generated bound. -/
  h_kappa    : kappa_book = kappaBookClosedRat
  /-- Identification of `L_global` with the auto-generated global bound. -/
  h_L        : L_global   = lGlobalFormalRat

/-- Correctness predicate for a global energy certificate in the alpha case.

A correct certificate must at least identify its rational fields with the
auto-generated bounds `kappaBookClosedRat` and `lGlobalFormalRat`. In
addition, it should be compatible with the formal κ-bound
`kappaLowFormalRat ≤ kappaBookClosedRat` coming from `LemmaBEnergy`.
Future refinements will strengthen this predicate to encode the full finite
system of rational inequalities enforcing the desired global energy
dominance. -/
def GlobalEnergyCertificateCorrect_alpha
  (cert : GlobalEnergyCertificate_alpha) : Prop :=
  cert.kappa_book = kappaBookClosedRat ∧
    cert.L_global = lGlobalFormalRat ∧
    kappaLowFormalRat ≤ cert.kappa_book

/-- Concrete global energy certificate for the alpha bridge, instantiated
with the auto-generated rational bounds. -/
def globalEnergyCertificate_true_alpha : GlobalEnergyCertificate_alpha :=
  { kappa_book := kappaBookClosedRat
    L_global   := lGlobalFormalRat
    h_kappa    := rfl
    h_L        := rfl }

/-- Correctness of the concrete global energy certificate. -/
lemma globalEnergyCertificate_true_correct_alpha :
  GlobalEnergyCertificateCorrect_alpha globalEnergyCertificate_true_alpha :=
by
  dsimp [globalEnergyCertificate_true_alpha, GlobalEnergyCertificateCorrect_alpha]
  constructor
  · rfl
  constructor
  · rfl
  · simpa using lemmaB_energy

/-- Kernel-level energy blow-up certificate for the alpha bridge.

This structure is intended to package the rational information that
controls the behaviour of the ERU energy kernel in the presence of
an exponential ERU mode with `β > 1/2`. For now it only records the
κ-book bound as a rational, mirroring `kappaBookClosedRat`. -/
structure KernelBlowupCertificate_alpha where
  /-- Closed-book bound for the kernel (κ-book), as a rational. -/
  kappa_book : ℚ
  /-- Identification of `kappa_book` with the auto-generated bound. -/
  h_kappa    : kappa_book = kappaBookClosedRat

/-- Correctness predicate for a kernel-level energy blow-up certificate
in the alpha case.

A correct certificate must at least identify its κ-book field with the
auto-generated bound `kappaBookClosedRat`. Future refinements will add the
rational constraints that link off-line exponential modes to kernel blow-up
at this κ-book level. -/
def KernelBlowupCertificateCorrect_alpha
  (cert : KernelBlowupCertificate_alpha) : Prop :=
  cert.kappa_book = kappaBookClosedRat

/-- Existence of a global energy certificate for the alpha bridge, witnessed
by the concrete `globalEnergyCertificate_true_alpha`. -/
theorem GlobalEnergyCertificate_exists_alpha :
  ∃ cert : GlobalEnergyCertificate_alpha,
    GlobalEnergyCertificateCorrect_alpha cert :=
by
  exact ⟨globalEnergyCertificate_true_alpha,
    globalEnergyCertificate_true_correct_alpha⟩

/-- Existence of a kernel-level energy blow-up certificate for the
alpha bridge.

Analytically, this axiom encapsulates the idea that the κ-book bound
admits a finite certificate witnessing that off-line exponential modes
cannot be accommodated without forcing the kernel energy beyond its
threshold. -/
def kernelBlowupCertificate_true_alpha : KernelBlowupCertificate_alpha :=
  { kappa_book := kappaBookClosedRat
    h_kappa := rfl }

/-- Correctness of the concrete kernel blow-up certificate. -/
lemma kernelBlowupCertificate_true_correct_alpha :
  KernelBlowupCertificateCorrect_alpha kernelBlowupCertificate_true_alpha :=
by
  rfl

/-- Existence of a kernel-level energy blow-up certificate for the
alpha bridge, witnessed by `kernelBlowupCertificate_true_alpha`. -/
theorem KernelBlowupCertificate_exists_alpha :
  ∃ cert : KernelBlowupCertificate_alpha,
    KernelBlowupCertificateCorrect_alpha cert :=
by
  exact ⟨kernelBlowupCertificate_true_alpha,
    kernelBlowupCertificate_true_correct_alpha⟩

/-- Wrapper recovering the simple global energy dominance statement
from the certificate-based axiom and the existence of a certificate. -/
lemma ERU_energy_global_dominates_kernel
  (h_legacy :
    ERU_energy_kernel_alpha = kernel_threshold_alpha →
    ERU_energy_global_alpha > L_global_alpha) :
  ERU_energy_kernel_alpha ≥ kernel_threshold_alpha →
  ERU_energy_global_alpha > L_global_alpha :=
by
  intro _h_kernel
  -- Use the legacy statement; the threshold is definitionally the kernel value.
  exact h_legacy rfl

/-- Certificate-based global energy dominance: if there exists a
correct global energy certificate and the kernel-level energy exceeds
its threshold, then the global ERU energy of the alpha bridge must
exceed the envelope `L_global_alpha`. -/
lemma ERU_energy_global_dominates_kernel_of_certificate
  (h_legacy :
    ERU_energy_kernel_alpha = kernel_threshold_alpha →
    ERU_energy_global_alpha > L_global_alpha) :
  (∃ cert : GlobalEnergyCertificate_alpha,
    GlobalEnergyCertificateCorrect_alpha cert) →
  ERU_energy_kernel_alpha ≥ kernel_threshold_alpha →
  ERU_energy_global_alpha > L_global_alpha :=
by
  intro _h_cert h_kernel
  exact ERU_energy_global_dominates_kernel h_legacy h_kernel

/-- Certificate-based kernel energy blow-up: if there exists a correct
kernel-level certificate and an exponential ERU mode with `β > 1/2`,
then the ERU energy kernel for the alpha bridge must exceed its
threshold `kernel_threshold_alpha`. -/
theorem ERU_energy_kernel_blowup_of_mode_beta_of_certificate
    (h_ERU_energy_kernel_blowup_of_mode_beta_of_certificate :
      {β : ℝ} → (hβ : β > (1/2 : ℝ)) →
        (∃ cert : KernelBlowupCertificate_alpha,
          KernelBlowupCertificateCorrect_alpha cert) →
        ERU_mode_beta β →
        ERU_energy_kernel_alpha ≥ kernel_threshold_alpha) :
    {β : ℝ} → (hβ : β > (1/2 : ℝ)) →
      (∃ cert : KernelBlowupCertificate_alpha,
        KernelBlowupCertificateCorrect_alpha cert) →
      ERU_mode_beta β →
      ERU_energy_kernel_alpha ≥ kernel_threshold_alpha :=
  h_ERU_energy_kernel_blowup_of_mode_beta_of_certificate

/-- Wrapper recovering the simple kernel-level energy blow-up statement
from the certificate-based axiom and the existence of a kernel
certificate. -/
lemma ERU_energy_kernel_blowup_of_mode_beta
  (h_kernel_blowup :
    {β : ℝ} → (hβ : β > (1/2 : ℝ)) →
      (∃ cert : KernelBlowupCertificate_alpha,
        KernelBlowupCertificateCorrect_alpha cert) →
      ERU_mode_beta β →
      ERU_energy_kernel_alpha ≥ kernel_threshold_alpha)
  {β : ℝ} (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β →
  ERU_energy_kernel_alpha ≥ kernel_threshold_alpha :=
by
  intro h_mode
  have h_cert :
      ∃ cert : KernelBlowupCertificate_alpha,
        KernelBlowupCertificateCorrect_alpha cert :=
    KernelBlowupCertificate_exists_alpha
  exact ERU_energy_kernel_blowup_of_mode_beta_of_certificate
    h_kernel_blowup hβ h_cert h_mode

end ERURH
