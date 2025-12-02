# ERURH-alpha · Bridge → Strong Morphism (notes)

## Abstract definition (Lean)
- The bridge layer is an `ERUBridge` with fields `s0 : Q`, `logR : ℝ → ℝ`, `jRel : ℝ → ℝ` (see `formal_proofs/ERURH/Inertia.lean`). Inertia predicates (`InertiaERU`) impose pointwise rational bounds on these functions.
- The strong layer is `InertiaERU_alpha_strong` (via `AlphaInterfacesOn`), representing the “strong inertia” statement for the alpha case.
- The bridge→strong morphism appears in `formal_proofs/ERURH/InertiaCertificatesAlpha.lean` as
  ```
  bridge_to_strong : InertiaERU alphaBridge → InertiaERU_alpha_strong
  ```
  packaged in `StrongInertiaCertificate_alpha`. It is purely logical: if the bridge satisfies the inertia predicate (with its window/tail bounds), then the strong inertia statement follows. No new function is constructed.

## Specialization to jRel
- Lean does not define a separate `jRel_strong`; the same bridge functions are asserted to satisfy stronger properties once the bridge certificate holds. Pointwise bounds on `jRel` (from `FluxWindows.lean`, `jRelBoundWindow`/`jRelBoundTail`) suffice to imply the strong inertia predicate.
- There is no shift, convolution, or kernel applied to `jRel` in the formal morphism. Any intuition about smoothing or extra decay is encoded only in the certificate constants and the strong predicates, not in a functional transformation.

## Parameters and constraints
- Strong certificate parameters in `InertiaCertificatesAlpha.lean`:
  - `C_strong : Q := cEnvelopeClosedRat` (prefactor placeholder),
  - `S0_strong : Q := tailStart` (domain threshold).
- The morphism assumes bridge inertia holds on the covered windows/tail (as instantiated in `FluxWindows.lean`), with pointwise bounds such as `jRelBoundWindow` and `jRelBoundTail`.
- Because Lean does not construct a new `jRel_strong(s)`, any numeric evaluator must either mirror the bridge `jRel` or apply a clearly marked heuristic transformation. No explicit strong transformation is specified in this repository; certificates + classical analytic assumptions (bundled in `ERURH_GlobalAssumptions`) carry the logical implication.
