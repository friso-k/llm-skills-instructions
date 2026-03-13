# Vue Page Architecture Skill

## Purpose

Create or modify Vue pages while enforcing a clean component architecture.

The goal is to:

- maximize reusable components
- prevent duplicated markup
- keep pages thin orchestration layers
- enforce a predictable folder structure

---

# Core Principles

1. Reuse existing components before creating new ones
2. Pages orchestrate components, not markup
3. Extract repeated UI into components
4. Component scope determines location

---

# Step 1 — Scan Existing Components

Search these locations:

src/components
src/components/ui
src/components/layout
src/components/sections
src/pages/**/components

Record:

- name
- props
- slots
- location

If a suitable component exists, reuse it.

---

# Step 2 — Analyze Page Structure

Break the page into logical sections.

Example:

Header
Hero
Stats
Feature Grid
Form
Footer

Each section must map to:

- existing component
- or new component

---

# Step 3 — Reuse First

For every section:

IF component exists
→ reuse

ELSE
→ create reusable component

Never inline complex sections in the page.

---

# Step 4 — Determine Component Scope

## Global Components

Reusable across many pages.

Location:

src/components/

Examples:

AppHeader.vue
AppFooter.vue
NavigationMenu.vue

---

## UI Components

Generic building blocks.

Location:

src/components/ui/

Examples:

Button.vue
Card.vue
Badge.vue
Modal.vue

---

## Layout Components

Reusable layout structures.

Location:

src/components/layout/

Examples:

DashboardLayout.vue
SidebarLayout.vue

---

## Section Components

Reusable page sections.

Location:

src/components/sections/

Examples:

HeroSection.vue
FeatureGrid.vue
StatsSection.vue

---

## Page-Specific Components

Used only by one page.

Location:

src/pages/<page>/components/

Example:

src/pages/dashboard/components/ActivityFeed.vue

Rule:

IF used by only one page
→ keep local

---

# Step 5 — Component Design Rules

Short content → props

Example:

<FeatureCard title="Fast" description="Optimized performance" />

Long content → slots

Example:

<Card>
  <template #title>Title</template>
  <p>Body</p>
</Card>

Content that might contain components → slots

---

# Step 6 — Page Composition

Pages orchestrate components.

Example:

<AppHeader />

<StatsSection />

<FeatureGrid />

Pages must not contain large UI blocks.

---

# Step 7 — Duplicate Detection

If identical markup appears ≥ 2 times:

→ extract reusable component

---

# Naming

Global components:

AppHeader
AppFooter

Sections:

HeroSection
StatsSection

UI:

Button
Card

---

# Output

The agent must report:

Components created
Components reused
Files modified
