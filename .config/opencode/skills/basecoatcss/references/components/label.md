# Label


A styled `<label>` element for form controls. Use inside a [Field](./field.md) wrapper for proper layout and accessibility.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.label`
- **Native element:** `<label>`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/label";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<label class="label" for="email">Your email address</label>
<input class="input" id="email" type="email" placeholder="name@example.com" />
```

For label + control in a row:

```html
<label class="label gap-2">
  <input type="checkbox" class="input" />
  Accept terms and conditions
</label>
```

## Examples

### Basic label

```html
<label class="label" for="email">Your email address</label>
<input class="input" id="email" type="email" placeholder="name@example.com" />
```

### With required indicator

```html
<div role="group" class="field">
  <label class="label" for="username">Username <span class="text-destructive">*</span></label>
  <input class="input" id="username" type="text" required />
</div>
```

### With badge

```html
<div role="group" class="field">
  <label class="label flex w-full items-center gap-2" for="email">
    Email
    <span class="badge ml-auto" data-variant="secondary">Recommended</span>
  </label>
  <input class="input" id="email" type="email" />
</div>
```

### Wrapping a control (label + checkbox inline)

```html
<label class="label gap-2">
  <input type="checkbox" class="input" />
  Accept terms and conditions
</label>
```

### RTL

```html
<div class="grid gap-3" dir="rtl">
  <label class="label" for="email-rtl">البريد الإلكتروني</label>
  <input class="input" id="email-rtl" type="email" placeholder="name@example.com" />
</div>
```

## Accessibility

- Always use a native `<label>` (with `for` matching the `id` of the control, or wrapping the control).
- The label's text content is the accessible name of the control. Don't add `aria-label` if you have a visible label.
- For a required field, mark the input with `required` (and optionally `aria-required="true"`) and add a visual indicator (`*`) with `aria-hidden="true"` to the label.
- For optional helper text or description, use a `<p>` inside the `.field` and connect it with `aria-describedby` on the input.
- For an error message, use `<p role="alert">` and connect it with `aria-describedby`. See [Field](./field.md) for the full pattern.

## Gotchas

- `class="label"` is just a styled native `<label>`. It does not provide layout. Use inside a `.field` wrapper or a `grid` for layout.
- For horizontal layouts (label + control in a row), add `gap-2` or similar utility to space them.
- Don't use `<span class="label">` — use `<label>` even when wrapping a control. The native semantics matter for click and accessibility.
- The `for` attribute is required when the label and control are siblings. If the label wraps the control, `for` is not needed.
- Required field indicator (`*`) is purely visual. Add `required` (and `aria-required="true"`) to the input as well.
