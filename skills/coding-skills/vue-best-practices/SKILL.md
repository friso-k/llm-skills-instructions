---
name: vue-best-practices
description: Apply modern Vue implementation practices when creating or editing Vue components and composables. Use for code generation and routine component work, not for broad architecture refactors, deduplication passes, or i18n-only tasks.
---

# Vue Best Practices

Use this skill for normal Vue implementation work: new components, component edits, composables, and routine cleanup.

Do not use this skill as the primary guide when the task is mainly:
- reorganizing page/component boundaries
- deduplicating existing components across the app
- translating UI strings to vue-i18n

## Workflow
1. Inspect the local conventions before editing:
- Composition API vs Options API
- TypeScript usage
- folder and naming patterns
- UI library, state, and form patterns already in use
2. Match the project conventions unless there is a clear reason to improve them.
3. Apply the implementation rules below while preserving behavior and public APIs.
4. Run the smallest useful verification for the change:
- existing tests for touched code
- lint or typecheck if available
- targeted build check when needed

## Implementation Rules

### Follow Existing Project Style First
- Prefer the dominant style already used in the touched area.
- For new Vue 3 code, default to `<script setup lang="ts">` unless the project or file clearly uses another pattern.
- Do not rewrite stable Options API components just to satisfy style preferences unless the user asks for migration.

### Keep Components Focused
- Prefer components that have one clear responsibility.
- If a file is hard to scan or mixes orchestration, rendering, and business rules, split it.
- Use line-count thresholds as signals, not hard rules.

### Prefer Derived State Over Synchronization
- Use `computed` for values derived from other reactive state.
- Use `watch` only for side effects, async reactions, or imperative integration points.
- Avoid watchers that merely keep duplicated state in sync.

### Keep Templates Readable
- Move heavy conditions, filtering, formatting, and mapping out of the template when that improves readability.
- Small inline expressions are fine; do not extract trivial logic just to satisfy a rule.

### Props, Emits, and Slots
- Use explicit props and emits interfaces.
- Prefer props for simple data and configuration.
- Prefer slots when the caller must control markup or pass nested components.
- Do not replace a clear prop API with slots unless flexibility is actually needed.

### Reuse Logic Carefully
- Extract a composable when logic is reused or when a component becomes easier to understand by separating stateful behavior.
- Place composables where the repo expects them. If there is no established pattern, `src/composables/` is a reasonable default.

### Avoid Unnecessary Prop Drilling
- First check whether passing props is still the clearest option.
- Consider slots, a composable, or shared state only when prop chains become awkward.
- Use `provide/inject` for tightly related component trees, not as a default replacement for normal props.

### Naming and File Structure
- Match the repo's naming conventions for components, composables, and directories.
- If no convention is visible, use:
- PascalCase for components
- `useSomething.ts` for composables
- Keep block order consistent with the repo. If there is no local convention, prefer `template`, `script`, `style` for Vue SFCs.

## Output
Report:
- conventions followed or inferred
- notable best-practice improvements applied
- verification performed
