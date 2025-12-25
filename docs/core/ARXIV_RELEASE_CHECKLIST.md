# arXiv Release Checklist

- Commit: e730645122b298f0e319f025ffc0944909f4b67e
- Pipeline commands (README/AGENTS):
  - python tools/make_rational_bounds.py
  - python tools/make_certificate_values.py
  - lake build ERURH
  - python scripts/verify_gate.py --skip-pytests
- lake build ERURH: [ ] verified in this release run
- Paper build (CI or local): [ ] verified (CI: build-paper workflow or local latexmk)
- Tarball contents: see dist/arxiv_submission.tar.gz (list with tar -tf)
