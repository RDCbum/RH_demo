How to Reproduce the ERURH Verification
=======================================

Environment
-----------
- Requirements: Lean + elan installed.
- Python 3.10+ with `pip`.
- Python deps installable via `pip install -e .`.
- For detailed steps, see `docs/ERURH_PeerReviewChecklist.md`.

Quick steps
-----------
- `pip install -e .`
- `lake exe cache get`
- `lake build ERURH`
- `python tools/make_rational_bounds.py`
- `python tools/make_certificate_values.py`
- `python scripts/verify_gate.py`

If all goes well, these steps regenerate certificates, compile Lean, and run the basic checks.

What this verifies
------------------
- Confirms ERURH constants and certificates (alpha and beta) and rebuilds the Lean theorem `RH_from_ERURH_conditional`.
- The proof remains conditional on the classical theorems listed in `docs/ERURH_MainTheorem.md`.
