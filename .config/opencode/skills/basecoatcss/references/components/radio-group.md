# Radio Group


A set of mutually exclusive radio buttons. Basecoat uses native `<input type="radio">` with `class="input"` for styling.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `class="input"` (on the `<input type="radio">`)
- **Native element:** `<input type="radio">`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/field";
@import "basecoat-css/components/radio";
@import "basecoat-css/styles/vega";
```

Radio Group uses Radio styles and composes Field styles in the richer examples.

## HTML structure

```html
<div role="radiogroup" aria-label="View density" data-slot="radio-group">
  <div class="flex items-center gap-3">
    <input type="radio" id="r1" name="density" value="default" class="input" />
    <label for="r1">Default</label>
  </div>
  <div class="flex items-center gap-3">
    <input type="radio" id="r2" name="density" value="comfortable" class="input" checked />
    <label for="r2">Comfortable</label>
  </div>
  <div class="flex items-center gap-3">
    <input type="radio" id="r3" name="density" value="compact" class="input" />
    <label for="r3">Compact</label>
  </div>
</div>
```

- `<div role="radiogroup">` — groups the radios for screen readers; add `aria-label` or `aria-labelledby`
- `<input type="radio" class="input">` — each radio; all share the same `name` to make them mutually exclusive
- `<label for>` — accessible name
- `<section>` — optional content wrapper for label + description

## Examples

### Basic

```html
<div role="radiogroup" aria-label="View density" data-slot="radio-group" class="w-fit">
  <div class="flex items-center gap-3">
    <input type="radio" id="r1" name="density" value="default" class="input" />
    <label for="r1">Default</label>
  </div>
  <div class="flex items-center gap-3">
    <input type="radio" id="r2" name="density" value="comfortable" class="input" checked />
    <label for="r2">Comfortable</label>
  </div>
  <div class="flex items-center gap-3">
    <input type="radio" id="r3" name="density" value="compact" class="input" />
    <label for="r3">Compact</label>
  </div>
</div>
```

### With descriptions

```html
<div role="radiogroup" aria-label="View density" data-slot="radio-group" class="w-fit">
  <div role="group" class="field" data-orientation="horizontal">
    <input type="radio" id="desc-r1" name="density-desc" value="default" class="input" />
    <section>
      <label for="desc-r1">Default</label>
      <p>Standard spacing for most use cases.</p>
    </section>
  </div>
  <div role="group" class="field" data-orientation="horizontal">
    <input type="radio" id="desc-r2" name="density-desc" value="comfortable" class="input" checked />
    <section>
      <label for="desc-r2">Comfortable</label>
      <p>More space between elements.</p>
    </section>
  </div>
  <div role="group" class="field" data-orientation="horizontal">
    <input type="radio" id="desc-r3" name="density-desc" value="compact" class="input" />
    <section>
      <label for="desc-r3">Compact</label>
      <p>Minimal spacing for dense layouts.</p>
    </section>
  </div>
</div>
```

### Choice card (clickable card)

Wrap a `.field` inside a `<label>` to make the whole card clickable:

```html
<div role="radiogroup" aria-label="Plans" data-slot="radio-group" class="w-full max-w-md">
  <label for="plus-plan">
    <div role="group" class="field" data-orientation="horizontal">
      <section>
        <h3>Plus</h3>
        <p>For individuals and small teams.</p>
      </section>
      <input type="radio" id="plus-plan" name="plan" value="plus" class="input" checked />
    </div>
  </label>
  <label for="pro-plan">
    <div role="group" class="field" data-orientation="horizontal">
      <section>
        <h3>Pro</h3>
        <p>For growing businesses.</p>
      </section>
      <input type="radio" id="pro-plan" name="plan" value="pro" class="input" />
    </div>
  </label>
</div>
```

### In a fieldset

```html
<fieldset class="fieldset">
  <legend data-variant="label">Subscription Plan</legend>
  <p>Yearly and lifetime plans offer significant savings.</p>
  <div role="radiogroup" aria-label="Subscription plan" data-slot="radio-group">
    <div role="group" class="field" data-orientation="horizontal">
      <input type="radio" id="plan-monthly" name="plan" value="monthly" class="input" checked />
      <label for="plan-monthly" class="font-normal">Monthly ($9.99/month)</label>
    </div>
    <div role="group" class="field" data-orientation="horizontal">
      <input type="radio" id="plan-yearly" name="plan" value="yearly" class="input" />
      <label for="plan-yearly" class="font-normal">Yearly ($99.99/year)</label>
    </div>
    <div role="group" class="field" data-orientation="horizontal">
      <input type="radio" id="plan-lifetime" name="plan" value="lifetime" class="input" />
      <label for="plan-lifetime" class="font-normal">Lifetime ($299.99)</label>
    </div>
  </div>
</fieldset>
```

### Disabled

```html
<div role="radiogroup" aria-label="Disabled options" data-slot="radio-group" class="w-fit">
  <div role="group" class="field" data-orientation="horizontal" data-disabled>
    <input type="radio" id="disabled-1" name="disabled-radio" value="option1" class="input" disabled />
    <label for="disabled-1" class="font-normal">Disabled</label>
  </div>
  <div role="group" class="field" data-orientation="horizontal">
    <input type="radio" id="disabled-2" name="disabled-radio" value="option2" class="input" checked />
    <label for="disabled-2" class="font-normal">Option 2</label>
  </div>
</div>
```

### Invalid

```html
<fieldset class="fieldset">
  <legend data-variant="label">Notification Preferences</legend>
  <p>Choose how you want to receive notifications.</p>
  <div role="radiogroup" aria-label="Notification preferences" data-slot="radio-group">
    <div role="group" class="field" data-orientation="horizontal" data-invalid>
      <input type="radio" id="invalid-email" name="notification-pref" value="email" class="input" aria-invalid="true" checked />
      <label for="invalid-email" class="font-normal">Email only</label>
    </div>
    <div role="group" class="field" data-orientation="horizontal" data-invalid>
      <input type="radio" id="invalid-sms" name="notification-pref" value="sms" class="input" aria-invalid="true" />
      <label for="invalid-sms" class="font-normal">SMS only</label>
    </div>
  </div>
</fieldset>
```

### RTL

```html
<div dir="rtl" role="radiogroup" aria-label="كثافة العرض" data-slot="radio-group" class="w-fit">
  <div role="group" class="field" data-orientation="horizontal">
    <input type="radio" id="r1-rtl" name="density-rtl" value="default" class="input" />
    <section>
      <label for="r1-rtl">افتراضي</label>
      <p>تباعد قياسي لمعظم حالات الاستخدام.</p>
    </section>
  </div>
  <div role="group" class="field" data-orientation="horizontal">
    <input type="radio" id="r2-rtl" name="density-rtl" value="comfortable" class="input" checked />
    <section>
      <label for="r2-rtl">مريح</label>
      <p>مساحة أكبر بين العناصر.</p>
    </section>
  </div>
</div>
```

## Accessibility

- Always wrap radio inputs in a `<div role="radiogroup">` with `aria-label` or `aria-labelledby`. The role group is what makes screen readers announce the group as a single set.
- All radios in a group must share the same `name` attribute. This is what makes them mutually exclusive.
- For a richer group with a visible label, use `<fieldset>` + `<legend data-variant="label">`.
- For horizontal layouts (radio beside label), wrap in `<div class="field" data-orientation="horizontal">` from [Field](./field.md).
- For invalid state, add `aria-invalid="true"` on each input **and** `data-invalid` on the field wrapper.
- For disabled state, add `disabled` on the input **and** `data-disabled` on the field wrapper.
- Arrow keys move between radios in a group (native browser behavior).
- `Tab` moves focus into and out of the group (not between radios).

## Gotchas

- The styling is on the `class="input"` attribute. You must add `class="input"` to the radio input.
- All radios in a group must share the same `name` — otherwise they're independent.
- Use `<div role="radiogroup">` even when there's a `<fieldset>` + `<legend>` for the group label. The `<fieldset>` is for the visible label; the `role="radiogroup"` ensures the correct ARIA semantics.
- For invalid state, both `aria-invalid="true"` on the input **and** `data-invalid` on the field wrapper are required.
- The `data-slot="radio-group"` attribute is a custom hook for project-level CSS or testing. It's not required for Basecoat's built-in styling.
- For a single radio (rare), use `<input type="radio">` with a label, but no `role="radiogroup"` is needed.
- For radio items in a menu (e.g., dropdown menu), use `role="menuitemradio"` instead. See [Dropdown Menu](./dropdown-menu.md).
