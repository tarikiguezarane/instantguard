#!/usr/bin/env bash
# Repository structure test: fails if a mandatory directory or file is missing, or if
# a forbidden file (environment file, trained model, raw dataset) is tracked by Git.
set -euo pipefail

cd "$(dirname "$0")/.."

required=(
  generator
  streams
  ml
  api
  dashboard
  infra
  docs
  .gitignore
  LICENSE
  README.md
  ROADMAP.md
  JOURNAL.md
)

status=0
for path in "${required[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "MISSING: $path"
    status=1
  fi
done

# Environment files may hold secrets; datasets and models are regenerated, never versioned.
forbidden=$(git ls-files | grep -E '((^|/)\.env$|^ml/data/|\.onnx$|\.joblib$)' || true)
if [[ -n "$forbidden" ]]; then
  echo "FORBIDDEN files tracked by Git:"
  echo "$forbidden"
  status=1
fi

if ! grep -q "MIT License" LICENSE; then
  echo "INVALID: LICENSE is not MIT"
  status=1
fi

if [[ $status -eq 0 ]]; then
  echo "Repository structure OK"
fi
exit $status
