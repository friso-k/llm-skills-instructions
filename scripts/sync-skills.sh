#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SRC_DIR="${REPO_ROOT}/skills"

CODEX_DEST="${CODEX_HOME:-${HOME}/.codex}/skills"
OPENCODE_DEST="${HOME}/.config/opencode/skills"

mkdir -p "${CODEX_DEST}" "${OPENCODE_DEST}"

cp -R "${SRC_DIR}/." "${CODEX_DEST}/"
cp -R "${SRC_DIR}/." "${OPENCODE_DEST}/"

echo "Copied skills to:"
echo "- ${CODEX_DEST}"
echo "- ${OPENCODE_DEST}"
