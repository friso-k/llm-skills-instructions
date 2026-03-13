# Vue Component Deduplicator Skill

## Purpose

Prevent component duplication across the codebase.

This skill detects when new components are unnecessary because a similar one already exists.

---

# Component Similarity Detection

Before creating a component:

Search:

src/components
src/components/ui
src/components/sections

Compare:

- name
- structure
- props
- slots
- purpose

---

# Similarity Rules

Two components are considered duplicates if:

- markup structure is similar
- props overlap significantly
- purpose is identical

Example duplicates:

Hero.vue
HeroSection.vue
HeroBanner.vue

These should be merged.

---

# Merge Strategy

If duplicate detected:

1. reuse existing component
2. extend props if necessary
3. add slots if flexibility required

Do not create new component.

---

# Naming Normalization

Prefer canonical names:

AppHeader
HeroSection
FeatureGrid
StatsCard

Avoid variants.

---

# Component Registry

Maintain mental registry of major components.

Examples:

AppHeader
Card
Button
HeroSection
FeatureGrid

Reuse these before creating new ones.

---

# Refactor Duplicates

If duplicates already exist:

choose best version
migrate usages
delete others
