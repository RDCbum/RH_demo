# P26 Window-min threshold assessment

## Step (ii) status

From `ERU_mode_beta`:

```
∃ s0 : ℝ, ∀ {s : ℝ}, s ≥ s0 →
  |logR_alpha s| ≥ exp((β - 1/2) * s)
```

The threshold `s0` is existential and depends on the chosen mode witness.
Because `s0` is not a fixed constant from the gate data, the condition
`windowMin >= s0` is not a numeric inequality that can be certified directly
by the gate alone.

However, the gate can certify a related numeric fact: the maximal ctx_real
window minimum `windowMinMax` is greater than or equal to the analytic
threshold reported in `formal_report_analytic.json` (denoted `s0` there).
This is now enforced in `tools/check_rms_context.py`. It does **not** by itself
prove the analytic implication from `ERU_mode_beta` to that fixed threshold,
but it discharges the purely numeric part once that analytic lemma is supplied.

## Outcome

- The window-above-threshold step remains a paper lemma
  (see Lemma `Mode threshold control` in the No supercritical ERU modes section).
- The gate certifies `windowMinMax >= s0` from `formal_report_analytic.json`
  via `tools/check_rms_context.py`, and continues to certify data consistency
  (window endpoints, RMS tables) via regeneration + diff checks in
  `scripts/verify_gate.py`.

No additional gate check is introduced for the window-above-threshold step.
