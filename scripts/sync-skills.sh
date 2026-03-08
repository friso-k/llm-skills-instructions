#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="${SKILLS_DIR:-$ROOT_DIR/skills}"

# Source groups can be overridden via SOURCE_GROUPS (space-separated names).
DEFAULT_SOURCE_GROUPS=("coding-skills" "communication-skills" "communication-skill")

if [[ -n "${SOURCE_GROUPS:-}" ]]; then
  # shellcheck disable=SC2206
  SOURCE_GROUPS=( ${SOURCE_GROUPS} )
else
  SOURCE_GROUPS=("${DEFAULT_SOURCE_GROUPS[@]}")
fi

TARGET_DIRS=(
  "${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
  "${OPENCODE_SKILLS_DIR:-$HOME/.config/opencode/skills}"
  "${GEMINI_SKILLS_DIR:-$HOME/.gemini/skills}"
)

log() {
  printf '[sync-skills] %s\n' "$*"
}

require_dir() {
  local dir="$1"
  if [[ ! -d "$dir" ]]; then
    log "Missing directory: $dir"
    exit 1
  fi
}

copy_group_to_target() {
  local group_dir="$1"
  local target_root="$2"

  mkdir -p "$target_root"
  cp -R "$group_dir"/. "$target_root"/
}

require_dir "$SKILLS_DIR"

existing_groups=()
for group in "${SOURCE_GROUPS[@]}"; do
  candidate="$SKILLS_DIR/$group"
  if [[ -d "$candidate" ]]; then
    existing_groups+=("$candidate")
  else
    log "Skipping missing source group: $candidate"
  fi
done

if [[ ${#existing_groups[@]} -eq 0 ]]; then
  log "No source groups found under $SKILLS_DIR"
  exit 1
fi

for target in "${TARGET_DIRS[@]}"; do
  log "Syncing to $target"
  for group_dir in "${existing_groups[@]}"; do
    log "  Copying $(basename "$group_dir")"
    copy_group_to_target "$group_dir" "$target"
  done
done

log "Done"
