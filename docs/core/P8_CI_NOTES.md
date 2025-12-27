# CI Notes (P8)

Local equivalents for the CI workflows:

## Gate workflow
```bash
python -m pip install -e .
lake exe cache get
python tools/make_rational_bounds.py
python tools/make_certificate_values.py
python tools/make_rms_context.py
python tools/check_rms_context.py
python tools/make_beta_certificate.py
LAKE_JOBS=1 lake build ERURH
LAKE_JOBS=1 python scripts/verify_gate.py --skip-pytests
```

## NOAX workflow
```bash
python tools/check_no_noncore_axioms.py
```
