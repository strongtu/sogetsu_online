#!/usr/bin/env bash
# 以本机 cdn 目录为准同步到本仓库根目录（保留 .git）
set -euo pipefail
CDN="${CDN:-/home/ubuntu/cdn}"
ROOT="$(cd "$(dirname "$0")" && pwd)"
rsync -a --delete --exclude='.git' "${CDN}/" "${ROOT}/"
echo "Synced ${CDN}/ -> ${ROOT}/ (git metadata preserved). Review and: git add -A && git commit && git push"
