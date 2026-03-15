# llm-skills-instructions

Central repository for reusable LLM agent skills. The repo stores skill definitions in version control and provides a script to sync them into local agent skill folders.

## Repository layout

```text
skills/
  coding-skills/
    vue-best-practices/
    vue-component-deduplicator/
    vue-page-architecture/
    vue-refactor/
    vue-sfc-i18n-translation/
scripts/
  sync-skills.sh
```

Each skill lives in its own folder and is defined by a `SKILL.md` file.

## Current skills

- `vue-best-practices`
- `vue-component-deduplicator`
- `vue-page-architecture`
- `vue-refactor`
- `vue-sfc-i18n-translation`

## Sync skills to local agents

Run:

```bash
./scripts/sync-skills.sh
```

What the script does:

1. Prompts for confirmation.
2. Creates local skill directories if they do not exist.
3. Removes existing skill contents from each target directory.
4. Copies everything from `./skills/` into each target.

Current sync targets:

- `~/.codex/skills`
- `~/.config/opencode/skills`
- `~/.gemini/skills`
- `~/.qwen/skills`

## Important behavior

The sync script is destructive for the target folders. It clears their existing contents before copying the skills from this repository.

## Updating or adding skills

1. Create or edit a skill under `skills/<group>/<skill-name>/`.
2. Store the instructions in `SKILL.md`.
3. Run `./scripts/sync-skills.sh` to publish the updated skill set to your local agent directories.
