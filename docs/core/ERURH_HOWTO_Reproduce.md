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
- `python scripts/verify_gate.py` (full gate, includes NOAX guard + pytest)

If all goes well, these steps regenerate certificates, compile Lean, and run the basic checks.

Repro capsule (recommended)
---------------------------
To make the run fully reproducible for a referee, capture:
- Environment versions:
  - `python --version`
  - `lake --version`
  - `elan show`
- Gate logs:
  - `docs/core/FINAL_BUILD.txt`
  - `docs/core/FINAL_GATE_FULL.txt`
- Hashes of frozen inputs (PowerShell examples):
  - `Get-FileHash data/docs/paper/rational_bounds.json`
  - `Get-FileHash data/docs/paper/certificate_values.json`
  - `Get-FileHash data/docs/paper/rms_context.json`
  - `Get-FileHash data/docs/paper/rms_mode_bridge.json`
  - `Get-FileHash data/docs/paper/beta_certificate.json`
The arXiv bundle also includes `arxiv_submission/reproducibility_manifest.txt`
with these versions and hashes for convenience.

What this verifies
------------------
- Regenerates `data/docs/paper/{rational_bounds.json,certificate_values.json}` and their Lean mirrors under `lean/formal_proofs/ERURH/`.
- Builds the Lean library and the conditional theorem `RH_from_ERURH_conditional`.
- Leaves the proof conditional on the classical hypotheses enumerated in `docs/core/ERURH_MainTheorem.md`.
- Confirms the NOAX guard (no project axioms) and runs the pytest smoke suite.
