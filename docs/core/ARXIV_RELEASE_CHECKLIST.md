# arXiv Release Checklist

- Commit: 049483df19261766c6f32c3707fa9d408f3ae9cd
- Pipeline commands (README/AGENTS):
  - python tools/make_rational_bounds.py
  - python tools/make_certificate_values.py
  - lake build ERURH
  - python scripts/verify_gate.py --skip-pytests
- lake build ERURH: [x] verified in this release run
- Paper build (CI or local): [ ] verified (CI: build-paper workflow or local latexmk)
- Tarball contents: see dist/arxiv_submission.tar.gz (list with tar -tf)
