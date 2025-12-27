from pathlib import Path


def test_gate_artifacts_exist() -> None:
    repo_root = Path(__file__).resolve().parents[1]
    expected = [
        repo_root / "data" / "docs" / "paper" / "rational_bounds.json",
        repo_root / "data" / "docs" / "paper" / "certificate_values.json",
        repo_root / "data" / "docs" / "paper" / "rms_context.json",
        repo_root / "data" / "docs" / "paper" / "beta_certificate.json",
    ]
    missing = [path for path in expected if not path.exists()]
    assert not missing, f"missing gate artifacts: {missing}"
