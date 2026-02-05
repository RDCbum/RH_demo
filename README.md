# RH_demo_clean - ERURH conditional RH proof (Lean/Python)

**DOI:** https://doi.org/10.5281/zenodo.18010407

RH_demo_clean presents ERURH as a high-difficulty applied case study of the ERU framework. It provides a conditional Lean reduction to the Riemann Hypothesis together with a claim-indexed analytic discharge (Theorems A/B/C) prepared for external audit. It does not assert RH unconditionally; it invites focused review of specific Claim IDs. The repo includes the Lean proof modules and Python tooling used to regenerate the numeric certificates referenced by the conditional statement.

**ERU context.**  
This repository presents ERURH as an applied, high-difficulty case study of the ERU framework.  
For a concise overview of ERU and how ERURH fits into it, see `docs/ERU_AT_A_GLANCE.md`.

**Scope-exact claim.** ERURH provides a complete, formally verified (Lean) reduction of RH for `xiAlpha` to a finite and explicit set of external analytic statements (A/B/C and normalization bridges), together with a family of finite, reproducible numerical certificates whose verification is mechanical. The repository includes a machine-checked proof of the conditional implication `ERURH_GlobalAssumptions -> RiemannHypothesis`, and a deterministic pipeline that regenerates and verifies all referenced numeric artifacts.

## Routes
- Primary (legacy window-free): main route; abstract RMS context; no fixed window family / no computational threshold control; core conceptual chain.
- Secondary (fixed-window computational): experimental/optional; depends on extra bridges (threshold control, and for the Buchstab instantiation `ExplicitBRhoExpression`); not required for the primary route.
See `docs/core/ROUTES_COMPARISON.md`.

## Overview
Lean proves a conditional implication from explicit hypotheses; all external assumptions and bridge conditions are documented in `docs/core/` and prepared for audit.
- Lean formalization: encodes the ERURH framework and the conditional implication `ERURH_GlobalAssumptions -> RiemannHypothesis`.
- Python tooling: regenerates rational bounds and certificate values from the published numeric artefacts.
- Documentation: explains the analytic assumptions, the certificate pipeline, and how to reproduce the build.
- Step-by-step proof walkthrough (legacy window-free route): `docs/core/LEGACY_WINDOW_FREE_PROOF_WALKTHROUGH.md`.
- Referee summary (central): `docs/core/P27_REFEREE_PACKET.md`.
- Final status capsule (single page): `docs/core/FINAL_STATUS.md`.
- Repro guide: `docs/core/ERURH_HOWTO_Reproduce.md`.
- Referee FAQ (index): `docs/core/REFEREE_FAQ.md`.

## Repository Structure
- `lean/formal_proofs/ERURH/` — main Lean sources (Alpha/Beta certificates, gates, master theorem).
- `lean/formal_proofs/ERURH/Beta/` — Beta-specific certificate modules.
- `tools/` — generators (`make_rational_bounds.py`, `make_certificate_values.py`).
- `scripts/verify_gate.py` — end-to-end regeneration + build (optional tests).
- `data/releases/erurh-v2-core/formal/` — published JSON inputs.
- `data/docs/paper/` — regenerated JSON outputs.
- `docs/` — ERURH notes, assumptions, and reproduction guide.
- `lakefile.lean`, `lean-toolchain`, `lake-manifest.json` — Lean 4.25.0-rc2 + mathlib pin.

## Installation

### Requirements
- Python 3.10+ (recommended)
- Lean toolchain as pinned by `lean-toolchain`
- Git

### Windows (PowerShell)

```powershell
# 1) Python venv
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -U pip

# 2) Install the Python package (editable)
python -m pip install -e .

# 3) Fetch Lean dependencies / cache (optional but recommended)
lake update
lake exe cache get
```
### Linux/macOS
```
# 1) Python venv
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -U pip

# 2) Install the Python package (editable)
python -m pip install -e .

# 3) Fetch Lean dependencies / cache (optional but recommended)
lake update
lake exe cache get
```

## Verification Pipeline
From the repo root (venv active):
```powershell
# 1) Regenerate rational bounds and Lean mirror
python tools/make_rational_bounds.py
# 2) Regenerate certificate values and Lean mirror
python tools/make_certificate_values.py
# 3) Build Lean target
lake build ERURH
# 4) Full gate (regeneration + Lean build, optional pytest)
python scripts/verify_gate.py --skip-pytests
```
If tests are added later, omit `--skip-pytests` to run them.

### Quick Verify (one-liner)
Windows PowerShell:
```powershell
# build + gate (full)
powershell -NoProfile -Command "$env:LAKE_JOBS=1; python scripts/verify_gate.py"

# build + gate + arXiv bundle
powershell -NoProfile -Command "$env:LAKE_JOBS=1; python scripts/verify_gate.py; .\\scripts\\make_arxiv_bundle.ps1"
```

### How to verify (step-by-step)
1) Activate the venv and ensure the Lean toolchain is installed (see Installation above).
2) Run the full gate: `python scripts/verify_gate.py`.
3) Optional: rebuild the arXiv bundle with `scripts/make_arxiv_bundle.ps1`.
4) Check `docs/core/ARXIV_RELEASE_CHECKLIST.md` for the latest verification capsule references.

## External Assumptions (high level)
The Lean theorem formalizes a conditional implication of the form:

**ERURH_GlobalAssumptions -> RiemannHypothesis**

`ERURH_GlobalAssumptions` bundles:
- Classical zeta-function input (explicit formula, growth and zero-counting bounds).
- Spectral / large-sieve–style controls for explicit-formula coefficients.
- Window and certificate hypotheses (A1/A2 conditions, alpha/beta coverage).

Bridge assumptions (A1/A2, normalization) are structural/compatibility conditions audited mechanically; deep analytic review is concentrated in A/B/C Claim IDs.
In addition, this repository includes a **proposed analytic proof** of three key assumptions (Theorems **A, B, C**) which, if externally verified, would discharge the remaining analytic gaps used by the conditional statement. These analytic components are provided for independent review:

- Theorems A, B, C (analytic write-up): `docs/core/ERURH_Analytic_Theorems_ABC.md`
- Assumptions table and dependency map: `docs/core/ERURH_Assumptions_Report.md`
- Main theorem overview and assumption references: `docs/core/ERURH_MainTheorem.md`

**Standard conditionality statement.** The Lean development proves a conditional
implication: RH for `xiAlpha` follows provided the analytic packages (A/B/C and
the A1 bridge in the paper) are correct and the numeric certificates are
verified by the gate. These external components are presented for independent
review.

## How to cite

Use the repository URL and release tag for citations.

### BibTeX

```bibtex
@software{duran_erurh_2025,
  author       = {Duran, Robert},
  title        = {ERURH: Conditional RH demo (Lean) with analytic assumptions A, B, C},
  year         = {2025},
  version      = {v1.0-preprint},
  url          = {https://github.com/RDCbum/RH_demo_clean},
}
```
Note. The Lean formalization proves a conditional implication
ERURH_GlobalAssumptions -> RiemannHypothesis.
The analytic theorems A, B, C are provided as proposed proofs requiring independent external verification.

## License

### Code
All source code in this repository (Lean, Python, scripts, build files, and related tooling) is licensed under the **Apache License, Version 2.0**.

See: `LICENSE` (Apache-2.0).  
Unless required by applicable law or agreed to in writing, software distributed under the License is provided on an **“AS IS” BASIS**, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND.  
See <http://www.apache.org/licenses/LICENSE-2.0>.

### Paper / preprint materials
The manuscript sources and rendered documents (including `.tex`, `.bib`, and `.pdf` files under `docs/preprints/` and `arxiv_submission/`, and any other files explicitly identified as manuscript material) are licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

See: `LICENSE-PAPER` (CC BY 4.0).

**IP note.** A national filing establishing priority date **2025-12-21** exists for the general ERU analysis method.

## Copyright
Copyright (c) 2025 Robert Duran (e-mail: duran.robert301@gmail.com)


