---
name: vue-sfc-i18n-translation
description: Translate Vue Single File Component pages and components to vue-i18n by replacing hardcoded user-facing strings with translation keys while preserving behavior. Use when the task is specifically about Vue internationalization, whether translations live in local SFC blocks or central locale files.
---

# Vue SFC i18n Translation

Use this skill for Vue internationalization work. Translate one page or component at a time and keep runtime behavior unchanged.

Do not use this skill as the primary guide for broader refactors unless the main task is replacing hardcoded user-facing text.

## Workflow
1. Detect the project's i18n setup before editing:
- local SFC i18n blocks or central message files
- locale file format and naming style
- key naming conventions: flat or grouped
- locales currently supported
2. Follow the existing i18n pattern. If no clear convention exists, choose one consistent approach for the touched scope:
- grouped namespace per page/component
- local SFC i18n blocks for page-local strings
- central messages only for shared/common strings
3. Inspect the target file and list hardcoded user-facing strings in:
- template text
- button labels and select options
- placeholders, titles, and aria labels
- empty states, validation, toasts, and error messages
4. Add `useI18n()` only where needed and replace hardcoded UI strings with `t(...)`.
5. Preserve existing control flow, defaults, payloads, and non-UI constants.
6. Re-scan the file for remaining hardcoded user-facing strings.
7. Run a targeted verification step for the frontend app.

## Translation Rules
- Translate only user-facing UI strings.
- Do not move API values, enum-like constants, analytics event names, or backend payload literals into i18n.
- Prefer existing namespaces and key styles over inventing a new convention.
- If grouping is used, keep keys stable and predictable, for example `pageName.title`, `pageName.actions.save`.
- Use params for interpolation, for example `t('notifications.syncSuccess', { name: workoutName.value })`.
- Prefer bound attributes such as `:title`, `:placeholder`, and `:aria-label` when introducing `t(...)`.

## SFC vs Central Messages
- Prefer local SFC i18n blocks when the repo already uses them for page-local strings.
- Prefer central locale files when the project standardizes on global messages.
- Do not mix patterns inside the same feature without a reason.

## Locale Selection
- Use the locales already supported by the project.
- If the project does not make this clear, preserve the existing source language and add English only when that matches the repo's current direction.
- Ask the user only if locale choice is genuinely ambiguous and materially affects the result.

## YAML and Message Pitfalls
- Quote YAML strings containing `:` or `&`.
- Avoid raw `<...>` tokens in messages when vue-i18n HTML checks would treat them as HTML.
- Store angle-bracket tokens as escaped text such as `&lt;n&gt;` and decode only at runtime when literal output is required.

Example:

```ts
const aiInstructions = computed(() => t('workoutBuilder.ai.instructionsText'))
const aiInstructionsForClipboard = computed(() =>
  aiInstructions.value.replace(/&lt;/g, '<').replace(/&gt;/g, '>')
)
```

## Verification
- Run the smallest useful check, typically frontend typecheck, test, or build.
- Fix introduced i18n, YAML, and type errors before finishing.
- Re-scan the touched file for remaining hardcoded user-facing strings.

## Output
Report:
- i18n pattern detected
- files and locales updated
- notable strings translated
- verification performed
