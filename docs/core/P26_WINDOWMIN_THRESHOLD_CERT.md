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

## Outcome

- The window-above-threshold step remains a paper lemma
  (see Lemma `Window above threshold` in the No supercritical ERU modes section).
- The gate continues to certify data consistency (window endpoints, RMS tables)
  via regeneration + diff checks in `scripts/verify_gate.py`.

No additional gate check is introduced for the window-above-threshold step.
