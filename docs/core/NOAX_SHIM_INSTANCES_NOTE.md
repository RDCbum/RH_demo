# NOAX shim instances note

This branch removes shim-closing axioms by making the bundle constructor explicit.

- `lean/formal_proofs/ERURH/AxiomsShimAccepted_Instances.lean` now defines
  `axiomsShimAccepted_from_paper` as a function that takes each field of
  `AxiomsShimAccepted` as an argument (no axioms/constants).
- `lean/formal_proofs/ERURH/RH_Unconditional.lean` and
  `lean/formal_proofs/ERURH/RH_Unconditional_Assuming.lean` now require
  explicit `hAxioms : AxiomsShimAccepted` (and `hB1` for the RMS bridge)
  instead of relying on a global instance.

This keeps the remaining gaps as explicit hypotheses while eliminating
non-core axioms from the ERURH namespace.
