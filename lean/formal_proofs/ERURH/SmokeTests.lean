import ERURH
import ERURH.FluxWindows
import ERURH.LambdaBounds
import ERURH.ZetaBounds
import ERURH.BoundsConfig
import ERURH.SmokePads
import ERURH.ComplexAbsCompat

noncomputable section

open ERURH

example : True := by
  classical
  let B : ERUBridge := AlphaBridge
  have hS0 : B.s0 = s0Bridge := by
    simpa [B, AlphaBridge] using alphaBridge_s0
  let cover := alphaCoverCertificate B hS0
  let pads :
      ERURH.Smoke.PadsOn B cover :=
    { pf_log_q := fun _ => 0
      , lam_log_q := lam_log_q
      , zet_log_q := zeta_log_q
      , pf_j_q := fun _ => 0
      , lam_j_q := lam_j_q
      , zet_j_q := zeta_j_q
      , pf_tail_log := 0
      , lam_tail_log := lam_log_tail
      , zet_tail_log := zeta_log_tail
      , pf_tail_j := 0
      , lam_tail_j := lam_j_tail
      , zet_tail_j := zeta_j_tail }
  let logEnv := ERURH.Smoke.logEnvOfPads (cover := cover) pads
  let jEnv := ERURH.Smoke.jEnvOfPads (cover := cover) pads
  -- Touch the assembled envelopes at representative points (window interior / tail).
  have _ := logEnv (cover.tailStartR)
  have _ := jEnv (cover.tailStartR)
  exact trivial

section WitnessPipeline

variable {B : ERUBridge} {cover : WindowCoverCertificate B}

/-- Structural smoke: composing `LambdaWitness.ofBounds`, `PrefactorWitnessOn.ofLambda`,
and `ZetaWitness.ofBounds` feeds `XiWitness.ofPrefactorZeta` once the analytic
inequalities are available.  All analytical hypotheses are abstracted as
parameters so that the construction type-checks without additional proofs. -/
example
    (lamLogQ lamJQ : Window → ℚ)
    (lamLogTail lamJTail lamLogSup lamJSup : ℚ)
    (pfLogQ pfJQ : Window → ℚ)
    (pfTailLog pfTailArg : ℝ → ℝ)
    (ζLogQ ζJQ : Window → ℚ)
    (ζLogTail ζJTail : ℚ)
    (logBound argBound : ℝ → ℝ)
    (analytic : XiAnalytic xiClassic xiAnalyticDomain)
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
        Real.log (Complex.abs (lambdaCore (crit t))) ≤ ((lamLogTail : ℚ) : ℝ))
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
          ((lamJSup : ℚ) : ℝ) + pfTailArg t)
    (h_win_log_zeta :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          Real.log (Complex.abs (riemannZeta (crit t))) ≤
            ((ζLogQ w : ℚ) : ℝ))
    (h_win_j_zeta :
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          _root_.abs (((deriv riemannZeta) (crit t) / riemannZeta (crit t)).re) ≤
            ((ζJQ w : ℚ) : ℝ))
    (h_tail_log_zeta :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        Real.log (Complex.abs (riemannZeta (crit t))) ≤ ((ζLogTail : ℚ) : ℝ))
    (h_tail_j_zeta :
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        _root_.abs (((deriv riemannZeta) (crit t) / riemannZeta (crit t)).re) ≤
          ((ζJTail : ℚ) : ℝ))
    (h_log_spec_on :
      ∀ {t : ℝ}, B.s0R ≤ t → t ≤ ERURH.boundsTcapReal →
        Real.log (Complex.abs (riemannZeta (crit t))) ≤ logBound t)
    (h_arg_spec :
      ∀ {a b : ℝ}, B.s0R ≤ a → a ≤ b →
        _root_.abs (Complex.arg (riemannZeta (crit b)) -
          Complex.arg (riemannZeta (crit a))) ≤ argBound b - argBound a)
    (ζ_log_q_nonneg : ∀ w, 0 ≤ ζLogQ w)
    (ζ_j_q_nonneg : ∀ w, 0 ≤ ζJQ w)
    (ζ_log_tail_nonneg : 0 ≤ ζLogTail)
    (ζ_j_tail_nonneg : 0 ≤ ζJTail)
    (log_total_main :
      let lam :=
        LambdaWitness.ofBounds
          (lamLogQ := lamLogQ)
          (lamJQ := lamJQ)
          (lamLogTail := lamLogTail)
          (lamJTail := lamJTail)
          (lamLogSup := lamLogSup)
          (lamJSup := lamJSup)
          (pfLogQ := pfLogQ)
          (pfJQ := pfJQ)
          (pfTailLog := pfTailLog)
          (pfTailArg := pfTailArg)
          h_win_log_lambda
          h_win_Re_lambda
          h_tail_log_lambda
          h_tail_Re_lambda
          h_log_dom
          h_tail_log_dom
          h_j_dom
          h_tail_j_dom
          h_pf_log_q_nonneg
          h_pf_j_q_nonneg
          h_pf_tail_log_nonneg
          h_pf_tail_arg_nonneg
          h_win_log_prefactor
          h_win_Re_prefactor
          h_tail_log_prefactor
          h_tail_Re_prefactor
      let pf := PrefactorWitnessOn.ofLambda (lam := lam)
      let zw :=
        ZetaWitness.ofBounds
          (logBound := logBound)
          (argBound := argBound)
          (ζLogQ := ζLogQ)
          (ζJQ := ζJQ)
          (ζLogTail := ζLogTail)
          (ζJTail := ζJTail)
          h_win_log_zeta
          h_win_j_zeta
          h_tail_log_zeta
          h_tail_j_zeta
          h_log_spec_on
          h_arg_spec
          ζ_log_q_nonneg
          ζ_j_q_nonneg
          ζ_log_tail_nonneg
          ζ_j_tail_nonneg
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR → t ≤ ERURH.boundsTcapReal →
          Real.log (Complex.abs (xiClassic (crit t))) ≤
            pf.logBound t +
              ((pf.pf_log_q w : ℚ) : ℝ) +
              ((zw.ζ_log_q w : ℚ) : ℝ))
    (log_total_tail :
      let lam :=
        LambdaWitness.ofBounds
          (lamLogQ := lamLogQ)
          (lamJQ := lamJQ)
          (lamLogTail := lamLogTail)
          (lamJTail := lamJTail)
          (lamLogSup := lamLogSup)
          (lamJSup := lamJSup)
          (pfLogQ := pfLogQ)
          (pfJQ := pfJQ)
          (pfTailLog := pfTailLog)
          (pfTailArg := pfTailArg)
          h_win_log_lambda
          h_win_Re_lambda
          h_tail_log_lambda
          h_tail_Re_lambda
          h_log_dom
          h_tail_log_dom
          h_j_dom
          h_tail_j_dom
          h_pf_log_q_nonneg
          h_pf_j_q_nonneg
          h_pf_tail_log_nonneg
          h_pf_tail_arg_nonneg
          h_win_log_prefactor
          h_win_Re_prefactor
          h_tail_log_prefactor
          h_tail_Re_prefactor
      let pf := PrefactorWitnessOn.ofLambda (lam := lam)
      let zw :=
        ZetaWitness.ofBounds
          (logBound := logBound)
          (argBound := argBound)
          (ζLogQ := ζLogQ)
          (ζJQ := ζJQ)
          (ζLogTail := ζLogTail)
          (ζJTail := ζJTail)
          h_win_log_zeta
          h_win_j_zeta
          h_tail_log_zeta
          h_tail_j_zeta
          h_log_spec_on
          h_arg_spec
          ζ_log_q_nonneg
          ζ_j_q_nonneg
          ζ_log_tail_nonneg
          ζ_j_tail_nonneg
      ∀ {t : ℝ}, cover.tailStartR ≤ t → t ≤ ERURH.boundsTcapReal →
        Real.log (Complex.abs (xiClassic (crit t))) ≤
          pf.logBound t + lam.pf_tail_log t + ((zw.ζ_log_tail : ℚ) : ℝ))
    (log_to_bridge_main :
      let lam :=
        LambdaWitness.ofBounds
          (lamLogQ := lamLogQ)
          (lamJQ := lamJQ)
          (lamLogTail := lamLogTail)
          (lamJTail := lamJTail)
          (lamLogSup := lamLogSup)
          (lamJSup := lamJSup)
          (pfLogQ := pfLogQ)
          (pfJQ := pfJQ)
          (pfTailLog := pfTailLog)
          (pfTailArg := pfTailArg)
          h_win_log_lambda
          h_win_Re_lambda
          h_tail_log_lambda
          h_tail_Re_lambda
          h_log_dom
          h_tail_log_dom
          h_j_dom
          h_tail_j_dom
          h_pf_log_q_nonneg
          h_pf_j_q_nonneg
          h_pf_tail_log_nonneg
          h_pf_tail_arg_nonneg
          h_win_log_prefactor
          h_win_Re_prefactor
          h_tail_log_prefactor
          h_tail_Re_prefactor
      let pf := PrefactorWitnessOn.ofLambda (lam := lam)
      let zw :=
        ZetaWitness.ofBounds
          (logBound := logBound)
          (argBound := argBound)
          (ζLogQ := ζLogQ)
          (ζJQ := ζJQ)
          (ζLogTail := ζLogTail)
          (ζJTail := ζJTail)
          h_win_log_zeta
          h_win_j_zeta
          h_tail_log_zeta
          h_tail_j_zeta
          h_log_spec_on
          h_arg_spec
          ζ_log_q_nonneg
          ζ_j_q_nonneg
          ζ_log_tail_nonneg
          ζ_j_tail_nonneg
      ∀ {w : Window} (_ : w ∈ cover.windows) {t : ℝ},
        t ∈ w.IccR →
          pf.logBound t +
              ((pf.pf_log_q w : ℚ) : ℝ) +
              ((zw.ζ_log_q w : ℚ) : ℝ) ≤
            B.logR t)
    (log_to_bridge_tail :
      let lam :=
        LambdaWitness.ofBounds
          (lamLogQ := lamLogQ)
          (lamJQ := lamJQ)
          (lamLogTail := lamLogTail)
          (lamJTail := lamJTail)
          (lamLogSup := lamLogSup)
          (lamJSup := lamJSup)
          (pfLogQ := pfLogQ)
          (pfJQ := pfJQ)
          (pfTailLog := pfTailLog)
          (pfTailArg := pfTailArg)
          h_win_log_lambda
          h_win_Re_lambda
          h_tail_log_lambda
          h_tail_Re_lambda
          h_log_dom
          h_tail_log_dom
          h_j_dom
          h_tail_j_dom
          h_pf_log_q_nonneg
          h_pf_j_q_nonneg
          h_pf_tail_log_nonneg
          h_pf_tail_arg_nonneg
          h_win_log_prefactor
          h_win_Re_prefactor
          h_tail_log_prefactor
          h_tail_Re_prefactor
      let pf := PrefactorWitnessOn.ofLambda (lam := lam)
      let zw :=
        ZetaWitness.ofBounds
          (logBound := logBound)
          (argBound := argBound)
          (ζLogQ := ζLogQ)
          (ζJQ := ζJQ)
          (ζLogTail := ζLogTail)
          (ζJTail := ζJTail)
          h_win_log_zeta
          h_win_j_zeta
          h_tail_log_zeta
          h_tail_j_zeta
          h_log_spec_on
          h_arg_spec
          ζ_log_q_nonneg
          ζ_j_q_nonneg
          ζ_log_tail_nonneg
          ζ_j_tail_nonneg
      ∀ {t : ℝ}, cover.tailStartR ≤ t →
        pf.logBound t + lam.pf_tail_log t + ((zw.ζ_log_tail : ℚ) : ℝ) ≤ B.logR t)
    (arg_total :
      let lam :=
        LambdaWitness.ofBounds
          (lamLogQ := lamLogQ)
          (lamJQ := lamJQ)
          (lamLogTail := lamLogTail)
          (lamJTail := lamJTail)
          (lamLogSup := lamLogSup)
          (lamJSup := lamJSup)
          (pfLogQ := pfLogQ)
          (pfJQ := pfJQ)
          (pfTailLog := pfTailLog)
          (pfTailArg := pfTailArg)
          h_win_log_lambda
          h_win_Re_lambda
          h_tail_log_lambda
          h_tail_Re_lambda
          h_log_dom
          h_tail_log_dom
          h_j_dom
          h_tail_j_dom
          h_pf_log_q_nonneg
          h_pf_j_q_nonneg
          h_pf_tail_log_nonneg
          h_pf_tail_arg_nonneg
          h_win_log_prefactor
          h_win_Re_prefactor
          h_tail_log_prefactor
          h_tail_Re_prefactor
      let pf := PrefactorWitnessOn.ofLambda (lam := lam)
      let zw :=
        ZetaWitness.ofBounds
          (logBound := logBound)
          (argBound := argBound)
          (ζLogQ := ζLogQ)
          (ζJQ := ζJQ)
          (ζLogTail := ζLogTail)
          (ζJTail := ζJTail)
          h_win_log_zeta
          h_win_j_zeta
          h_tail_log_zeta
          h_tail_j_zeta
          h_log_spec_on
          h_arg_spec
          ζ_log_q_nonneg
          ζ_j_q_nonneg
          ζ_log_tail_nonneg
          ζ_j_tail_nonneg
      ∀ {a b : ℝ}, B.s0R ≤ a → a ≤ b →
        _root_.abs (Complex.arg (xiClassic (crit b)) -
          Complex.arg (xiClassic (crit a))) ≤
            (pf.argBound b - pf.argBound a) +
              (zw.argBound b - zw.argBound a))
    (arg_to_bridge :
      let lam :=
        LambdaWitness.ofBounds
          (lamLogQ := lamLogQ)
          (lamJQ := lamJQ)
          (lamLogTail := lamLogTail)
          (lamJTail := lamJTail)
          (lamLogSup := lamLogSup)
          (lamJSup := lamJSup)
          (pfLogQ := pfLogQ)
          (pfJQ := pfJQ)
          (pfTailLog := pfTailLog)
          (pfTailArg := pfTailArg)
          h_win_log_lambda
          h_win_Re_lambda
          h_tail_log_lambda
          h_tail_Re_lambda
          h_log_dom
          h_tail_log_dom
          h_j_dom
          h_tail_j_dom
          h_pf_log_q_nonneg
          h_pf_j_q_nonneg
          h_pf_tail_log_nonneg
          h_pf_tail_arg_nonneg
          h_win_log_prefactor
          h_win_Re_prefactor
          h_tail_log_prefactor
          h_tail_Re_prefactor
      let pf := PrefactorWitnessOn.ofLambda (lam := lam)
      let zw :=
        ZetaWitness.ofBounds
          (logBound := logBound)
          (argBound := argBound)
          (ζLogQ := ζLogQ)
          (ζJQ := ζJQ)
          (ζLogTail := ζLogTail)
          (ζJTail := ζJTail)
          h_win_log_zeta
          h_win_j_zeta
          h_tail_log_zeta
          h_tail_j_zeta
          h_log_spec_on
          h_arg_spec
          ζ_log_q_nonneg
          ζ_j_q_nonneg
          ζ_log_tail_nonneg
          ζ_j_tail_nonneg
      ∀ {a b : ℝ}, B.s0R ≤ a → a ≤ b →
        (pf.argBound b - pf.argBound a) + (zw.argBound b - zw.argBound a) ≤
          B.jRel b - B.jRel a) :
    True := by
  classical
  let lam :=
    LambdaWitness.ofBounds
      (lamLogQ := lamLogQ)
      (lamJQ := lamJQ)
      (lamLogTail := lamLogTail)
      (lamJTail := lamJTail)
      (lamLogSup := lamLogSup)
      (lamJSup := lamJSup)
      (pfLogQ := pfLogQ)
      (pfJQ := pfJQ)
      (pfTailLog := pfTailLog)
      (pfTailArg := pfTailArg)
      h_win_log_lambda
      h_win_Re_lambda
      h_tail_log_lambda
      h_tail_Re_lambda
      h_log_dom
      h_tail_log_dom
      h_j_dom
      h_tail_j_dom
      h_pf_log_q_nonneg
      h_pf_j_q_nonneg
      h_pf_tail_log_nonneg
      h_pf_tail_arg_nonneg
      h_win_log_prefactor
      h_win_Re_prefactor
      h_tail_log_prefactor
      h_tail_Re_prefactor
  let pf := PrefactorWitnessOn.ofLambda (lam := lam)
  let zw :=
    ZetaWitness.ofBounds
      (logBound := logBound)
      (argBound := argBound)
      (ζLogQ := ζLogQ)
      (ζJQ := ζJQ)
      (ζLogTail := ζLogTail)
      (ζJTail := ζJTail)
      h_win_log_zeta
      h_win_j_zeta
      h_tail_log_zeta
      h_tail_j_zeta
      h_log_spec_on
      h_arg_spec
      ζ_log_q_nonneg
      ζ_j_q_nonneg
      ζ_log_tail_nonneg
      ζ_j_tail_nonneg
  let _ :=
    XiWitness.ofPrefactorZeta
      (cover := cover)
      (analytic := analytic)
      pf
      lam
      zw
      log_total_main
      log_total_tail
      log_to_bridge_main
      log_to_bridge_tail
      arg_total
      arg_to_bridge
  exact trivial

end WitnessPipeline

end
