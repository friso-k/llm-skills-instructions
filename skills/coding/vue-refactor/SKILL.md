---
name: vue-refactor
description: Refactor existing Vue code for maintainability while preserving behavior and public APIs. Use when improving structure, readability, or reuse in existing Vue components, composables, and related files.
---

# Vue Refactor

Use this skill for maintainability-focused changes to existing Vue code.

Do not use this skill as the primary guide when the task is mostly new feature implementation, page architecture design, or translation to vue-i18n.

## Workflow
1. Understand the current behavior before editing:
- component responsibilities
- public props/emits/slots
- shared dependencies
- existing tests and usage sites
2. Identify the specific refactor target:
- oversized component
- duplicated logic
- duplicated UI
- confusing state flow
- dead code or naming problems
3. Apply the smallest refactor that meaningfully improves clarity.
4. Preserve behavior and public APIs unless the user asked for breaking cleanup.
5. Verify the touched flows with the smallest reliable checks available.

## Refactor Rules

### Large or Mixed-Responsibility Components
- Split components when size is causing multiple responsibilities, poor readability, or hard testing.
- Do not split solely because a file crosses an arbitrary line threshold.
- When extracting page-specific pieces, group them in a dedicated subfolder owned by that page.

### Duplicate Logic
- Extract repeated stateful logic into a composable when that improves reuse and naming clarity.
- Keep feature-specific logic local if extraction would create weak abstractions.

### Duplicate UI
- Extract repeated UI when the shared structure and semantics are genuinely the same.
- If only a sub-part is shared, extract that sub-part instead of forcing a large common component.

### State Simplification
- Prefer derived state over mirrored state.
- Remove unnecessary watchers or intermediate refs that only restate other values.
- Keep imperative watchers when they drive side effects or external integrations.

### API and Readability Cleanup
- Clarify prop names, local variable names, and helper naming when current names hide intent.
- Replace awkward prop shapes with clearer interfaces only when the migration cost is justified.
- Use slots when they make the component more composable, not by default.

### Dead Code Removal
- Remove unused imports, props, variables, branches, and obsolete helpers once confirmed safe.
- Check templates and indirect usage before deleting exports or props.

## Verification
- Prefer targeted tests for affected behavior.
- Run lint, typecheck, or build checks when available and proportionate.
- Revisit caller sites after API-adjacent refactors.

## Output
Report:
- refactor targets addressed
- behavior/API preservation assumptions
- verification performed
