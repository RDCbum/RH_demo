/-
# Algebraic certificate for ERURH

This module isolates the purely algebraic manipulations used by the ERURH
programme.  It captures the numerical artefacts delivered by the tooling in a
`Certificate` record and proves that, whenever a certificate satisfies a small
collection of rational inequalities, the reported envelope constant is valid.
-/

import Mathlib
import ERURH.RationalBounds

namespace ERURH

open scoped Classical

/-- Rational bundle of constants emitted by the ERURH tooling. -/
structure Certificate where
  s0 : QBound
  lGlobal : QBound
  lClosed : QBound
  kappaLow : QBound
  kappaHigh : QBound
  kappaClosed : QBound
  cEnvelope : QBound
  cEnvelopeClosed : QBound
  epsPhi : QBound
  epsL : QBound
  epsKappa : QBound
  deriving Repr

/-- Algebraic conditions the certificate must satisfy. -/
structure CertificateHypotheses (cert : Certificate) : Prop where
  lGlobal_le_closed :
      cert.lGlobal.toRat ≤ cert.lClosed.toRat
  lClosed_lt_one :
      cert.lClosed.toRat < (1 : Rat)
  kappaLow_le_high :
      cert.kappaLow.toRat ≤ cert.kappaHigh.toRat
  kappaHigh_le_closed :
      cert.kappaHigh.toRat ≤ cert.kappaClosed.toRat
  cEnvelope_nonneg :
      0 ≤ cert.cEnvelope.toRat
  epsPhi_nonneg :
      0 ≤ cert.epsPhi.toRat
  epsL_nonneg :
      0 ≤ cert.epsL.toRat
  epsKappa_nonneg :
      0 ≤ cert.epsKappa.toRat
  envelope_closed :
      cert.cEnvelopeClosed.toRat =
        cert.cEnvelope.toRat *
          ((1 + cert.epsPhi.toRat) *
            (1 + cert.epsL.toRat) *
            (1 + cert.epsKappa.toRat))

/-- The envelope reported by the tooling is valid whenever the certificate
    satisfies the algebraic hypotheses. -/
theorem certificate_envelope_le_closed
    (cert : Certificate) (h : CertificateHypotheses cert) :
    cert.cEnvelope.toRat ≤ cert.cEnvelopeClosed.toRat := by
  classical
  set phi := cert.epsPhi.toRat
  set ell := cert.epsL.toRat
  set kap := cert.epsKappa.toRat
  set C := cert.cEnvelope.toRat

  have hphi_nonneg : 0 ≤ phi := by simpa [phi] using h.epsPhi_nonneg
  have hell_nonneg : 0 ≤ ell := by simpa [ell] using h.epsL_nonneg
  have hkap_nonneg : 0 ≤ kap := by simpa [kap] using h.epsKappa_nonneg

  have hphi_ge_one : (1 : Rat) ≤ 1 + phi := by
    simpa [phi, add_comm, add_left_comm, add_assoc]
      using add_le_add_left hphi_nonneg (1 : Rat)
  have hell_ge_one : (1 : Rat) ≤ 1 + ell := by
    simpa [ell, add_comm, add_left_comm, add_assoc]
      using add_le_add_left hell_nonneg (1 : Rat)
  have hkap_ge_one : (1 : Rat) ≤ 1 + kap := by
    simpa [kap, add_comm, add_left_comm, add_assoc]
      using add_le_add_left hkap_nonneg (1 : Rat)

  have hphi_pos : 0 ≤ 1 + phi :=
    add_nonneg (show (0 : Rat) ≤ 1 by exact zero_le_one) hphi_nonneg
  have hell_pos : 0 ≤ 1 + ell :=
    add_nonneg (show (0 : Rat) ≤ 1 by exact zero_le_one) hell_nonneg
  have hstep₂ :
      (1 : Rat) + ell ≤ (1 + phi) * (1 + ell) := by
    have := mul_le_mul_of_nonneg_right hphi_ge_one hell_pos
    simpa [phi, ell, mul_comm, mul_left_comm, mul_assoc, add_comm,
      add_left_comm, add_assoc] using this

  have hmul_ge_one :
      (1 : Rat) ≤ (1 + phi) * (1 + ell) :=
    hell_ge_one.trans hstep₂

  have hstep₃ :
      (1 + phi) * (1 + ell) ≤ (1 + phi) * (1 + ell) * (1 + kap) := by
    have :=
      mul_le_mul_of_nonneg_left hkap_ge_one
        (show 0 ≤ (1 + phi) * (1 + ell) from mul_nonneg hphi_pos hell_pos)
    simpa [phi, ell, kap, mul_comm, mul_left_comm, mul_assoc]
      using this

  have hprod_ge_one :
      (1 : Rat) ≤ (1 + phi) * (1 + ell) * (1 + kap) :=
    hmul_ge_one.trans hstep₃

  have hC_nonneg : 0 ≤ C := by simpa [C] using h.cEnvelope_nonneg

  have hclosed_expr :
      cert.cEnvelopeClosed.toRat =
        C * ((1 + phi) * (1 + ell) * (1 + kap)) := by
    simpa [phi, ell, kap, C, mul_comm, mul_left_comm, mul_assoc]
      using h.envelope_closed

  have hgoal :
      C ≤ C * ((1 + phi) * (1 + ell) * (1 + kap)) :=
    by simpa [mul_comm, mul_left_comm, mul_assoc]
      using mul_le_mul_of_nonneg_left hprod_ge_one hC_nonneg

  simpa [hclosed_expr] using hgoal

end ERURH
