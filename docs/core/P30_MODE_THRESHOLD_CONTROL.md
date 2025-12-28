# P30 Mode threshold control (Option 2)

## Lean statement (exact)

Source: `docs/core/P30_ModeThresholdControl.lean`

```lean
def ERURH.Alpha.ModeThresholdControlOnCtxRealWindow : Prop :=
  ∀ β : ℝ, β > (1/2 : ℝ) → ERU_mode_beta β →
    ∃ s0 : ℝ, s0 ≤ _root_.windowMin ctx_real_window ∧
      ∀ {s : ℝ}, s ≥ s0 →
        |logR_alpha s| ≥ Real.exp ((β - (1/2 : ℝ)) * s)
```

## LaTeX statement (quantifier-aligned)

For every $\beta \in \mathbb{R}$ with $\beta > 1/2$, if $\mathrm{ERU\_mode\_beta}(\beta)$
holds, then there exists $s_0 \in \mathbb{R}$ such that
\[
 s_0 \le \mathrm{windowMin}(\mathrm{ctx\_real\_window})
 \quad\text{and}\quad
 \forall s \ge s_0,\;
 |\log R_\alpha(s)| \ge \exp((\beta - 1/2)s).
\]

## Why this closes the bridge

Given any $s \in I_{\mathrm{ctx}} = [\mathrm{windowMin}, \mathrm{windowMax}]$,
we have $s \ge \mathrm{windowMin} \ge s_0$. Thus the mode bound applies on the
entire window interval, which yields
`SupercriticalModeAppliesOnCtxRealWindow`.
