# P34 Claim wording (final variants)

## (A) Conservative claim (correct today, conditional)

We formalize in Lean the logical chain that reduces RH for $\xi_\alpha$ to
explicit analytic hypotheses and auditable numeric certificates. The paper
provides full proofs of A1 (window-free route) and A2 (from A/B/C), while the
gate verifies the numeric certificates. No project axioms are assumed in Lean.

## (B) Claim if the fixed-window threshold-control lemma is proved in the paper

Assuming the paper proves the fixed-window lemma
`ModeThresholdControlOnCtxRealWindow`, the alternative Route B bridge closes
for `ctx_real`. Together with the verified gate certificates, this yields the
Route B chain and the conditional master theorem under the same classical
packages.

## (C) Claim if the fixed-window lemma is also formalized in Lean

If the proof of `ModeThresholdControlOnCtxRealWindow` is formalized in Lean,
then the fixed-window Route B core closes without analytic gaps beyond the
classical zeta/explicit-formula packages. Together with the verified gate
certificates, this yields a complete Lean-checked proof of the conditional
ERURH master theorem with only Lean kernel axioms in the footprint.
