# P34 Claim wording (final variants)

## (A) Conservative claim (correct today, with explicit gap)

We formalize in Lean the logical chain that reduces RH for $\xi_\alpha$ to
explicit analytic hypotheses and auditable numeric certificates. The remaining
analytic gap is the paper lemma
`ModeThresholdControlOnCtxRealWindow`; together with the gate-certified
numeric side conditions, this yields the Route B core implication
and the conditional master theorem. No project axioms are assumed in Lean.

## (B) Claim if the threshold-control lemma is proved in the paper

Assuming the paper proves the lemma
`ModeThresholdControlOnCtxRealWindow`, the Lean development plus the verified
gate certificates establish the Route B chain and the conditional master theorem.
In particular, there are no supercritical ERU modes and RH for $\xi_\alpha$
follows under the standard classical packages enumerated in the assumptions ledger.

## (C) Claim if the lemma is also formalized in Lean

If the proof of `ModeThresholdControlOnCtxRealWindow` is formalized in Lean,
then the Route B core closes without analytic gaps beyond the classical
zeta/explicit-formula packages. Together with the verified gate certificates,
this yields a complete Lean-checked proof of the conditional ERURH master theorem
with only Lean kernel axioms in the footprint.
