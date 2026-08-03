# Switch


A toggle switch for on/off states. Basecoat uses a native `<input type="checkbox" role="switch">` with custom styling.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `class="input"` (on the `<input type="checkbox" role="switch">`)
- **Native element:** `<input type="checkbox" role="switch">`

When to use Switch vs [Checkbox](./checkbox.md):

- Use **Switch** for an on/off toggle with immediate effect (e.g., enable notifications, dark mode).
- Use **Checkbox** for selecting from a list of options or for form submission with multiple values.

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/switch";
@import "basecoat-css/styles/vega";
```

## Sizes

| Size | Markup | Description |
|---|---|---|
| Default | `<input type="checkbox" role="switch" class="input">` | Default size. |
| Small | `<input type="checkbox" role="switch" class="input" data-size="sm">` | Compact size. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-size` | `"sm"` | Small size variant. |

## HTML structure

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="airplane-mode" role="switch" class="input" />
  <label for="airplane-mode">Airplane Mode</label>
</div>
```

- `<input type="checkbox" role="switch" class="input">` — the switch control
- `<label for="...">` — accessible label
- `<section>` (optional) — wraps label + description for richer rows

## Examples

### Basic

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="airplane-mode" role="switch" class="input" />
  <label for="airplane-mode">Airplane Mode</label>
</div>
```

### With description

```html
<div role="group" class="field" data-orientation="horizontal">
  <section>
    <label for="switch-focus">Share across devices</label>
    <p id="switch-focus-description">Focus is shared across devices, and turns off when you leave the app.</p>
  </section>
  <input type="checkbox" id="switch-focus" role="switch" class="input" aria-describedby="switch-focus-description" />
</div>
```

### Sizes

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="switch-size-sm" role="switch" class="input" data-size="sm" />
  <label for="switch-size-sm">Small</label>
</div>
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="switch-size-default" role="switch" class="input" />
  <label for="switch-size-default">Default</label>
</div>
```

### Choice card (clickable row)

Wrap a `.field` inside a `<label>` to make the whole row clickable:

```html
<div role="group" class="grid w-full gap-3" aria-label="Focus settings">
  <label>
    <div role="group" class="field" data-orientation="horizontal">
      <section>
        <h3>Share across devices</h3>
        <p>Focus is shared across devices, and turns off when you leave the app.</p>
      </section>
      <input type="checkbox" role="switch" class="input" />
    </div>
  </label>
  <label>
    <div role="group" class="field" data-orientation="horizontal">
      <section>
        <h3>Enable notifications</h3>
        <p>Receive notifications when focus mode changes.</p>
      </section>
      <input type="checkbox" role="switch" class="input" checked />
    </div>
  </label>
</div>
```

### Disabled

```html
<div role="group" class="field" data-orientation="horizontal" data-disabled="true">
  <input type="checkbox" id="switch-disabled" role="switch" class="input" disabled />
  <label for="switch-disabled">Disabled</label>
</div>
```

### Invalid

```html
<div role="group" class="field" data-orientation="horizontal" data-invalid="true">
  <section>
    <label for="switch-invalid">Accept terms and conditions.</label>
    <p>You must accept the terms and conditions to continue.</p>
  </section>
  <input type="checkbox" id="switch-invalid" role="switch" class="input" aria-invalid="true" />
</div>
```

### RTL

```html
<div dir="rtl" role="group" class="field" data-orientation="horizontal">
  <section>
    <label for="switch-rtl">المشاركة عبر الأجهزة</label>
    <p id="switch-rtl-description">يتم مشاركة التركيز عبر الأجهزة.</p>
  </section>
  <input type="checkbox" id="switch-rtl" role="switch" class="input" aria-describedby="switch-rtl-description" checked />
</div>
```

## Accessibility

- Use `<input type="checkbox" role="switch">` — the role override tells screen readers to treat it as a switch (on/off) rather than a checkbox (checked/unchecked).
- Always pair with a `<label>` (using `for` matching the `id`).
- For invalid state, add `aria-invalid="true"` to the input **and** `data-invalid="true"` on the field wrapper.
- For disabled state, add `disabled` to the input **and** `data-disabled="true"` on the field wrapper.
- `Space` toggles the switch (native checkbox behavior with role override).
- For description text, connect it with `aria-describedby`.

## Gotchas

- The styling is on the `class="input"` attribute. You must add `class="input"` to the checkbox.
- The `role="switch"` attribute is required for proper semantics. Without it, screen readers will announce the element as "checkbox" with "checked/unchecked" instead of "switch" with "on/off".
- For a switch, the state is "on" when `checked` is true, "off" when false. The native `checked` attribute is used.
- For multiple switches in a group, wrap them in `<div role="group">` with an `aria-label` (or use a fieldset with a legend for a visible label).
- For a "loading" state while the change is being saved, use a [Spinner](./spinner.md) or [Progress](./progress.md) indicator and disable the switch.
- The switch's on/off state should be communicated to screen readers via the `checked` attribute. The script does not need to do anything special.
- For a switch with delayed effect (e.g., a setting that takes a few seconds to apply), use `aria-busy="true"` and update the state after the operation completes.
