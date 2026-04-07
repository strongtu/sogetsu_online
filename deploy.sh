#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

"$ROOT/build.sh"

REMOTE="${DEPLOY_REMOTE:-ubuntu@sogetsu.online}"
REMOTE_PATH="${DEPLOY_PATH:-~/cdn}"

echo "Deploying dist/ -> ${REMOTE}:${REMOTE_PATH}/ ..."
rsync -avz --progress \
  -e ssh \
  "${ROOT}/dist/" "${REMOTE}:${REMOTE_PATH}/"

echo "Done."
