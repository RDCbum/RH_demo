# arXiv Release Checklist

- Commit: 59aaeaf8ff0ff2a26500aadc4606c148232ebf32
- Pipeline commands (README/AGENTS):
  - python tools/make_rational_bounds.py
  - python tools/make_certificate_values.py
  - lake build ERURH
  - python scripts/verify_gate.py --skip-pytests
- lake build ERURH: [x] verified in this release run
- Paper build (CI or local): [ ] verified (CI: build-paper workflow or local latexmk)
- Tarball contents: see dist/arxiv_submission.tar.gz (list with tar -tf)
