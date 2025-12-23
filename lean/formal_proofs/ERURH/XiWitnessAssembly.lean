import Mathlib
import ERURH.XiCore
import ERURH.XiPrefactor
import ERURH.XiZetaIface
import ERURH.BoundsConfig
import ERURH.AnalyticWitness
import ERURH.ComplexAbsCompat

noncomputable section

namespace ERURH

/-- Assemble the global analytic witness for `xiClassic` from prefactor and zeta witnesses.
The proof proceeds window-by-window: on each main window we absorb the rational pads contributed
by the prefactor and zeta data, and on the tail we sum the corresponding tail cushions.  Once the
local estimates are obtained, they are pushed onto the bridge envelopes. -/
def XiWitness.ofPrefactorZeta
  {B : ERUBridge} {Ω : Set Complex}
  (cover : WindowCoverCertificate B)
  (analytic : XiAnalytic xiClassic Ω)
  (pf : PrefactorWitnessOn B cover)
  (lam : LambdaWitness B cover)
  (zw : ZetaWitness B cover)
  (log_total_main :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR → t ≤ ERURH.boundsTcapReal →
        Real.log (Complex.abs (xiClassic (crit t))) ≤
          pf.logBound t +
            ((pf.pf_log_q w : ℚ) : ℝ) +
            ((zw.ζ_log_q w : ℚ) : ℝ))
  (log_total_tail :
    ∀ {t : ℝ}, cover.tailStartR ≤ t → t ≤ ERURH.boundsTcapReal →
      Real.log (Complex.abs (xiClassic (crit t))) ≤
        pf.logBound t + lam.pf_tail_log t + ((zw.ζ_log_tail : ℚ) : ℝ))
  (log_to_bridge_main :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR → t ≤ ERURH.boundsTcapReal →
        pf.logBound t +
            ((pf.pf_log_q w : ℚ) : ℝ) +
            ((zw.ζ_log_q w : ℚ) : ℝ) ≤
          B.logR t)
  (log_to_bridge_tail :
    ∀ {t : ℝ}, cover.tailStartR ≤ t → t ≤ ERURH.boundsTcapReal →
      pf.logBound t + lam.pf_tail_log t + ((zw.ζ_log_tail : ℚ) : ℝ) ≤ B.logR t)
  (arg_total : ∀ {a b : Real}, B.s0R ≤ a → a ≤ b →
      abs (Complex.arg (xiClassic (crit b)) - Complex.arg (xiClassic (crit a))) ≤
        (pf.argBound b - pf.argBound a) + (zw.argBound b - zw.argBound a))
  (arg_to_bridge : ∀ {a b : Real}, B.s0R ≤ a → a ≤ b →
      (pf.argBound b - pf.argBound a) + (zw.argBound b - zw.argBound a) ≤
        B.jRel b - B.jRel a) :
  XiWitness B xiClassic :=
{ Ω := Ω
  , analytic := analytic
  , log_bound := by
      intro t ht hcap
      classical
      by_cases htail : cover.tailStartR ≤ t
      · have h_total := log_total_tail (t := t) htail hcap
        have h_bridge := log_to_bridge_tail (t := t) htail hcap
        exact h_total.trans h_bridge
      · have ht_lt : t < cover.tailStartR := lt_of_not_ge htail
        have ht_tail :
            t < algebraMap ℚ ℝ cover.tail_start := by
          simpa [WindowCoverCertificate.tailStartR] using ht_lt
        obtain ⟨w, hw, ht_mem⟩ :=
          cover.cover_main (x := t) ht ht_tail
        have h_total :=
          log_total_main (w := w) hw (t := t) ht_mem hcap
        have h_bridge :=
          log_to_bridge_main (w := w) hw (t := t) ht_mem hcap
        exact h_total.trans h_bridge
  , arg_variation := by
      intro a b ha hab
      exact (arg_total ha hab).trans (arg_to_bridge ha hab) }

end ERURH

end
