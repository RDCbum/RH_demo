ERURH RMSLocal Hypothesis Proof (Plan B)
========================================

Status: background note. For the current proof narrative and routes, see
`arxiv_submission/ERURH_Conditional_Proof.tex` and
`docs/core/RH_CLOSURE_CHECKLIST.md`.

1. Setup and decomposition
--------------------------
- Normalised observable: \tilde J_α(s) = e^{s/2} J_rel,α(s) / s^2.
- Decomposition: \tilde J_α = \tilde J_0 + \tilde J_low + \tilde J_tail.
- RMS on a window [S, S+L]:
  - RMS(S, L) := sqrt( (1/L) ∫_{s ∈ [S, S+L]} | \tilde J_α(s) |^2 ds ).
  - RMS_0(S, L), RMS_low(S, L), RMS_tail(S, L) defined analogously for the three pieces.

2. Noise bounds (A2-low and A2-tail)
------------------------------------
- A2-low: there exists M_low such that RMS_low(S, L) ≤ M_low for S large and 1 ≪ L ≪ S^α.
- A2-tail: there exists M_tail such that RMS_tail(S, L) ≤ M_tail for S large and 1 ≪ L ≪ S^α.
- Define M_noise := M_low + M_tail.

3. A1 bridge (conditional)
---------------------------
- Hypotheses: ρ = β + iγ with β > 1/2; a supercritical mode contribution to
  `log R_alpha` encoded by `ERU_mode_beta β`; ERU normalization
  \tilde J(s) = a s^{-2} e^{(β - 1/2)s} e^{iγ s}; admissible windows
  [S, S+L] with 1 ≪ L ≪ S^α, 0 < α < 1.
- A1 bridge (legacy window-free): the paper Lemma `a1-from-supercritical`
  (\texttt{A1_from_supercritical}) produces a witness window `w` and threshold
  `K` such that `RMS_mode(w) ≥ K > C_env` under the supercritical mode hypothesis.
- Alternative fixed-window bridge: the paper assumption
  `ModeThresholdControlOnCtxRealWindowFamily` plus the pointwise-to-RMS lemma
  yields the same `A1_mode` witness, but tied to the concrete `ctx_real` window
  family. This is an alternative route, not the primary one.

4. Proof of RMSLocalHypothesis (conditional)
---------------------------------------------
- Triangle inequality in L: `RMS(w) ≥ RMS_mode(w) - RMS_low(w) - RMS_tail(w)`.
- With A2-low and A2-tail (noise bounds), and the A1 witness window from the
  supercritical-mode bridge, we obtain `RMS(w) > C_env`, i.e. `RMSLocalHypothesis`.
- Conclusion: a supercritical mode implies a violating window under A1/A2, which
  then contradicts the gate-closed certificates. This avoids the vacuity issue:
  the window witness is conditional on the mode hypothesis.
