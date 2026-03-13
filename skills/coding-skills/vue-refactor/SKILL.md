# Vue Refactor Skill

## Purpose

Improve maintainability of existing Vue code.

Triggers when:

- editing components
- adding features
- reviewing code

---

# Refactor Rules

## Large Components

If component >200 lines:

→ split into smaller components

---

## Duplicate Logic

If identical logic appears in multiple components:

→ extract composable

Example:

src/composables/usePagination.ts

---

## Duplicate UI

If identical markup appears multiple times:

→ extract component

---

## Improve Prop Interfaces

Replace complex props with slots when appropriate.

---

## Simplify State

Prefer:

computed
derived state

Avoid unnecessary watchers.

---

## Remove Dead Code

Remove:

unused props
unused imports
unused variables

---

# Improve Readability

Rename unclear variables.

Bad:

data

Good:

userProfile

---

# Extract Reusable Components

Look for patterns:

cards
lists
headers
forms

Extract reusable components where possible.
