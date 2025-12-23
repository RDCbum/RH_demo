import Mathlib
import ERURH.XiCore
import ERURH.BridgeScaffold
import ERURH.BoundsConfig
import ERURH.ComplexAbsCompat

namespace ERURH

open Complex Real

noncomputable def zeta_log_fun (t : ℝ) : ℝ :=
  Real.log (Complex.abs (riemannZeta (crit t)))

noncomputable def zeta_j_fun (t : ℝ) : ℝ :=
  _root_.abs (((deriv riemannZeta) (crit t) / riemannZeta (crit t)).re)


/-- Witness interface capturing per-window and tail bounds for
    `log |ζ(1/2 + it)|` and the logarithmic derivative of `ζ` on the critical line.
    The constants `ζ_*` represent the non-negative cushions that complement the
    prefactor pads when assembling the global `ξ` witness. -/
structure ZetaWitness (B : ERUBridge)
    (cover : WindowCoverCertificate B) where
  logBound : ℝ → ℝ
  argBound : ℝ → ℝ
  ζ_log_q : Window → ℚ
  ζ_j_q : Window → ℚ
  ζ_log_tail : ℚ
  ζ_j_tail : ℚ
  win_log :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        Real.log (Complex.abs (riemannZeta (crit t))) ≤
          ((ζ_log_q w : ℚ) : ℝ)
  win_j :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        _root_.abs
            (((deriv riemannZeta) (crit t) /
                riemannZeta (crit t)).re) ≤
          ((ζ_j_q w : ℚ) : ℝ)
  tail_log :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      Real.log (Complex.abs (riemannZeta (crit t))) ≤
        ((ζ_log_tail : ℚ) : ℝ)
  tail_j :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      _root_.abs
          (((deriv riemannZeta) (crit t) /
              riemannZeta (crit t)).re) ≤
        ((ζ_j_tail : ℚ) : ℝ)
  log_spec_on :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
      zeta_log_fun t ≤ logBound t
  j_spec_on :
    ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
      zeta_j_fun t ≤ argBound t
  ζ_log_q_nonneg : ∀ w, 0 ≤ ζ_log_q w
  ζ_j_q_nonneg : ∀ w, 0 ≤ ζ_j_q w
  ζ_log_tail_nonneg : 0 ≤ ζ_log_tail
  ζ_j_tail_nonneg : 0 ≤ ζ_j_tail

noncomputable def ZetaWitness.ofBounds
    {B : ERUBridge} {cover : WindowCoverCertificate B}
    (logBound argBound : ℝ → ℝ)
    (ζLogQ ζJQ : Window → ℚ)
    (ζLogTail ζJTail : ℚ)
    (h_win_log :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          Real.log (Complex.abs (riemannZeta (crit t))) ≤
            ((ζLogQ w : ℚ) : ℝ))
    (h_win_j :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          _root_.abs (((deriv riemannZeta) (crit t) /
              riemannZeta (crit t)).re) ≤
            ((ζJQ w : ℚ) : ℝ))
    (h_tail_log :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        Real.log (Complex.abs (riemannZeta (crit t))) ≤
          ((ζLogTail : ℚ) : ℝ))
    (h_tail_j :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        _root_.abs (((deriv riemannZeta) (crit t) /
            riemannZeta (crit t)).re) ≤
          ((ζJTail : ℚ) : ℝ))
    (h_log_spec_on :
      ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
        zeta_log_fun t ≤ logBound t)
    (h_j_spec_on :
      ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
        zeta_j_fun t ≤ argBound t)
    (h_log_q_nonneg : ∀ w, 0 ≤ ζLogQ w)
    (h_j_q_nonneg : ∀ w, 0 ≤ ζJQ w)
    (h_log_tail_nonneg : 0 ≤ ζLogTail)
    (h_j_tail_nonneg : 0 ≤ ζJTail) :
    ZetaWitness B cover :=
  { logBound := logBound
    , argBound := argBound
    , ζ_log_q := ζLogQ
    , ζ_j_q := ζJQ
    , ζ_log_tail := ζLogTail
    , ζ_j_tail := ζJTail
    , win_log := by
        intro w hw t ht
        exact h_win_log hw ht
    , win_j := by
        intro w hw t ht
        exact h_win_j hw ht
    , tail_log := by
        intro t ht
        exact h_tail_log ht
    , tail_j := by
        intro t ht
        exact h_tail_j ht
    , log_spec_on := by
        intro t ht hcap
        exact h_log_spec_on ht hcap
    , j_spec_on := by
        intro t ht hcap
        exact h_j_spec_on ht hcap
    , ζ_log_q_nonneg := h_log_q_nonneg
    , ζ_j_q_nonneg := h_j_q_nonneg
    , ζ_log_tail_nonneg := h_log_tail_nonneg
    , ζ_j_tail_nonneg := h_j_tail_nonneg }

end ERURH
