#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

mkdir -p dist

rsync -a --delete \
  "${ROOT}/site/" "${ROOT}/dist/"

echo "Built dist/ ($(find dist -type f | wc -l | tr -d ' ') files)"
