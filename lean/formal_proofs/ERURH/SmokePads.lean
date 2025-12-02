import Mathlib
import ERURH.BridgeScaffold

namespace ERURH
namespace Smoke

open Classical

noncomputable section

/-- Aggregated rational pads contributed by the prefactor, lambda, and zeta
    components on each window and on the tail segment.  These are the raw
    constants produced by the bound generators; no analytic inequalities are
    asserted here. -/
structure PadsOn (B : ERUBridge) (cover : WindowCoverCertificate B) where
  pf_log_q   : Window → ℚ
  lam_log_q  : Window → ℚ
  zet_log_q  : Window → ℚ
  pf_j_q     : Window → ℚ
  lam_j_q    : Window → ℚ
  zet_j_q    : Window → ℚ
  pf_tail_log : ℚ
  lam_tail_log : ℚ
  zet_tail_log : ℚ
  pf_tail_j   : ℚ
  lam_tail_j  : ℚ
  zet_tail_j  : ℚ

/-- Piecewise real envelope obtained by summing the logarithmic pads on each
    window and on the tail region.  This smoketest helper only assembles the
    rational constants into an `ℝ → ℝ` function; it does not claim any analytic
    inequality about `ξ`. -/
noncomputable def logEnvOfPads
    {B : ERUBridge} {cover : WindowCoverCertificate B}
    (pads : PadsOn B cover) : ℝ → ℝ :=
  fun t =>
    if h : ∃ w ∈ cover.windows, t ∈ w.IccR then
      let w := Classical.choose h
      let _hw : w ∈ cover.windows := (Classical.choose_spec h).1
      algebraMap ℚ ℝ
        (pads.pf_log_q w + pads.lam_log_q w + pads.zet_log_q w)
    else
      algebraMap ℚ ℝ
        (pads.pf_tail_log + pads.lam_tail_log + pads.zet_tail_log)

/-- Piecewise real envelope for the derivative pads.  As with `logEnvOfPads`,
    this only encodes the algebraic summation of the pads and carries no
    analytic content. -/
noncomputable def jEnvOfPads
    {B : ERUBridge} {cover : WindowCoverCertificate B}
    (pads : PadsOn B cover) : ℝ → ℝ :=
  fun t =>
    if h : ∃ w ∈ cover.windows, t ∈ w.IccR then
      let w := Classical.choose h
      let _hw : w ∈ cover.windows := (Classical.choose_spec h).1
      algebraMap ℚ ℝ
        (pads.pf_j_q w + pads.lam_j_q w + pads.zet_j_q w)
    else
      algebraMap ℚ ℝ
        (pads.pf_tail_j + pads.lam_tail_j + pads.zet_tail_j)

end
end ERURH
