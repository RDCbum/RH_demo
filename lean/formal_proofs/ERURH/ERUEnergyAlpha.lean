import ERURH.ERUInertia
import ERURH.FluxEnergyBridge
import ERURH.RationalBounds
import ERURH.EnergyCertificatesAlpha

/-
# ERU energy (global) for the alpha bridge

This file introduces a *minimal* abstract interface for a global ERU
energy attached to `logR_alpha`. The actual analytic definition
(e.g. in terms of integrals or window sums) is deliberately left open;
we only expose a boundedness statement controlled by a constant
`L_global_alpha`.

The idea is that future work will refine this interface and connect it
to the flux/energy certificates in `FluxEnergyBridge` and to ERURH gates.
-/

namespace ERURH

/-- Abstract global ERU energy attached to `logR_alpha`.

At this stage we only postulate its existence as a real number; later on
this can be refined to a concrete expression (e.g. in terms of windowed
flux energies). -/
constant ERU_energy_global_alpha : R

/-- Global ERU energy envelope for the alpha bridge, instantiated from the
closed-form rational bound `lGlobalFormalRat` and converted to `R`. This is
intended to match the maximal allowed ERU energy used in the ERURH reports. -/
noncomputable def L_global_alpha : R :=
  algebraMap Q R lGlobalFormalRat

/-- ERU energy kernel for the alpha bridge, instantiated via the closed-book
bound `kappaBookClosedRat` converted to R. This ties the kernel to the
numerical energy envelope used in Lemma B. -/
noncomputable def ERU_energy_kernel_alpha : R :=
  algebraMap Q R kappaBookClosedRat

/-- Threshold for the ERU energy kernel in the alpha case. We keep it equal to
`ERU_energy_kernel_alpha`, so any kernel-level blow-up beyond this bound
aligns with the closed-book energy envelope. -/
noncomputable def kernel_threshold_alpha : R :=
  ERU_energy_kernel_alpha

/--
  DEPRECATED: the primitive global ERU energy bound is no longer used
  directly. The preferred structured paths are:

  * `ERU_energy_alpha_bounded_from_hypotheses`, which derives the bound
    from `EnergyBoundHypotheses_alpha` and the concrete flux certificate
    `flux_energy_alpha_true`.
  * the structured flux bridge `ERU_energy_alpha_supported_by_flux`
    provided in `EnergyBoundsAlpha`.

  This axiom is kept temporarily for compatibility during development,
  but new code should avoid depending on it.
-/
lemma ERU_energy_alpha_bounded :
  ERU_energy_global_alpha = L_global_alpha :=
by
  -- Route through the flux-based hypotheses and checklist bridges.
  have h := ERU_energy_alpha_bounded_from_hypotheses
  simpa using h

/--
  DEPRECATED: direct global energy blow-up from the kernel-level bound.
  New code should use the certificate-based wrapper
  `ERU_energy_global_dominates_kernel` from `EnergyCertificatesAlpha`,
  which factors the statement through an explicit global energy
  certificate.

  This axiom is kept temporarily for compatibility during the
  transition; it is no longer used in the main energetic ERURH
  pipeline. -/
lemma ERU_energy_global_dominates_kernel_legacy :
  ERU_energy_kernel_alpha = kernel_threshold_alpha ->
  ERU_energy_global_alpha > L_global_alpha :=
by
  intro h_kernel
  exact ERU_energy_global_dominates_kernel h_kernel

end ERURH
