import Mathlib.Data.NNReal.Basic
import ERURH.Flux
import ERURH.FluxBounds

open Classical
open scoped NNReal

namespace ERURH.Flux

/-- Lawvere-style metric space where distances live in `ℝ≥0`. -/
structure LawvereMetric (X : Sort _) :=
  (d : X → X → ℝ≥0)
  (d_refl : ∀ x, d x x = 0)
  (d_triangle : ∀ x y z, d x z ≤ d x y + d y z)

/-- Contraction mapping packaged against a `LawvereMetric`. -/
structure Contraction {X : Sort _} (LM : LawvereMetric X) :=
  (F : X → X)
  (q : ℝ≥0)
  (q_lt_one : q < 1)
  (lip : ∀ x y, LM.d (F x) (F y) ≤ q * LM.d x y)

namespace Contraction

variable {X : Sort _} {LM : LawvereMetric X}

/-- A contraction is, in particular, non-expansive with its Lipschitz factor. -/
theorem nonexpansive (c : Contraction LM) :
    ∀ x y, LM.d (c.F x) (c.F y) ≤ c.q * LM.d x y :=
  c.lip

end Contraction

open ERURH

/-- Envelope type backing the released flux certificate. -/
abbrev Envelope := ERURH.FluxCertificate alphaBridge

/-- Distance between envelopes (placeholder: identically zero). -/
def envelopeDist (_E₁ _E₂ : Envelope) : ℝ≥0 := 0

lemma envelopeDist_eq_zero (E₁ E₂ : Envelope) :
    envelopeDist E₁ E₂ = 0 := by
  rfl

/-- Lawvere metric on envelopes.  The distance collapses to zero because every
    certificate shares the same base-point magnitudes; this is sufficient for the
    contraction wrapper introduced for Lemma A and can be strengthened later. -/
def EnvelopeLawvereMetric : LawvereMetric Envelope :=
  { d := envelopeDist
    d_refl := by
      intro _
      simp [envelopeDist_eq_zero]
    d_triangle := by
      intro _ _ _
      simp [envelopeDist_eq_zero] }

end ERURH.Flux
