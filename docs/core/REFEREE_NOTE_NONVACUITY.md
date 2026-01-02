# Referee note: non-vacuity of the Plan B chain

The paper now explicitly avoids the “vacuous implication” issue. A1/A2 are
treated as analytic hypotheses in Lean, but the paper only invokes them after
deriving them from a supercritical mode hypothesis via the A1/A2 bridges.

Concretely:
- Lemma `a1-from-supercritical` + Lemma `a2-from-abc` are used to discharge
  Assumption `assm:a1a2` before the gate contradiction.
- Proposition `prop:no-supercritical` is **conditional** and explicitly uses
  those bridges plus the closed-gate certificates.

This ensures the Plan B contradiction has the standard form:
supercritical mode ⇒ A1/A2 ⇒ RMS violation ⇒ gate contradiction.
