#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SRC_DIR="${REPO_ROOT}/skills"

CODEX_DEST="${CODEX_HOME:-${HOME}/.codex}/skills"
OPENCODE_DEST="${HOME}/.config/opencode/skills"

mkdir -p "${CODEX_DEST}" "${OPENCODE_DEST}"

# Only copy first-level folders under ./skills.
for skill_dir in "${SRC_DIR}"/*; do
  [[ -d "${skill_dir}" ]] || continue
  skill_name="$(basename "${skill_dir}")"

  rm -rf "${CODEX_DEST:?}/${skill_name}" "${OPENCODE_DEST:?}/${skill_name}"
  cp -R "${skill_dir}" "${CODEX_DEST}/${skill_name}"
  cp -R "${skill_dir}" "${OPENCODE_DEST}/${skill_name}"
done

echo "Copied skills to:"
echo "- ${CODEX_DEST}"
echo "- ${OPENCODE_DEST}"
