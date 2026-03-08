---
name: coding-skills
description: Coding skill set focused on Vue Single File Component i18n translation by replacing hardcoded UI strings with t(...) keys while preserving behavior.
---

# Coding Skills

Translate one Vue page at a time and keep behavior unchanged.

## Workflow
1. Detect the project i18n setup before editing:
- local SFC blocks (`<i18n ...>`) or central message files
- key naming style (flat keys vs grouped namespaces)
- locales currently supported
2. If no clear convention exists, choose this default and keep it consistent:
- grouped namespace per page/component (`pageName.*`)
- local SFC i18n blocks (preferred)
- central messages for shared/common strings
3. Inspect the target page and list hardcoded user-facing strings in:
- template text
- placeholders/titles/aria labels
- toast and error messages
- button labels and select options
4. Add `useI18n()` in `<script setup>` and use `const { t } = useI18n()`.
5. Replace hardcoded strings with `t('namespace.key')`.
6. Store translations in local SFC i18n blocks by default.
7. Use central locale files only when the project already enforces global messages.
8. If locales are unclear, ask for preferred locales or default to one source locale plus English.
9. Keep existing runtime behavior unchanged:
- preserve existing conditional logic
- preserve toasts and validation behavior
- preserve default values and API payloads
10. Run a build check for the frontend app.

## Key Rules
- Prefer local SFC i18n blocks.
- If the project already enforces central locale files, follow that rule instead of mixing patterns.
- Use one namespace per page/component when grouping is used, e.g. `workoutBuilder.*`.
- Keep key names stable and grouped (`title`, `description`, `form`, `actions`, `notifications`) unless the project uses flat keys.
- Prefer `:title`, `:subtitle`, `:placeholder`, `:aria-label` bindings in template.
- For interpolated toasts use params: `t('...syncSuccess', { name: workoutName.value })`.

## YAML and i18n Pitfalls
- Quote YAML strings that contain `:` or `&`.
- Do not place raw `<...>` tokens in messages because vue-i18n HTML checks will fail.
- Store angle-bracket tokens as escaped text (`&lt;n&gt;`) in i18n strings.
- If clipboard output must contain `<n>`, decode before writing to clipboard.

Clipboard decode example:

```ts
const aiInstructions = computed(() => t('workoutBuilder.ai.instructionsText'))
const aiInstructionsForClipboard = computed(() =>
  aiInstructions.value.replace(/&lt;/g, '<').replace(/&gt;/g, '>')
)
```

## Verification
- Run `npm run build` in `app/`.
- If build fails, fix i18n/yaml/type errors before finishing.
- Re-scan target page for remaining hardcoded user-facing strings.
