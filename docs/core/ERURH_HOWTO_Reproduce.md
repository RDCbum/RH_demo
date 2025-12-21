How to Reproduce the ERURH Verification
=======================================

Environment
-----------
- Lean 4 (via `elan`) installed.
- Python 3.10+ with `pip`.
- Python dependencies installable via `pip install -e .`.

Quick steps
-----------
- `python -m pip install -e .`
- `lake exe cache get`
- `python tools/make_rational_bounds.py`
- `python tools/make_certificate_values.py`
- `lake build ERURH`
- `python scripts/verify_gate.py --skip-pytests` (omit the flag if tests exist)

If all goes well, these steps regenerate certificates, compile Lean, and run the basic checks.

What this verifies
------------------
- Regenerates `data/docs/paper/{rational_bounds.json,certificate_values.json}` and their Lean mirrors under `lean/formal_proofs/ERURH/`.
- Builds the Lean library and the conditional theorem `RH_from_ERURH_conditional`.
- Leaves the proof conditional on the classical hypotheses enumerated in `docs/core/ERURH_MainTheorem.md`.
