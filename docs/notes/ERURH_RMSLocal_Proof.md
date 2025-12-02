ERURH RMSLocal Hypothesis Proof (Plan B)
========================================

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

3. A1-mode
----------
- Hypotheses: ρ = β + iγ with β > 1/2 (H_(ρ0)); mode contribution J(s) = a e^{(ρ - 1)s} (H_mode); ERU normalisation \tilde J(s) = a s^{-2} e^{(β - 1/2)s} e^{iγ s} (H_norm); windows [S, S+L] with 1 ≪ L ≪ S^α, 0 < α < 1 (H_range).
- A1-mode theorem: there exist c > 0 and S0 > 0 such that for all S ≥ S0 and 1 ≤ L ≤ S^α,
  RMS_0(S, L) ≳ c · e^{(β - 1/2)S} / S^2.
- Proof sketch: | \tilde J(s) | = |a| s^{-4} e^{2(β - 1/2)s}; on [S, S+L], s^{-4} ≳ S^{-4}, e^{2(β - 1/2)s} ≳ e^{2(β - 1/2)S}; integrate to get (1/L)∫|.|^2 ≳ |a|^2 S^{-4} e^{2(β - 1/2)S}.

4. Proof of RMSLocalHypothesis
------------------------------
- Triangle inequality in L: RMS(S, L) ≥ RMS_0(S, L) - RMS_low(S, L) - RMS_tail(S, L) ≥ RMS_0(S, L) - M_noise.
- Choose S large so that RMS_0(S, L) > 2 M_noise + C_env; then
  RMS(S, L) ≥ RMS_0(S, L) - M_noise > M_noise + C_env > C_env.
- Conclusion: if a mode with β > 1/2 exists and A2-low/A2-tail hold, then there is a high window [S*, S*+L*] with RMS(S*, L*) > C_env, i.e. `RMSLocalHypothesis`.
