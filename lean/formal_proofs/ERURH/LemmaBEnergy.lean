/-

# Lema B (energy control)



Lean stub exposing the rational energy constraints used by the tooling.

-/



import Mathlib.Data.Rat.Init

import Mathlib.Tactic

import ERURH.WeightedBands
import ERURH.Flux.LawvereMetric



namespace ERURH



@[simp] theorem lemmaB_band_bounds :

    kappaLowFormalRat <= kappaHighFormalRat := by

  native_decide



@[simp] theorem lemmaB_closed_bound :

    kappaHighFormalRat <= kappaBookClosedRat := by

  native_decide



/-- Combined energy inequality. -/

theorem lemmaB_energy :

    kappaLowFormalRat <= kappaBookClosedRat :=

  calc

    kappaLowFormalRat <= kappaHighFormalRat := lemmaB_band_bounds

    _ <= kappaBookClosedRat := lemmaB_closed_bound



@[simp] theorem lemmaB_threshold :

    energyBand.threshold.toRat <= s0ClosedRat := by

  native_decide



open Flux

/-- Wrapper linking the energy control to the placeholder envelope distance. -/
lemma energy_controls_envelopeDist
    (E₁ E₂ : Flux.Envelope) :
    Flux.envelopeDist E₁ E₂ = 0 := by
  simp [Flux.envelopeDist_eq_zero]

end ERURH

