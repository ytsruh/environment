# Field


A wrapper for a form control, its label, and optional helper text or error message. The Field component is the foundation of accessible forms in Basecoat.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root classes:** `.field` (single control), `.fieldset` (group of related controls)

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
@import "basecoat-css/styles/vega";
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-orientation` | `.field` | `"horizontal"`, `"vertical"`, `"responsive"` | Layout direction. `"responsive"` stacks by default, switches to horizontal in wider containers. |
| `data-invalid` | `.field` | boolean | Invalid visual state. Apply alongside `aria-invalid="true"` on the input. |
| `data-disabled` | `.field` | boolean | Disabled visual state. Apply alongside `disabled` on the input. |
| `data-variant` | `<legend>` | `"label"` | Styles the legend as a label. |

## HTML structure

Single field:

```html
<div role="group" class="field">
  <label for="email">Email</label>
  <input id="email" type="email" />
  <p>Helper text</p>
</div>
```

Fieldset (group of related fields):

```html
<fieldset class="fieldset">
  <legend>Profile</legend>
  <p>Description</p>
  <div role="group" aria-label="Profile fields">
    <div role="group" class="field">
      <label for="name">Full name</label>
      <input id="name" />
    </div>
  </div>
</fieldset>
```

- `<fieldset class="fieldset">` — native group for related fields; use `<legend>` for the label
- `<div role="group" class="fieldset">` — structural group when `<fieldset>` is not appropriate
- `<div role="group" class="field">` — single field wrapper
- `<label>` — label for the control; use `for` when the control has an `id`
- `<input>`, `<select>`, `<textarea>` — native form control
- `<section>` — optional content wrapper for label and description when the control sits beside text
- `<p>` — helper text or error text; use `role="alert"` for validation errors and connect with `aria-describedby`
- `<div class="field-separator">` with `<hr role="separator" />` — divider between field groups

## Examples

### Input

```html
<div role="group" class="field">
  <label for="username">Username</label>
  <input id="username" type="text" placeholder="Max Leiter" aria-describedby="username-description" />
  <p id="username-description">Choose a unique username for your account.</p>
</div>
```

### Invalid input

```html
<div role="group" class="field" data-invalid>
  <label for="invalid-email">Email</label>
  <input id="invalid-email" type="email" value="wrong-email" aria-invalid="true" aria-describedby="invalid-email-error" />
  <p id="invalid-email-error" role="alert">Enter a valid email address.</p>
</div>
```

### Textarea

```html
<div role="group" class="field">
  <label for="feedback">Feedback</label>
  <textarea id="feedback" placeholder="Your feedback helps us improve..." rows="4" aria-describedby="feedback-description"></textarea>
  <p id="feedback-description">Share your thoughts about our service.</p>
</div>
```

### Select

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

### Slider

```html
<div role="group" class="field">
  <label for="price-range">Price Range</label>
  <p id="price-range-description">Set your maximum budget <span id="price-range-output">(up to $800)</span>.</p>
  <input id="price-range" type="range" min="0" max="1000" step="10" value="800" aria-describedby="price-range-description" class="input" />
</div>
```

### Fieldset with multiple fields

```html
<fieldset class="fieldset">
  <legend>Address Information</legend>
  <p>We need your address to deliver your order.</p>
  <div role="group" aria-label="Address fields">
    <div role="group" class="field">
      <label for="street">Street Address</label>
      <input id="street" type="text" placeholder="123 Main St" />
    </div>
    <div class="grid grid-cols-2 gap-4">
      <div role="group" class="field">
        <label for="city">City</label>
        <input id="city" type="text" placeholder="New York" />
      </div>
      <div role="group" class="field">
        <label for="zip">Postal Code</label>
        <input id="zip" type="text" placeholder="90502" />
      </div>
    </div>
  </div>
</fieldset>
```

### Horizontal layout (label beside control)

```html
<div role="group" class="field" data-orientation="horizontal">
  <input type="checkbox" id="remember" />
  <label for="remember">Remember me</label>
</div>
```

### Checkbox group

```html
<fieldset class="fieldset">
  <legend data-variant="label">Show these items on the desktop</legend>
  <p>Select the items you want to show on the desktop.</p>
  <div role="group" aria-label="Desktop items">
    <div role="group" class="field" data-orientation="horizontal">
      <input id="hard-disks" type="checkbox" />
      <label for="hard-disks" class="font-normal">Hard disks</label>
    </div>
    <div role="group" class="field" data-orientation="horizontal">
      <input id="external-disks" type="checkbox" />
      <label for="external-disks" class="font-normal">External disks</label>
    </div>
  </div>
</fieldset>
```

### Radio group

```html
<fieldset class="fieldset">
  <legend data-variant="label">Subscription Plan</legend>
  <p>Yearly and lifetime plans offer significant savings.</p>
  <div role="radiogroup" aria-label="Subscription plan">
    <div role="group" class="field" data-orientation="horizontal">
      <input type="radio" id="plan-monthly" name="plan" value="monthly" checked />
      <label for="plan-monthly" class="font-normal">Monthly ($9.99/month)</label>
    </div>
    <div role="group" class="field" data-orientation="horizontal">
      <input type="radio" id="plan-yearly" name="plan" value="yearly" />
      <label for="plan-yearly" class="font-normal">Yearly ($99.99/year)</label>
    </div>
  </div>
</fieldset>
```

### Switch

```html
<div role="group" class="field" data-orientation="horizontal">
  <section>
    <label for="mfa">Multi-factor authentication</label>
    <p>Enable multi-factor authentication. If you do not have a two-factor device, you can use a one-time code sent to your email.</p>
  </section>
  <input id="mfa" type="checkbox" role="switch" />
</div>
```

### Choice card (clickable row)

Wrap a `.field` inside a `<label>` to make the whole row clickable:

```html
<fieldset class="fieldset">
  <legend data-variant="label">Compute Environment</legend>
  <p>Select the compute environment for your cluster.</p>
  <div role="radiogroup" aria-label="Compute environment">
    <label for="k8s">
      <div role="group" class="field" data-orientation="horizontal">
        <section>
          <h3>Kubernetes</h3>
          <p>Run GPU workloads on a K8s cluster.</p>
        </section>
        <input id="k8s" type="radio" name="compute" value="k8s" checked />
      </div>
    </label>
  </div>
</fieldset>
```

### Group with separators

```html
<fieldset class="fieldset">
  <legend data-variant="label">Notification Preferences</legend>
  <p>Choose how you want to be notified.</p>
  <div role="group" aria-label="Response notifications">
    <div role="group" class="field" data-orientation="horizontal">
      <input id="push" type="checkbox" checked />
      <label for="push" class="font-normal">Push notifications</label>
    </div>
  </div>
</fieldset>
<div class="field-separator"><hr role="separator" /></div>
<fieldset class="fieldset">
  <legend data-variant="label">Tasks</legend>
  <p>Get notified when tasks update.</p>
  <div role="group" aria-label="Task notifications">
    <div role="group" class="field" data-orientation="horizontal">
      <input id="task-push" type="checkbox" />
      <label for="task-push" class="font-normal">Push notifications</label>
    </div>
  </div>
</fieldset>
```

### Responsive layout

```html
<div role="group" class="field" data-orientation="responsive">
  <section>
    <label for="responsive-name">Name</label>
    <p id="responsive-name-description">Provide your full name for identification</p>
  </section>
  <input id="responsive-name" placeholder="Evil Rabbit" aria-describedby="responsive-name-description" required />
</div>
```

`data-orientation="responsive"` stacks by default and switches to horizontal in wider containers (controlled by media query).

### RTL

```html
<fieldset class="fieldset" dir="rtl">
  <legend>الملف الشخصي</legend>
  <p>تظهر هذه المعلومات في حسابك.</p>
  <div role="group" aria-label="حقول الملف الشخصي">
    <div role="group" class="field">
      <label for="field-rtl-name">الاسم الكامل</label>
      <input id="field-rtl-name" type="text" placeholder="أرنب شرير" />
      <p>اكتب اسمك الأول والأخير.</p>
    </div>
  </div>
</fieldset>
```

## Accessibility

- Always use a `<label>` (with `for`) for each form control, or `aria-label` if a visible label is not appropriate.
- Use `<fieldset>` and `<legend>` for groups of related fields. The legend acts as the group label.
- For helper text, connect it with `aria-describedby` on the input.
- For error messages, use `role="alert"` on the message element and connect it with `aria-describedby` on the input.
- For invalid state, add `aria-invalid="true"` on the input **and** `data-invalid` on the `.field` wrapper. Setting only one won't apply the invalid visuals.
- For disabled state, add `disabled` on the input **and** `data-disabled` on the `.field` wrapper.
- For horizontal layouts with a switch or checkbox, the control comes first (visually and in DOM order). Screen readers will announce the label after the state.

## Gotchas

- For invalid state, both `aria-invalid` on the input and `data-invalid` on the field are required.
- For disabled state, both `disabled` on the input and `data-disabled` on the field are required.
- `<fieldset>` and `<legend>` provide accessible grouping. Use them whenever you have a group of related fields (e.g., a radio group).
- For a non-native group (e.g., checkboxes in a card), use `<div role="group" class="fieldset">` with an `aria-label` or `aria-labelledby`.
- For grouped fields, the inner group is a `role="group"` with `aria-label` so screen readers can announce the group.
- Use `<label class="font-normal">` to make the label weight match the description text below it.
- The `field-separator` class is for visual separation; combine with `<hr role="separator" />` for accessibility.
- `data-orientation="responsive"` uses a container query — the field needs to be in a container that supports `@container` queries (or use the global viewport as a fallback).
