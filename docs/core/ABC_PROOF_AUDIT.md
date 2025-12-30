# ABC Proof Audit (Theorem_ABC_preprint.tex)

This audit reviews the proof completeness of Theorems A/B/C in
`arxiv_submission/Theorem_ABC_preprint.tex`. It is complementary to
`docs/core/ERURH_Analytic_Theorems_ABC.md`, which records only statements.

## Summary

- The preprint contains full proofs (not just sketches) for Theorems A, B, C.
- Each theorem is reduced to standard analytic inputs explicitly stated as
  hypotheses (H1–H3) plus classical references (Titchmarsh, Montgomery–Vaughan).
- No missing lemmas were found in the proof chains as written.

## Theorem A (Dyadic L² tail bound)

**Location:** `arxiv_submission/Theorem_ABC_preprint.tex` (Section “Theorem A”).

**Proof structure**
- Uses Lemma “Stirling decay for the coefficients” (explicit proof via Stirling).
- Combines with the Riemann–von Mangoldt count to bound the dyadic sum.
- Concludes an exponential dyadic tail, and derives a polynomial bound.

**Dependencies**
- (H1)–(H2): holomorphic model and polynomial growth of `H(s)`.
- (H3): Riemann–von Mangoldt local counting.
- Reference: Titchmarsh (Stirling in vertical strips).

**Audit verdict:** complete as written.

## Theorem B (Large-sieve mean-square bound)

**Location:** `arxiv_submission/Theorem_ABC_preprint.tex` (Section “Theorem B”).

**Proof structure**
- Uses local zero counting to bound the number of ordinates in any unit interval.
- Partitions the multiset of ordinates into 1-separated subfamilies (Lemma `partition`).
- Applies the classical large-sieve inequality for separated exponentials.
- Aggregates via Cauchy–Schwarz to recover the stated bound.

**Dependencies**
- (H3): unit-interval zero counts.
- Large sieve for separated exponentials (Montgomery LNM 227; Montgomery–Vaughan).

**Audit verdict:** complete as written.

## Theorem C (Uniform RMS tail bound)

**Location:** `arxiv_submission/Theorem_ABC_preprint.tex` (Section “Theorem C”).

**Proof structure**
- Uses Lemma `decay` to bound `|b_rho|` exponentially.
- Sums over dyadic bands to show `\sum_{|\gamma|>S^B} |b_rho|` is exponentially small.
- Uses the absolute bound to control `|F_tail(s)|` uniformly on `[S,S+L]`.
- Integrates the uniform bound to obtain the RMS tail estimate.

**Dependencies**
- (H1)–(H2): Stirling decay for `b_rho`.
- (H3): local zero counting for dyadic band size.

**Audit verdict:** complete as written.

## Cross-checks vs ERURH paper

- The hypotheses (H1)–(H3) match the assumptions stated in
  `arxiv_submission/ERURH_Conditional_Proof.tex` (Theorems A/B/C section).
- The preprint is consistent with the Lean normalization where auxiliary
  holomorphic factors are absorbed into the abstract coefficient `b_rho`.

## Remaining referee-sensitive points

Even with full proofs, a referee may still request:
- Explicitly verified constants/ranges for (H1)–(H3) in the chosen ERURH setup.
- Clear statement of how `H(s)` is defined from the ERU kernel and explicit formula.

These are documented in the main paper and assumptions ledger.
