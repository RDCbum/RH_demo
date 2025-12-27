# arXiv Release Checklist

- Commit: 3a9ef09cf0dcec77e7c4d11a0b38f349235aa566
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
- RB32 tarball list: [x] logged (docs/core/RB32_TARBALL_LIST.txt)
- RB45 tarball list: [x] logged (docs/core/RB45_TARBALL_LIST.txt)
- Lemma B.1 proof (paper): [x] added (arxiv_submission/ERURH_Conditional_Proof.tex, Section~\ref{sec:no-supercritical})
