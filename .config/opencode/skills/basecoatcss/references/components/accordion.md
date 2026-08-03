# Accordion


A vertically stacked set of interactive headings that each reveal a section of content. Basecoat uses native `<details>`/`<summary>` for disclosure semantics, with optional JS for single-open behavior.

## Overview

- **CSS-only:** yes (no JS needed for basic disclosure)
- **JS module:** none (the accordion script only enforces single-item open behavior)
- **Root class:** `.accordion`
- **Native element:** `<details>`/`<summary>`

## Imports

### CSS

Full bundle:

```css
@import "tailwindcss";
@import "basecoat-css";
```

Tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/accordion";
@import "basecoat-css/styles/vega";
```

### JavaScript

Only needed if you want single-open enforcement. Otherwise nothing is required.

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/accordion.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-multiple` | `.accordion` (root) | boolean | Allow multiple items to be open at the same time. When omitted, opening one item closes the others. |
| `open` (native) | `<details>` | boolean | The initially expanded item. |
| `aria-disabled` | `<details>` | `"true"` | Disables toggling for that item. |

## HTML structure

```html
<section class="accordion">
  <details open>
    <summary>
      Question text
      <svg><!-- chevron icon, optional --></svg>
    </summary>
    <section>Answer content.</section>
  </details>
  <details>
    <summary>...</summary>
    <section>...</section>
  </details>
</section>
```

- `<section class="accordion">` — root container
- `<details>` — one accordion item; use the native `open` attribute for the default
- `<summary>` — the trigger; trailing icon (chevron) is typical
- `<section>` — the revealed content; any semantic element works

## Examples

### Basic

```html
<section class="accordion">
  <details open>
    <summary>How do I reset my password?</summary>
    <section>Click "Forgot Password" on the login page...</section>
  </details>
  <details>
    <summary>Can I change my subscription plan?</summary>
    <section>Yes. You can upgrade or downgrade from billing settings.</section>
  </details>
</section>
```

### Multiple (allow several items open)

Add `data-multiple` to the root.

```html
<section class="accordion" data-multiple>
  <details open>
    <summary>Notification Settings</summary>
    <section>Manage how you receive notifications.</section>
  </details>
  <details>
    <summary>Privacy & Security</summary>
    <section>Control account security and session history.</section>
  </details>
</section>
```

### Disabled item

```html
<section class="accordion">
  <details aria-disabled="true">
    <summary>Premium feature information</summary>
    <section>This item is disabled.</section>
  </details>
</section>
```

### Bordered with horizontal padding

```html
<section class="accordion rounded-md border [&>details>summary]:px-4 [&>details>:not(summary)]:px-4">
  <details open><summary>How does billing work?</summary><section>Monthly and annual plans...</section></details>
</section>
```

### Inside a card

```html
<div class="card">
  <header>
    <h2>Subscription & Billing</h2>
    <p>Common questions about your account, plans, payments and cancellations.</p>
  </header>
  <section>
    <section class="accordion">
      <details open>
        <summary>What subscription plans do you offer?</summary>
        <section>Starter ($9/month), Professional ($29/month), Enterprise ($99/month).</section>
      </details>
    </section>
  </section>
</div>
```

### RTL

```html
<section class="accordion" dir="rtl">
  <details open>
    <summary>كيف يمكنني إعادة تعيين كلمة المرور؟</summary>
    <section>انقر على "نسيت كلمة المرور"...</section>
  </details>
</section>
```

## JavaScript API

Accordion does not expose custom methods. The native `<details>` element provides all behavior:

```js
document.querySelector("#billing").open = true;
```

The accordion script:

- Enforces single-open behavior unless `data-multiple` is set
- Prevents disabled (`aria-disabled="true"`) items from toggling

## Accessibility

- Native `<details>`/`<summary>` provide keyboard support and disclosure semantics for free.
- `Tab` moves focus to each summary; `Enter`/`Space` toggles the item.
- Screen readers announce "disclosure triangle" and the open/closed state automatically.
- Use `aria-disabled="true"` to mark items the user cannot toggle.

## Gotchas

- The accordion is a `<section>` wrapper, not a `<div>`. Use `<details>` directly as children, not nested `<div>`s.
- Without `data-multiple`, opening one item closes the others. This is enforced client-side — server-rendered initial state can be controlled via the native `open` attribute.
- The chevron icon is typically inside `<summary>` and rotated via CSS when open. Basecoat does not provide a default icon.
- For non-disclosure accordion patterns (e.g., tabs styled as accordion), use the [Tabs](./tabs.md) component instead.
