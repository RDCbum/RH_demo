ERURH Explicit Coefficients Plan
================================

1. From ψ(x) to logR(s) and jRel(s)
-----------------------------------
- Explicit formula sketch: `ψ(x) = x - Σ x^ρ/ρ + (trivial terms + error)`.
- Define `E(x) = ψ(x) - x`, `logR(s) = E(e^s)/e^s`, and `jRel(s) = d/ds logR(s)`.
- Unfolding the explicit formula yields expressions for `logR(s)` and `jRel(s)` as sums over zeros: `jRel(s) ≈ Σ c_ρ e^{(ρ-1)s}` with coefficients `c_ρ` coming from the explicit formula terms.

2. Definition of b_ρ for the ERU observable
-------------------------------------------
- After normalising and restricting to windows `[S, S+L]` with `s = S + u`, terms `e^{(ρ-1)s}` rewrite as `e^{(ρ-1)S} · e^{(ρ-1)u} = (S-factor) · e^{iγ u} · (u-factor)`.
- The factor multiplying `e^{iγ u}` defines coefficients `b_ρ`, which are rational/smooth functions of ρ (combinations of `(ρ-1)/ρ`, etc.).
- These `b_ρ` carry the explicit-formula contribution of each zero into the ERU RMS analysis.

3. Target lemma: explicit coefficients ⇒ H_b
--------------------------------------------
- Desired analytic lemma: under reasonable explicit-formula control for ψ/logR/jRel, the coefficients `b_ρ` associated to zeros with `β > 1/2` satisfy decay `|b_ρ| ≤ C (1+|γ|)^{-1+ε}`. Consequently, the tail sum obeys `∑_{|γ|>T} |b_ρ|^2 ≤ (log T)^A`.
- This lemma is formalised in Lean as a sketch (with a `sorry`) linking an abstract explicit-formula hypothesis to the Prop `H_b`.

4. Placement in Plan B
----------------------
- `H_b` is the compressed explicit-formula hypothesis on `b_ρ`.
- `A2Tail_RMS` is expected to follow from `H_b` plus zero-density and large-sieve-on-γ bounds (see `docs/ERURH_A2_AnalyticPlan.md`).
- Thus, the lemma “explicit coefficients ⇒ H_b” is a conceptual bridge from the explicit formula to tail RMS control (A2-tail), feeding into the Plan B route to RH.
