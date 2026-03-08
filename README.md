# llm-skills-instructions

## Sync skills to Codex, OpenCode, and Gemini

Copy skill groups from this repo into all three agent folders:

```bash
scripts/sync-skills.sh
```

Default source groups under `skills/`:
- `coding-skills`
- `communication-skills`
- `communication-skill`

Targets:
- `~/.codex/skills`
- `~/.config/opencode/skills`
- `~/.gemini/skills`

## Clear target skill folders (with confirmation)

```bash
scripts/clear-skill-targets.sh
```

This script prompts for confirmation (`CLEAR`) before removing all contents inside each target folder.
