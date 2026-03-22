---
name: vue-component-deduplicator
description: Detect and reduce unnecessary Vue component duplication before creating new components or when consolidating overlapping components. Use when the task is specifically about reuse, consolidation, or duplicate UI patterns.
---

# Vue Component Deduplicator

Use this skill when deciding whether to reuse an existing component, extend one, or merge overlapping components.

Do not use this skill as the primary guide for routine component edits or page architecture work unless duplication is the main concern.

## Workflow
1. Search for relevant components in the repo's actual component locations.
2. Compare candidate components by:
- purpose and user-facing role
- public API: props, emits, slots
- visual structure and states
- accessibility semantics
- styling/theming constraints
- usage breadth across the app
3. Decide whether the right action is:
- reuse as-is
- extend an existing component
- extract a shared primitive
- keep separate components
4. If consolidating, migrate callers carefully and verify behavior.

## Search Guidance
- Start with the project's established component folders.
- Common locations include `src/components`, feature folders, route-level component folders, and UI-library wrappers.
- Do not assume every project uses `ui`, `layout`, or `sections` directories.

## Duplication Decision Rules

### Reuse an Existing Component When
- purpose is the same
- required states and interactions already exist
- differences are cosmetic or small configuration changes

### Extend an Existing Component When
- one component already covers most behavior
- the new requirement can be added without making the API confusing
- slots or a small prop addition would keep the abstraction clear

### Extract a Shared Primitive When
- two or more components share structure but serve different product concepts
- a lower-level part can be reused without forcing unrelated screens onto one abstraction

### Keep Separate Components When
- semantics differ meaningfully
- accessibility roles or interactions differ
- styling and layout constraints are domain-specific
- merging would create a vague "god component"

## Consolidation Rules
- Do not merge solely because names or markup look similar.
- Prefer preserving the clearer public API over maximizing reuse.
- Canonical names should emerge from the local codebase; do not rename broadly without value.
- If removing duplicates, choose the version with the best API, tests, accessibility, and adoption path.

## Verification
- Re-check all migrated usages.
- Run targeted tests, lint, or typecheck where available.
- Confirm no caller lost behavior, states, or accessible labeling.

## Output
Report:
- components inspected
- reuse/extend/extract/keep-separate decision
- migrations performed
- verification performed
