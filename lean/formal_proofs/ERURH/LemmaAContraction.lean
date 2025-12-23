/-

# Lema A (contraction)



Lean stub exposing the rational statements used by the tooling.

-/



import Mathlib.Data.Rat.Init

import Mathlib.Tactic

import ERURH.WeightedBands
import ERURH.Flux.LawvereMetric



namespace ERURH

open scoped NNReal



@[simp] theorem lemmaA_contraction_bound :

    lGlobalFormalRat <= lAClosedRat := by

  native_decide



@[simp] theorem lemmaA_threshold :

    analyticBand.threshold.toRat <= s0ClosedRat := by

  native_decide



/-- Combined algebraic statement: the closed contraction constant dominates the formal one

    and the unified threshold controls the analytic band. -/

theorem lemmaA_closed_window :

    And (lGlobalFormalRat <= lAClosedRat)

        (analyticBand.threshold.toRat <= s0ClosedRat) :=

  And.intro lemmaA_contraction_bound lemmaA_threshold



@[simp] lemma lAClosedRat_nonneg_real : (0 : ℝ) ≤ (lAClosedRat : ℝ) := by
  exact_mod_cast (by native_decide : (0 : Rat) ≤ lAClosedRat)

@[simp] lemma lAClosedRat_lt_one_real : (lAClosedRat : ℝ) < 1 := by
  exact_mod_cast (by native_decide : lAClosedRat < (1 : Rat))

/-- Contraction constant converted to `ℝ≥0`. -/
def envelopeContractionConstant : ℝ≥0 :=
  ⟨(lAClosedRat : ℝ), lAClosedRat_nonneg_real⟩

@[simp] lemma envelopeContractionConstant_lt_one :
    envelopeContractionConstant < 1 := by
  simpa [envelopeContractionConstant] using lAClosedRat_lt_one_real

open Flux

/-- Global flux step on envelopes, collapsing to the released certificate built
    from the windowwise laws. -/
noncomputable def envelopeFlux (_ : Envelope) : Envelope :=
  FluxCertificate.ofLaws alphaFluxLaws

/-- Lema A recast as a Lawvere-style contraction. -/
noncomputable def lemmaA_as_contraction :
    Contraction EnvelopeLawvereMetric :=
  { F := envelopeFlux
    q := envelopeContractionConstant
    q_lt_one := envelopeContractionConstant_lt_one
    lip := by
      intro _ _
      simp [EnvelopeLawvereMetric, Flux.envelopeDist_eq_zero, envelopeFlux] }

end ERURH

