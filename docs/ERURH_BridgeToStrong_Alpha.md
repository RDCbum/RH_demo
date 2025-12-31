# ERURH-alpha · Bridge → Strong morphism (notes)

Status: working notes. For the current, authoritative assumption mapping see
`docs/core/ASSUMPTIONS_LEDGER.md`.

## Abstract definition (Lean)

- The bridge layer is an `ERUBridge` with fields `s0 : Q`, `logR : ℝ → ℝ`, `jRel : ℝ → ℝ` (see `formal_proofs/ERURH/Inertia.lean`). Inertia predicates (`InertiaERU`) impose pointwise rational bounds on these functions.
- The strong layer is captured by `InertiaERU_alpha_strong` (imported via `AlphaInterfacesOn`), representing the “strong inertia” statement for the alpha case.
- The bridge→strong morphism appears in `formal_proofs/ERURH/InertiaCertificatesAlpha.lean` as

  ```text
  bridge_to_strong : InertiaERU alphaBridge → InertiaERU_alpha_strong
  ```

  packaged inside `StrongInertiaCertificate_alpha`. It is a logical implication: if the bridge satisfies the inertia predicate (with its window/tail bounds), then the strong inertia statement follows.
- No explicit functional transformation of `jRel` is given; the morphism operates at the level of predicates/certificates, not by producing a new function `jRel_strong` from `jRel`.

## Specialization to jRel

- Lean does not define a separate `jRel_strong(s)` as a function. Instead, it asserts that the *same* bridge functions satisfy stronger properties once the bridge certificate holds: pointwise bounds on `jRel` (from `FluxWindows.lean`, `jRelBoundWindow`/`jRelBoundTail`) are sufficient to imply the strong inertia predicate.
- There is no shift, convolution, or kernel acting on `jRel` in the formal morphism. The transformation is purely logical: “bridge inertia holds” ⇒ “strong inertia holds.” Any intuition about smoothing or extra decay is encoded in the certificate constants (e.g., `C_strong`) and the strong predicates, not in a functional map on `jRel`.

## Parameters and constraints

- Strong certificate parameters in `InertiaCertificatesAlpha.lean`:
  - `C_strong : Q := cEnvelopeClosedRat` (current certificate value; not derived analytically),
  - `S0_strong : Q := tailStart` (domain threshold).
- The morphism expects bridge inertia to hold on the covered windows/tail (as instantiated in `FluxWindows.lean`), with pointwise bounds `jRelBoundWindow ≈ 7.886e-4`, `jRelBoundTail ≈ 6.819e-3`.
- Since Lean does not expose a constructive `jRel_strong(s)`, a numeric evaluator must either (a) mirror the bridge `jRel` or (b) introduce a heuristic transformation. In this repository, no explicit strong transformation is specified; any such numeric proxy must be marked heuristic.
