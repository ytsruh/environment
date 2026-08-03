# Checkbox


A native checkbox styled by Basecoat. Use inside a `.field` with a `<label>` for layout and accessibility.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `class="input"` (applied to the `<input type="checkbox">`)
- **Native element:** `<input type="checkbox">`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/checkbox";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="terms" name="terms" class="input" />
  <label for="terms">Accept terms and conditions</label>
</div>
```

- `<input type="checkbox" class="input">` — the control
- `<label for="...">` — accessible label
- `<section>` (optional) — wraps label + description for richer rows
- `<p>` (optional) — helper text or description

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-orientation` | `.field` | `"horizontal"` | Lays out the checkbox beside its label. |
| `data-disabled` | `.field` | boolean | Disabled visual state. Apply alongside `disabled` on the input. |
| `data-invalid` | `.field` | boolean | Invalid visual state. Apply alongside `aria-invalid="true"` on the input. |

## Examples

### Basic

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="terms-basic" name="terms-basic" class="input" />
  <label for="terms-basic">Accept terms and conditions</label>
</div>
```

### Checked by default

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="terms-checked" name="terms-checked" class="input" checked />
  <label for="terms-checked">I agree</label>
</div>
```

### With description

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="terms-desc" name="terms-desc" class="input" checked aria-describedby="terms-desc-description" />
  <section>
    <label for="terms-desc">Accept terms and conditions</label>
    <p id="terms-desc-description">By clicking this checkbox, you agree to the terms and conditions.</p>
  </section>
</div>
```

### Disabled

Add `disabled` to the input and `data-disabled` to the field:

```html
<div role="group" class="field" data-orientation="horizontal" data-disabled>
  <input type="checkbox" id="toggle-disabled" name="toggle-disabled" class="input" disabled />
  <label for="toggle-disabled">Enable notifications</label>
</div>
```

### Invalid

Add `aria-invalid="true"` to the input and `data-invalid` to the field:

```html
<div role="group" class="field" data-orientation="horizontal" data-invalid>
  <input type="checkbox" id="terms-invalid" name="terms-invalid" class="input" aria-invalid="true" />
  <label for="terms-invalid">Accept terms and conditions</label>
</div>
```

### Group (multiple checkboxes)

Use a `<fieldset>` with a `<legend>` and a description. Use a child group with `aria-label` to name the checkbox set.

```html
<fieldset class="fieldset">
  <legend data-variant="label">Show these items on the desktop:</legend>
  <p>Select the items you want to show on the desktop.</p>
  <div role="group" aria-label="Desktop items" data-slot="checkbox-group">
    <div role="group" class="field" data-orientation="horizontal">
      <input class="input" type="checkbox" id="hard-disks" name="hard-disks" checked />
      <label for="hard-disks" class="font-normal">Hard disks</label>
    </div>
    <div role="group" class="field" data-orientation="horizontal">
      <input class="input" type="checkbox" id="external-disks" name="external-disks" checked />
      <label for="external-disks" class="font-normal">External disks</label>
    </div>
  </div>
</fieldset>
```

### Selectable table rows

Use `data-checkbox-table` on a `<table class="table">` and `data-state="selected"` on selected rows:

```html
<div class="table-container">
  <table class="table" data-checkbox-table>
    <thead>
      <tr>
        <th class="w-8"><input type="checkbox" id="select-all" class="input" aria-label="Select all" /></th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
      </tr>
    </thead>
    <tbody>
      <tr data-state="selected">
        <td><input type="checkbox" id="row-1" class="input" aria-label="Select Sarah Chen" checked /></td>
        <td>Sarah Chen</td>
        <td>sarah.chen@example.com</td>
        <td>Admin</td>
      </tr>
      <tr>
        <td><input type="checkbox" id="row-2" class="input" aria-label="Select Marcus Rodriguez" /></td>
        <td>Marcus Rodriguez</td>
        <td>marcus.rodriguez@example.com</td>
        <td>User</td>
      </tr>
    </tbody>
  </table>
</div>
```

### RTL

```html
<div role="group" class="fieldset" dir="rtl">
  <div role="group" class="field" data-orientation="horizontal">
    <input type="checkbox" id="terms-rtl" name="terms-rtl" class="input" />
    <label for="terms-rtl">قبول الشروط والأحكام</label>
  </div>
</div>
```

## Accessibility

- Always pair a checkbox with a `<label>` (use `for` matching the `id`).
- For grouped checkboxes, use `<fieldset>` + `<legend>` and an inner `role="group"` with `aria-label`.
- For invalid state, add both `aria-invalid="true"` on the input **and** `data-invalid` on the `.field` wrapper. Connect the error message via `aria-describedby`.
- For selectable table rows, use `aria-label` on each row checkbox to identify the row (since the checkbox itself is visually just a tick).
- Disabled checkboxes cannot receive focus; if you need a focusable inactive state, use `aria-disabled="true"` and handle state manually.
- The toggle switch is a separate component — see [Switch](./switch.md) — but uses the same underlying checkbox. Use it for "on/off" states with immediate effect.

## Gotchas

- The styling is on the `class="input"` attribute, not on the `<input type="checkbox">` element by default. You must add `class="input"` to the checkbox input.
- The `.field` wrapper handles spacing. Without it, the checkbox and label won't align correctly.
- For invalid state, the styling only applies when **both** `aria-invalid="true"` is on the input **and** `data-invalid` is on the field. Setting only one won't apply the invalid visuals.
- For a group of related checkboxes, always use `<fieldset>` + `<legend>` for proper accessible grouping.
- Use `<label class="font-normal">` inside the group to make the label weight match the description text below it.
