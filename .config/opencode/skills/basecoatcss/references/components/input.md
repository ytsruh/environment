# Input


A native `<input>` element styled by Basecoat. Supports text, email, password, search, file, and other text-like input types.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `class="input"`
- **Native element:** `<input>`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/input";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<input class="input" type="email" placeholder="Email" />
```

For richer layouts, use a `.field` wrapper:

```html
<div role="group" class="field">
  <label for="email">Email</label>
  <input id="email" class="input" type="email" />
  <p>Helper text</p>
</div>
```

## Examples

### Basic

```html
<input class="input" type="email" placeholder="Email" />
```

### With field (label + helper text)

```html
<div role="group" class="field">
  <label for="email">Email</label>
  <input id="email" class="input" type="email" placeholder="m@example.com" />
  <p>Enter your email address.</p>
</div>
```

### Field group (multiple inputs)

```html
<div class="grid gap-4">
  <div role="group" class="field">
    <label for="first-name">First name</label>
    <input id="first-name" class="input" type="text" placeholder="Jane" />
  </div>
  <div role="group" class="field">
    <label for="last-name">Last name</label>
    <input id="last-name" class="input" type="text" placeholder="Doe" />
  </div>
</div>
```

### Disabled

```html
<input class="input" type="email" placeholder="Email" disabled />
```

### Invalid

```html
<input class="input" type="email" placeholder="Email" aria-invalid="true" />
```

### File input

```html
<input class="input" type="file" />
```

### Inline (with button)

```html
<div class="flex items-center gap-2">
  <input class="input" type="search" placeholder="Search..." />
  <button type="submit" class="btn">Search</button>
</div>
```

### Grid layout

```html
<div class="grid gap-4 md:grid-cols-2">
  <input class="input" type="text" placeholder="First name" />
  <input class="input" type="text" placeholder="Last name" />
  <input class="input md:col-span-2" type="email" placeholder="Email" />
</div>
```

### Required (with visual indicator)

```html
<div role="group" class="field">
  <label for="required-username">Username <span class="text-destructive">*</span></label>
  <input id="required-username" class="input" type="text" placeholder="hunvreus" required />
</div>
```

### With badge in label

```html
<div role="group" class="field">
  <label for="badge-email" class="flex w-full items-center gap-2">
    Email
    <span class="badge ml-auto" data-variant="secondary">Recommended</span>
  </label>
  <input id="badge-email" class="input" type="email" placeholder="m@example.com" />
</div>
```

### With icon (manual positioning)

```html
<div class="relative">
  <input class="input ps-9" type="search" placeholder="Search..." />
  <div class="pointer-events-none absolute start-3 top-1/2 -translate-y-1/2 text-muted-foreground [&>svg]:size-4">
    <svg class="lucide lucide-search" ...></svg>
  </div>
</div>
```

For the recommended input-group pattern (with `data-align`), see [Input Group](./input-group.md).

### With button group

```html
<div role="group" aria-label="Search" class="button-group">
  <input class="input" type="search" placeholder="Search..." />
  <button type="submit" class="btn" data-variant="outline" data-size="icon" aria-label="Search">
    <svg class="lucide lucide-search" ...></svg>
  </button>
</div>
```

### Form

```html
<form class="space-y-6">
  <div role="group" class="field">
    <label for="form-username">Username</label>
    <input id="form-username" class="input" type="text" placeholder="hunvreus" required />
    <p>This is your public display name.</p>
  </div>
  <div role="group" class="field">
    <label for="form-email">Email</label>
    <input id="form-email" class="input" type="email" placeholder="m@example.com" required />
  </div>
  <button type="submit" class="btn">Submit</button>
</form>
```

### RTL

```html
<div role="group" class="field" dir="rtl">
  <label for="api-key">مفتاح API</label>
  <input id="api-key" class="input" type="password" placeholder="sk-..." />
  <p>مفتاح API الخاص بك مشفر ومخزن بأمان.</p>
</div>
```

## Accessibility

- Always pair with a `<label>` (using `for` matching the `id`) or `aria-label`.
- For invalid state, use `aria-invalid="true"` on the input and connect the error message with `aria-describedby`.
- For required fields, use both `required` and `aria-required="true"`. Add a visual indicator (`*`) to the label with `aria-hidden="true"`.
- For password inputs, consider adding an `autocomplete="current-password"` or `autocomplete="new-password"` attribute.
- Decorative icons should be `aria-hidden="true"`. The icon should not be the only way to identify the input (always provide a label).

## Gotchas

- The styling is on the `class="input"` attribute. You must add `class="input"` to the input.
- Inputs inside a `class="field"` container also receive the same styling automatically for common text-like input types (text, email, password, etc.). You don't need to add `class="input"` when the input is inside a `.field`.
- For icon positioning, prefer [Input Group](./input-group.md) with `data-align="start"` / `"end"`. The manual `relative` + `absolute` pattern is for advanced use cases only.
- For invalid state, the styling only applies when `aria-invalid="true"` is set. Without it, the input renders in the default state even if it's actually invalid (e.g., failed form submission).
- For button group patterns, use `<div role="group" class="button-group">` (see [Button Group](./button-group.md)).
- Use `ps-9` (padding-start) instead of `pl-9` (padding-left) for RTL-aware icon positioning.
