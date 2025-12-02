/-

# ERURH weighted norms



This module exposes the minimal algebraic scaffolding for the ERURH proofs.

All constants are imported from `rational_bounds.lean`, hence every argument

remains fully rational (no floating-point evaluation).

-/



import Mathlib.Data.Rat.Init
import ERURH.RationalBounds


namespace ERURH



/-- Compact record for weighted $L^2$ bands with rational thresholds. -/

structure WeightedBand where

  threshold : QBound

  weight_ratio : QBound

  deriving Repr



/-- Analytic band used by Lema A (contraction). -/

def analyticBand : WeightedBand :=

  { threshold := s0Closed, weight_ratio := maxWOverMinW }



/-- Energy band used by Lema B (weighted book inequality). -/

def energyBand : WeightedBand :=

  { threshold := s0Closed, weight_ratio := weightMax }



@[simp] theorem threshold_positive (band : WeightedBand) :

    0 < band.threshold.den := by

  cases band with

  | mk t _ =>

      simpa using t.den_pos



@[simp] theorem ratio_positive (band : WeightedBand) :

    0 < band.weight_ratio.den := by

  cases band with

  | mk _ w =>

      simpa using w.den_pos



/-- Helper converting any rational bound into a rational number. -/

@[simp] def WeightedBand.contraction (band : WeightedBand) : Rat :=

  band.weight_ratio.toRat



/-- Helper converting thresholds into rationals. -/

@[simp] def WeightedBand.thresholdRat (band : WeightedBand) : Rat :=

  band.threshold.toRat



end ERURH



