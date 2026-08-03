# Native Select


A native `<select>` element styled by Basecoat. Use when you want native browser behavior, mobile-optimized pickers, and full form integration without JavaScript.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `class="select"`
- **Native element:** `<select>`

When to use Native Select vs [Select](./select.md):

- Use **Native Select** for native browser behavior, form integration, and mobile-optimized pickers.
- Use **Select** for custom option content, multi-select behavior, async loading, or JavaScript APIs.

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/native-select";
@import "basecoat-css/styles/vega";
```

## Sizes

| Size | Markup | Description |
|---|---|---|
| Default | `<select class="select">` | Default size. |
| Small | `<select class="select" data-size="sm">` | Compact size. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-size` | `"sm"` | Small size variant. |

## HTML structure

```html
<select class="select" aria-label="Fruit">
  <option value="">Select a fruit</option>
  <option value="apple">Apple</option>
  <option value="banana">Banana</option>
</select>
```

- `<select class="select">` — the control
- `<option>` — selectable option
- `<optgroup>` — optional group of options

## Examples

### Basic

```html
<select class="select w-full" aria-label="Fruit">
  <option value="">Select a fruit</option>
  <option value="apple">Apple</option>
  <option value="banana">Banana</option>
  <option value="blueberry">Blueberry</option>
  <option value="pineapple">Pineapple</option>
</select>
```

### With groups

```html
<select class="select w-full" aria-label="Food">
  <option value="">Select food</option>
  <optgroup label="Fruits">
    <option value="apple">Apple</option>
    <option value="banana">Banana</option>
    <option value="blueberry">Blueberry</option>
  </optgroup>
  <optgroup label="Vegetables">
    <option value="carrot">Carrot</option>
    <option value="potato">Potato</option>
    <option value="tomato">Tomato</option>
  </optgroup>
</select>
```

### Disabled

```html
<select class="select w-full" aria-label="Fruit" disabled>
  <option value="">Select a fruit</option>
  <option value="apple">Apple</option>
  <option value="banana">Banana</option>
</select>
```

### Invalid

```html
<div role="group" class="field" data-invalid="true">
  <label for="native-select-invalid">Fruit</label>
  <select id="native-select-invalid" class="select w-full" aria-invalid="true" aria-describedby="native-select-invalid-error">
    <option value="">Select a fruit</option>
    <option value="apple">Apple</option>
  </select>
  <p id="native-select-invalid-error" role="alert">Select a fruit to continue.</p>
</div>
```

### Sizes

```html
<div class="flex flex-wrap items-center gap-3">
  <select class="select w-42" aria-label="Default size">
    <option>Default</option>
    <option>Apple</option>
    <option>Banana</option>
  </select>
  <select class="select w-42" data-size="sm" aria-label="Small size">
    <option>Small</option>
    <option>Apple</option>
    <option>Banana</option>
  </select>
</div>
```

### In a field

```html
<div role="group" class="field">
  <label for="department">Department</label>
  <select id="department" class="select w-full" aria-describedby="department-description">
    <option value="">Choose department</option>
    <option value="engineering">Engineering</option>
    <option value="design">Design</option>
  </select>
  <p id="department-description">Select your department or area of work.</p>
</div>
```

### RTL

```html
<select dir="rtl" class="select w-full" aria-label="الفاكهة">
  <option value="">اختر فاكهة</option>
  <option value="apple">تفاح</option>
  <option value="banana">موز</option>
  <option value="blueberry">توت</option>
</select>
```

## Accessibility

- Always provide an accessible label: a `<label for>` matching the `id`, or `aria-label` / `aria-labelledby`.
- Use `<optgroup label="...">` to group related options. Screen readers will announce the group label.
- For invalid state, add `aria-invalid="true"` to the `<select>` and connect the error message with `aria-describedby`.
- For disabled state, use the `disabled` attribute.
- Native selects have built-in keyboard support (arrow keys, type-to-search, `Esc` to close) provided by the browser.

## Gotchas

- The styling is on the `class="select"` attribute. You must add `class="select"` to the `<select>`.
- Don't put non-`<option>` or non-`<optgroup>` elements inside `<select>`. The browser will not render them.
- For custom option content (icons, images, rich HTML), use [Select](./select.md) instead. Native `<option>` only supports plain text.
- For multi-select, use the `multiple` attribute on the native `<select>`. The Basecoat-styled native select supports this, but for a richer multi-select experience, use [Select](./select.md) with `data-multiselectable`.
- For very long lists, native selects on mobile may be harder to navigate. Consider a search-enabled custom select (e.g., [Combobox](./combobox.md) or [Select](./select.md)).
- Use `data-size="sm"` for compact contexts. The browser's mobile picker is unaffected by the size — it always shows the native picker.
