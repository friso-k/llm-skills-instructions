# Vue Best Practices Skill

## Purpose

Ensure all generated Vue code follows modern best practices.

Applies when:

- generating Vue components
- modifying components
- writing new logic

---

# Composition API Only

Always use:

<script lang="ts" setup>

Never use Options API.

Bad:

export default { data() {} }

---

# Props and Emits

Use defineProps and defineEmits.

Example:

const props = defineProps<{
  title: string
}>()

const emit = defineEmits<{
  (e: "click"): void
}>()

---

# Keep Components Small

Rule:

<150 lines preferred

If larger → split component. Split the logic in presentation and behaviour if the component is to large
and group the component and the logic in the same seperate folder.

---

# Prefer Computed Over Watch

Bad:

watch(foo, () => {
  bar.value = foo.value * 2
})

Good:

const bar = computed(() => foo.value * 2)

---

# Avoid Prop Drilling

Prefer:

provide/inject
composables

---

# Extract Composables

Shared logic must move to:

src/composables/

Example:

useUser.ts
usePagination.ts

---

# Prefer Slots Over Prop-Based Layout

Bad:

<Card title="hello" content="text" />

Good:

<Card>
  <h2>Hello</h2>
</Card>

---

# Avoid Complex Template Logic

Bad:

v-if="items.filter(x => x.active).length > 3"

Good:

const hasActiveItems = computed(() => ...)

---

# Naming

Components → PascalCase
Composables → useSomething.ts

---

# File Structure

Component file order:

1. script
2. template
3. style
