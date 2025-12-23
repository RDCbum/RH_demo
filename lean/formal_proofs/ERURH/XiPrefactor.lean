import Mathlib
import ERURH.XiCore
import ERURH.BridgeScaffold
import ERURH.ComplexAbsCompat


noncomputable section

namespace ERURH

open Complex Real

/-- Adding a non-negative pad to the right-hand side preserves an inequality. -/
lemma pad_add_le_right {a b c : ℝ} (h : a ≤ b) (hc : 0 ≤ c) :
    a ≤ b + c := h.trans (le_add_of_nonneg_right hc)

/-- If `f t ≤ B t` and the pad is non-negative on the tail, then `f t ≤ B t + pad t`. -/
lemma tail_pad_le
    {f B pad : ℝ → ℝ} {T : ℝ}
    (hpad : ∀ ⦃t⦄, T ≤ t → 0 ≤ pad t)
    (h : ∀ ⦃t⦄, T ≤ t → f t ≤ B t) :
    ∀ ⦃t⦄, T ≤ t → f t ≤ B t + pad t := by
  intro t ht
  exact pad_add_le_right (h ht) (hpad ht)

/-- Specialisation of `list_mem_le_sum` to a mapped list of rationals. -/
lemma map_list_mem_le_sum {β : Type*} (f : β → ℚ) (l : List β)
    {w : β} (hw : w ∈ l)
    (hpos : ∀ y ∈ l.map f, 0 ≤ y) :
    f w ≤ (l.map f).sum := by
  classical
  induction l with
  | nil => cases hw
  | cons hd tl ih =>
      have hhd : 0 ≤ f hd := hpos _ (by simp)
      have hpos_tl : ∀ y ∈ tl.map f, 0 ≤ y := by
        intro y hy
        exact hpos _ (by simp [hy])
      have hx_cons : w = hd ∨ w ∈ tl := by
        simpa [List.mem_cons] using hw
      cases hx_cons with
      | inl h =>
          subst h
          have hsum_nonneg : 0 ≤ (tl.map f).sum := List.sum_nonneg hpos_tl
          have hgoal : f w ≤ f w + (tl.map f).sum :=
            le_add_of_nonneg_right hsum_nonneg
          simpa [List.map_cons, List.sum_cons, add_comm, add_left_comm, add_assoc]
            using hgoal
      | inr hx_tl =>
          have hineq := ih hx_tl hpos_tl
          have : (tl.map f).sum ≤ f hd + (tl.map f).sum :=
            le_add_of_nonneg_left hhd
          exact hineq.trans
            (by simpa [List.map_cons, List.sum_cons, add_comm, add_left_comm, add_assoc]
              using this)

/-- Witness controlling `λ(s)` on the critical line.  The fields `pf_*` encode the 
non-negative cushions that must be added to the prefactor bounds: `pf_log_q` bounds 
``log |(s (1 - s)) / 2|`` on each window (and similarly for the tail), while `pf_j_q`
controls the contribution of the derivative ratio.  Since the rational prefactor has 
zero real contribution on the critical line, `pf_j_q` typically absorbs only the 
λ-term (plus any extra slack introduced by the witness). -/
structure LambdaWitness (B : ERUBridge)
    (cover : WindowCoverCertificate B) where
  logBound : ℝ → ℝ
  argBound : ℝ → ℝ
  win_log_lambda :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        Real.log (Complex.abs (lambdaCore (crit t))) ≤ logBound t
  win_Re_lambda :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        _root_.abs (((deriv lambdaCore) (crit t) / lambdaCore (crit t)).re) ≤ argBound t
  tail_log_lambda :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      Real.log (Complex.abs (lambdaCore (crit t))) ≤ logBound t
  tail_Re_lambda :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      _root_.abs (((deriv lambdaCore) (crit t) / lambdaCore (crit t)).re) ≤ argBound t
  pf_log_q : Window → ℚ
  pf_j_q : Window → ℚ
  pf_tail_log : ℝ → ℝ
  pf_tail_arg : ℝ → ℝ
  win_log_prefactor :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        Real.log (Complex.abs (prefactor (crit t))) ≤
          logBound t + ((pf_log_q w : ℚ) : ℝ)
  win_Re_prefactor :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        _root_.abs (((deriv prefactor) (crit t) / prefactor (crit t)).re) ≤
          argBound t + ((pf_j_q w : ℚ) : ℝ)
  tail_log_prefactor :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      Real.log (Complex.abs (prefactor (crit t))) ≤
        logBound t + pf_tail_log t
  tail_Re_prefactor :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      _root_.abs (((deriv prefactor) (crit t) / prefactor (crit t)).re) ≤
        argBound t + pf_tail_arg t
  pf_log_q_nonneg : ∀ w, 0 ≤ pf_log_q w
  pf_j_q_nonneg : ∀ w, 0 ≤ pf_j_q w
  pf_tail_log_nonneg : ∀ t, 0 ≤ pf_tail_log t
  pf_tail_arg_nonneg : ∀ t, 0 ≤ pf_tail_arg t

/-- Convenience constructor packaging window/tail bounds expressed via rational
    constants together with the prefactor pads.  The hypotheses `h_*` are the
    certified inequalities delivered by the numerical pipeline; the function
    collapses them into the `LambdaWitness` interface by promoting the rational
    bounds to constant real-valued envelopes. -/
noncomputable def LambdaWitness.ofBounds
    {B : ERUBridge} {cover : WindowCoverCertificate B}
    (lamLogQ lamJQ : Window → ℚ)
    (lamLogTail lamJTail lamLogSup lamJSup : ℚ)
    (pfLogQ pfJQ : Window → ℚ)
    (pfTailLog pfTailArg : ℝ → ℝ)
    (h_win_log_lambda :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          Real.log (Complex.abs (lambdaCore (crit t))) ≤
            ((lamLogQ w : ℚ) : ℝ))
    (h_win_Re_lambda :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          _root_.abs (((deriv lambdaCore) (crit t) / lambdaCore (crit t)).re) ≤
            ((lamJQ w : ℚ) : ℝ))
    (h_tail_log_lambda :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        Real.log (Complex.abs (lambdaCore (crit t))) ≤
          ((lamLogTail : ℚ) : ℝ))
    (h_tail_Re_lambda :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        _root_.abs (((deriv lambdaCore) (crit t) / lambdaCore (crit t)).re) ≤
          ((lamJTail : ℚ) : ℝ))
    (h_log_dom :
      ∀ w, lamLogQ w ≤ lamLogSup)
    (h_tail_log_dom : lamLogTail ≤ lamLogSup)
    (h_j_dom :
      ∀ w, lamJQ w ≤ lamJSup)
    (h_tail_j_dom : lamJTail ≤ lamJSup)
    (h_pf_log_q_nonneg : ∀ w, 0 ≤ pfLogQ w)
    (h_pf_j_q_nonneg : ∀ w, 0 ≤ pfJQ w)
    (h_pf_tail_log_nonneg : ∀ t, 0 ≤ pfTailLog t)
    (h_pf_tail_arg_nonneg : ∀ t, 0 ≤ pfTailArg t)
    (h_win_log_prefactor :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          Real.log (Complex.abs (prefactor (crit t))) ≤
            ((lamLogSup : ℚ) : ℝ) + ((pfLogQ w : ℚ) : ℝ))
    (h_win_Re_prefactor :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          _root_.abs (((deriv prefactor) (crit t) / prefactor (crit t)).re) ≤
            ((lamJSup : ℚ) : ℝ) + ((pfJQ w : ℚ) : ℝ))
    (h_tail_log_prefactor :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        Real.log (Complex.abs (prefactor (crit t))) ≤
          ((lamLogSup : ℚ) : ℝ) + pfTailLog t)
    (h_tail_Re_prefactor :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        _root_.abs (((deriv prefactor) (crit t) / prefactor (crit t)).re) ≤
          ((lamJSup : ℚ) : ℝ) + pfTailArg t) :
    LambdaWitness B cover := by
  classical
  refine
    { logBound := fun _ => ((lamLogSup : ℚ) : ℝ)
      , argBound := fun _ => ((lamJSup : ℚ) : ℝ)
      , win_log_lambda := ?_
      , win_Re_lambda := ?_
      , tail_log_lambda := ?_
      , tail_Re_lambda := ?_
      , pf_log_q := pfLogQ
      , pf_j_q := pfJQ
      , pf_tail_log := pfTailLog
      , pf_tail_arg := pfTailArg
      , win_log_prefactor := ?_
      , win_Re_prefactor := ?_
      , tail_log_prefactor := ?_
      , tail_Re_prefactor := ?_
      , pf_log_q_nonneg := h_pf_log_q_nonneg
      , pf_j_q_nonneg := h_pf_j_q_nonneg
      , pf_tail_log_nonneg := h_pf_tail_log_nonneg
      , pf_tail_arg_nonneg := h_pf_tail_arg_nonneg }
  · intro w hw t ht
    have h_base := h_win_log_lambda hw ht
    have h_dom : ((lamLogQ w : ℚ) : ℝ) ≤ ((lamLogSup : ℚ) : ℝ) := by
      exact_mod_cast h_log_dom w
    exact h_base.trans h_dom
  · intro w hw t ht
    have h_base := h_win_Re_lambda hw ht
    have h_dom : ((lamJQ w : ℚ) : ℝ) ≤ ((lamJSup : ℚ) : ℝ) := by
      exact_mod_cast h_j_dom w
    exact h_base.trans h_dom
  · intro t ht
    have h_base := h_tail_log_lambda ht
    have h_dom : ((lamLogTail : ℚ) : ℝ) ≤ ((lamLogSup : ℚ) : ℝ) := by
      exact_mod_cast h_tail_log_dom
    exact h_base.trans h_dom
  · intro t ht
    have h_base := h_tail_Re_lambda ht
    have h_dom : ((lamJTail : ℚ) : ℝ) ≤ ((lamJSup : ℚ) : ℝ) := by
      exact_mod_cast h_tail_j_dom
    exact h_base.trans h_dom
  · intro w hw t ht
    simpa using h_win_log_prefactor hw ht
  · intro w hw t ht
    simpa using h_win_Re_prefactor hw ht
  · intro t ht
    simpa using h_tail_log_prefactor ht
  · intro t ht
    simpa using h_tail_Re_prefactor ht

/-- Aggregated witness for the prefactor across the main windows and the tail region. -/
structure PrefactorWitnessOn (B : ERUBridge)
    (cover : WindowCoverCertificate B) where
  pf_log_q : Window → ℚ
  pf_j_q : Window → ℚ
  logBound : ℝ → ℝ
  argBound : ℝ → ℝ
  win_log_prefactor :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        Real.log (Complex.abs (prefactor (crit t))) ≤ logBound t
  tail_log_prefactor :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      Real.log (Complex.abs (prefactor (crit t))) ≤ logBound t
  win_Re_prefactor :
    ∀ {w : Window} (_ : w ∈ cover.windows)
      {t : ℝ}, t ∈ w.IccR →
        _root_.abs (((deriv prefactor) (crit t) / prefactor (crit t)).re) ≤ argBound t
  tail_Re_prefactor :
    ∀ {t : ℝ}, cover.tailStartR ≤ t →
      _root_.abs (((deriv prefactor) (crit t) / prefactor (crit t)).re) ≤ argBound t

/-- Build a prefactor witness from a lambda witness by aggregating the rational window
contributions and carrying over the tail padding.  Non-negativity of the pads guarantees
that the resulting bounds are at least as strong as the original ones. -/
noncomputable def PrefactorWitnessOn.ofLambda
    {B : ERUBridge} {cover : WindowCoverCertificate B}
    (lam : LambdaWitness B cover) :
    PrefactorWitnessOn B cover := by
  classical
  let logPadQ : ℚ := (List.map lam.pf_log_q cover.windows).sum
  let logPad : ℝ := (logPadQ : ℝ)
  let argPadQ : ℚ := (List.map lam.pf_j_q cover.windows).sum
  let argPad : ℝ := (argPadQ : ℝ)
  have h_log_nonneg :
      ∀ u ∈ List.map lam.pf_log_q cover.windows, (0 : ℚ) ≤ u := by
    intro u hu
    obtain ⟨w, _hw, rfl⟩ := List.mem_map.1 hu
    simpa using lam.pf_log_q_nonneg w
  have h_arg_nonneg :
      ∀ u ∈ List.map lam.pf_j_q cover.windows, (0 : ℚ) ≤ u := by
    intro u hu
    obtain ⟨w, _hw, rfl⟩ := List.mem_map.1 hu
    simpa using lam.pf_j_q_nonneg w
  have logPad_nonneg : 0 ≤ logPad := by
    have : ((0 : ℚ) : ℝ) ≤ (logPadQ : ℝ) := by
      exact_mod_cast (List.sum_nonneg h_log_nonneg)
    simpa [logPad] using this
  have argPad_nonneg : 0 ≤ argPad := by
    have : ((0 : ℚ) : ℝ) ≤ (argPadQ : ℝ) := by
      exact_mod_cast (List.sum_nonneg h_arg_nonneg)
    simpa [argPad] using this
  have logPad_dominates :
      ∀ {w : Window} (_ : w ∈ cover.windows),
        ((lam.pf_log_q w : ℚ) : ℝ) ≤ logPad := by
    intro w hw
    have hx := map_list_mem_le_sum lam.pf_log_q cover.windows hw h_log_nonneg
    have hx' : ((lam.pf_log_q w : ℚ) : ℝ) ≤ ((logPadQ : ℚ) : ℝ) := by
      exact_mod_cast hx
    simpa [logPad] using hx'
  have argPad_dominates :
      ∀ {w : Window} (_ : w ∈ cover.windows),
        ((lam.pf_j_q w : ℚ) : ℝ) ≤ argPad := by
    intro w hw
    have hx := map_list_mem_le_sum lam.pf_j_q cover.windows hw h_arg_nonneg
    have hx' : ((lam.pf_j_q w : ℚ) : ℝ) ≤ ((argPadQ : ℚ) : ℝ) := by
      exact_mod_cast hx
    simpa [argPad] using hx'
  refine
    { pf_log_q := lam.pf_log_q
      , pf_j_q := lam.pf_j_q
      , logBound := fun t => lam.logBound t + lam.pf_tail_log t + logPad
      , argBound := fun t => lam.argBound t + lam.pf_tail_arg t + argPad
      , win_log_prefactor := ?_
      , tail_log_prefactor := ?_
      , win_Re_prefactor := ?_
      , tail_Re_prefactor := ?_ }
  · intro w hw t ht
    have h_base := lam.win_log_prefactor (w := w) (t := t) hw ht
    have h_upper :
        lam.logBound t + ((lam.pf_log_q w : ℚ) : ℝ) ≤
          lam.logBound t + logPad := add_le_add_left (logPad_dominates hw) _
    have h_step := h_base.trans h_upper
    have h_final := pad_add_le_right h_step (lam.pf_tail_log_nonneg t)
    simpa [add_comm, add_left_comm, add_assoc] using h_final
  · intro t ht
    have h_base := lam.tail_log_prefactor ht
    have h_final := pad_add_le_right h_base logPad_nonneg
    simpa [add_comm, add_left_comm, add_assoc] using h_final
  · intro w hw t ht
    have h_base := lam.win_Re_prefactor (w := w) (t := t) hw ht
    have h_upper :
        lam.argBound t + ((lam.pf_j_q w : ℚ) : ℝ) ≤
          lam.argBound t + argPad := add_le_add_left (argPad_dominates hw) _
    have h_step := h_base.trans h_upper
    have h_final := pad_add_le_right h_step (lam.pf_tail_arg_nonneg t)
    simpa [add_comm, add_left_comm, add_assoc] using h_final
  · intro t ht
    have h_base := lam.tail_Re_prefactor ht
    have h_final := pad_add_le_right h_base argPad_nonneg
    simpa [add_comm, add_left_comm, add_assoc] using h_final

end ERURH

end
