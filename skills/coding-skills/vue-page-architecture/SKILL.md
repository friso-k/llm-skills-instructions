---
name: vue-page-architecture
description: Structure or restructure Vue pages into clear page, section, layout, and local component boundaries. Use when the task is mainly about page composition, component placement, and extraction of large page-level UI blocks.
---

# Vue Page Architecture

Use this skill when creating or reorganizing Vue pages so page files stay focused on orchestration rather than large embedded UI blocks.

Do not use this skill as the primary guide for small component edits, pure deduplication passes, or i18n-only work.

## Workflow
1. Inspect the local page and component architecture:
- route/page folder layout
- shared component locations
- page-local component patterns
- layout and shell patterns
2. Break the page into logical sections and responsibilities.
3. For each section, choose one of:
- reuse an existing component
- keep it inline because it is trivial
- extract a local page component
- extract a shared component
4. Place new components according to actual reuse scope.
5. Verify imports, ownership boundaries, and page behavior after extraction.

## Architecture Principles
- Pages should orchestrate data loading, state ownership, and section composition.
- Repeated or bulky UI should usually live outside the page file.
- Trivial markup can stay inline when extraction would add indirection without value.
- Reuse existing components before creating new ones.

## Choosing Component Scope

### Keep Inline When
- markup is small and page-specific
- extraction would not improve readability or reuse

### Use a Page-Local Component When
- the block is only used by one page or route area
- it has meaningful complexity or repeated markup within that page

### Use a Shared Component When
- the block is reused across multiple pages/features
- the abstraction has a clear API and stable responsibility

### Use Existing Layout Patterns When
- the repo already has layout shells or route wrappers
- the new page fits those patterns without forcing special cases

## Design Rules
- Prefer props for simple content and configuration.
- Prefer slots when callers need markup control or nested components.
- Avoid extracting components that merely pass through page state without reducing complexity.
- Keep ownership of async data, mutations, and route state at the highest sensible level.
- For Vue SFC pages and page-local components, keep block order consistent with the repo. If there is no local convention, prefer `template`, `script`, `style`.

## Repo Structure Guidance
- Follow the repo's existing structure first.
- If no pattern exists, reasonable defaults are:
- shared components in a common components area
- page-only components near the page that owns them
- layouts in the app's existing layout mechanism

## Verification
- Verify the page still renders the same sections and states.
- Check that extracted components have clear names and stable inputs.
- Run targeted tests, lint, typecheck, or build steps when available.

## Output
Report:
- components reused
- components extracted and why
- scope decisions made
- verification performed
