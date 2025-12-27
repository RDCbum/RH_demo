# arXiv Release Checklist

- Commit: f81a7831ba7906b8c959cf742f3b198a6f72aeb3
- Pipeline commands (README/AGENTS):
  - python tools/make_rational_bounds.py
  - python tools/make_certificate_values.py
  - lake build ERURH
  - python scripts/verify_gate.py --skip-pytests
- lake build ERURH: [x] verified in this release run
- verify_gate.py --skip-pytests: [x] verified in this release run
- RB22 no_supercritical_beta attempt: [x] logged (docs/core/RB22_NoSupercritical_Try.log)
- Paper build (CI or local): [ ] verified (CI: build-paper workflow or local latexmk)
- Tarball contents: [x] verified (tar -tf dist/arxiv_submission.tar.gz)
