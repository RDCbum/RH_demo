ERURH Explicit Formula Plan (Alpha Layer)
=========================================

Status: background note. For the authoritative assumptions and gap mapping, see
`docs/core/ASSUMPTIONS_LEDGER.md` and `docs/core/RH_CLOSURE_CHECKLIST.md`.

1. Explicit formula for ψ(x), E(x), and logR(s)
-----------------------------------------------
- Classical explicit formula: `ψ(x) = x - Σ x^ρ/ρ + (trivial terms + error)`, where the sum ranges over non-trivial zeros ρ of ζ.
- Define `E(x) = ψ(x) - x`; then `logR(s) = E(e^s) / e^s`. This expresses the ERU observable in terms of zero contributions plus controlled tails.
- By unfolding the explicit formula, `logR(s)` and its derivative `jRel(s) = d/ds logR(s)` become sums over zeros with exponential weights `e^{(ρ - 1)s}`.

2. From ψ to the ERU observable jRel and the coefficients b_ρ
------------------------------------------------------------
- Differentiating `logR(s)` gives `jRel(s)` with coefficients `(ρ - 1)/ρ · e^{(ρ - 1)s}` from each zero term.
- Under the ERU normalization and the shift `s = S + u`, one factors out the S-dependent part, leading to sums of the form `Σ b_ρ e^{iγu}` over windows in u, where `ρ = β + iγ` and `b_ρ` encodes the explicit-formula coefficient.
- These coefficients `b_ρ` carry the arithmetic/analytic content of the explicit formula into the ERURH RMS analysis.

3. Analytic hypothesis H_b on b_ρ
---------------------------------
- Hypothesis H_b: the coefficients `b_ρ` satisfy a decay bound in the height γ, e.g. `|b_ρ| ≤ C / (1 + |γ|)^{1-ε}` for zeros with `β > 1/2`, implying tail bounds like `∑_{|γ|>T} |b_ρ|^2 ≤ (log T)^A`.
- H_b abstracts the expected decay of explicit-formula coefficients needed to control tail RMS contributions.
- This hypothesis is recorded in Lean as a standalone Prop (see `formal_proofs/ERURH/ERURH_ExplicitFormulaAlpha.lean`).
- For the purposes of Plan B, the explicit formula and H_b are treated as analytic hypotheses (see `docs/ERURH_PlanB_Assumptions.md`); a future formalisation could internalise these classical ingredients.

4. Role of H_b in A2-tail and Plan B
------------------------------------
- H_b, combined with zero-density estimates and a large-sieve-type lemma on γ, yields the tail RMS control (A2-tail) described in `docs/ERURH_A2_AnalyticPlan.md`.
- With A2-tail (plus A2-low and A1-mode), one aims to establish `RMSLocalHypothesis`, which feeds into the Plan B master theorem `RH_from_planB_RMS`.
- At present, H_b is taken as an analytic hypothesis; its future derivation from explicit-formula analysis will close the A2-tail gap.
