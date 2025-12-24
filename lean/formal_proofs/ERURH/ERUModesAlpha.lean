import ERURH.ERUInertia
import ERURH.ERUEnergyAlpha
import ERURH.EnergyBoundsAlpha
import ERURH.EnergyCertificatesAlpha
import ERURH.InertiaCertificatesAlpha

namespace ERURH

/-- Kernel-level energy blow-up: any exponential ERU mode with `β > 1/2`
forces the ERU energy kernel to exceed its abstract threshold
`kernel_threshold_alpha`.

This axiom is intended as a more concrete intermediate step between
modes and the global energy bound, to be refined in terms of windows
and flux certificates in future work. -/
/-
  DEPRECATED: direct kernel-level energy blow-up from an exponential
  ERU mode with `β > 1/2`. New code should use the certificate-based
  version `ERU_energy_kernel_blowup_of_mode_beta` from
  `EnergyCertificatesAlpha`, which factors the statement through an
  explicit kernel blow-up certificate.

  This axiom is kept temporarily for compatibility during the
  transition; it is no longer used in the main energetic ERURH
  pipeline.
-/
lemma ERU_energy_kernel_blowup_of_mode_beta_legacy
  {β : ℝ} (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → ERU_energy_kernel_alpha ≥ kernel_threshold_alpha :=
by
  intro h_mode
  exact ERU_energy_kernel_blowup_of_mode_beta hβ h_mode

/-- From kernel-level energy blow-up to global energy blow-up: this combines
`ERU_energy_kernel_blowup_of_mode_beta` with the abstract domination of the
global ERU energy over the kernel. This lemma provides an intermediate
structured version of the global energy blow-up for modes with `β > 1/2`. -/
lemma ERU_energy_blowup_of_mode_beta_via_kernel
  {β : ℝ} (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → ERU_energy_global_alpha > L_global_alpha :=
by
  intro h_mode
  have h_kernel : ERU_energy_kernel_alpha ≥ kernel_threshold_alpha :=
    ERU_energy_kernel_blowup_of_mode_beta hβ h_mode
  exact ERU_energy_global_dominates_kernel h_kernel

/-- Energy blow-up gate for exponential modes: any exponential mode
with real part `β > 1/2` forces the global ERU energy of the alpha bridge
to exceed the allowed envelope `L_global_alpha`.

This axiom is intended to capture the analytic ERURH principle that
off-line modes (β > 1/2) cannot be accommodated within the global
energy budget. -/
/-
  DEPRECATED: the direct axiom for global energy blow-up is no longer used.
  The preferred structured variant is
  `ERU_energy_blowup_of_mode_beta_via_kernel`, which factors the blow-up
  through the intermediate kernel energy.

  This axiom is kept temporarily for compatibility during development,
  but new code should avoid depending on it.
-/
lemma ERU_energy_blowup_of_mode_beta
  {β : ℝ} (hβ : β > (1/2 : ℝ)) :
  ERU_mode_beta β → ERU_energy_global_alpha > L_global_alpha :=
by
  intro h_mode
  exact ERU_energy_blowup_of_mode_beta_via_kernel hβ h_mode

/-- There can be no exponential ERU mode with weight `β > 1/2`:
such a mode would violate the global energy bound. -/
theorem no_ERU_mode_beta_of_gt_half
  {β : ℝ} (hβ : β > (1/2 : ℝ))
  (h_energy : EnergyBoundHypotheses_alpha) :
  ¬ ERU_mode_beta β :=
by
  intro h_mode
  -- Global energy blow-up obtained via the kernel-level blow-up
  have h_explosion : ERU_energy_global_alpha > L_global_alpha :=
    ERU_energy_blowup_of_mode_beta_via_kernel hβ h_mode
  have h_bound : ERU_energy_global_alpha ≤ L_global_alpha :=
    le_of_eq (ERU_energy_alpha_bounded_from_hypotheses h_energy)
  exact lt_irrefl _ (lt_of_le_of_lt h_bound h_explosion)

/-- Abstract bridge: the absence of exponential ERU modes with `β > 1/2` is
    sufficient to derive ERU inertia for the alpha bridge.

    In the current formalisation, inertia for `alphaBridge` is already
    certified unconditionally via `InertiaERU_alphaBridge`. The no-modes
    hypothesis is kept for interface compatibility. -/
lemma alphaBridge_inertia_of_no_modes :
  (∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β) →
  InertiaERU alphaBridge :=
by
  intro _h_no_modes
  exact InertiaERU_alphaBridge

/-- Wrapper: derive the strong ERU inertia statement for `logR_alpha` from the
absence of modes `β > 1/2`, via the bridge inertia for `alphaBridge`. This
makes explicit the two-step structure (no modes → bridge inertia → strong
inertia). -/
lemma InertiaERU_alpha_strong_of_no_modes_via_bridge :
  (∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β) →
  InertiaERU_alpha_strong :=
by
  intro h_no_modes
  have h_bridge : InertiaERU alphaBridge :=
    alphaBridge_inertia_of_no_modes h_no_modes
  exact InertiaERU_alpha_strong_of_bridge_inertia_certified h_bridge

/-- Certificate-based route: from the absence of modes `β > 1/2` we derive
strong ERU inertia using the bridge and strong inertia certificates, avoiding
the legacy direct axiom. -/
lemma InertiaERU_alpha_strong_of_no_modes_via_certificates :
  (∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β) →
  InertiaERU_alpha_strong :=
by
  intro _h_no_modes
  -- Bridge inertia is certified unconditionally via the concrete certificate.
  have h_bridge : InertiaERU alphaBridge := InertiaERU_alphaBridge
  exact InertiaERU_alpha_strong_of_bridge_inertia_certified h_bridge

/-- Legacy direct axiom: from the absence of exponential ERU modes with
`β > 1/2` we obtain the strong ERU inertia statement for the alpha bridge.

Conceptually, this says that ruling out all off-line exponential modes is
enough to recover the quantitative bound encoded in `InertiaERU_alpha_strong`.
The lemma `InertiaERU_alpha_strong_of_no_modes_via_bridge` exposes a more
structured two-step variant via `alphaBridge`. -/
lemma InertiaERU_alpha_strong_of_no_modes :
  (∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β) →
  InertiaERU_alpha_strong :=
by
  intro h_no_modes
  exact InertiaERU_alpha_strong_of_no_modes_via_certificates h_no_modes

/-- Energetic ERU principle for `xiAlpha`: combining the global
energy bound, the energy blow-up gate for exponential modes with
`β > 1/2`, and the ERURH equivalence, we obtain the Riemann
Hypothesis for `xiAlpha`. -/
theorem RH_from_ERU_energy
  (h_energy : EnergyBoundHypotheses_alpha) :
  RiemannHypothesis xiAlpha :=
by
  -- Step 1: package `no_ERU_mode_beta_of_gt_half` as a uniform statement.
  have h_no_modes : ∀ β : ℝ, β > (1/2 : ℝ) → ¬ ERU_mode_beta β := by
    intro β hβ
    exact no_ERU_mode_beta_of_gt_half hβ h_energy
  -- Step 2: obtain strong ERU inertia from the absence of modes.
  have h_inertia : InertiaERU_alpha_strong :=
    InertiaERU_alpha_strong_of_no_modes_via_certificates h_no_modes
  -- Step 3: use the existing ERURH equivalence for the alpha case.
  exact (ERU_RH_equiv_alpha).1 h_inertia

end ERURH
