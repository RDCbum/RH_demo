param(
  [string]$OutputPath = "dist/arxiv_submission.tar.gz"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = (Get-Location).Path
$srcDir = Join-Path $repoRoot "arxiv_submission"
$distDir = Join-Path $repoRoot "dist"

if (-not (Test-Path $srcDir)) {
  throw "Missing arxiv_submission directory: $srcDir"
}

# Clean common TeX build artifacts inside arxiv_submission.
$patterns = @("*.aux", "*.log", "*.out", "*.toc", "*.fls", "*.fdb_latexmk")
foreach ($pattern in $patterns) {
  Get-ChildItem -Path $srcDir -Recurse -Filter $pattern -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
}

# Ensure required files exist.
$required = @(
  "lean_master_statement.txt",
  "lean_master_axioms.txt",
  "assumptions_ledger.tex",
  "ERURH_Conditional_Proof.tex"
)
foreach ($file in $required) {
  $path = Join-Path $srcDir $file
  if (-not (Test-Path $path)) {
    throw "Missing required file in arxiv_submission: $file"
  }
}

New-Item -ItemType Directory -Force $distDir | Out-Null

# Create tarball from arxiv_submission/.
if (Test-Path $OutputPath) {
  Remove-Item $OutputPath -Force
}

tar -czf $OutputPath -C $srcDir .

Write-Host "Created: $OutputPath"
