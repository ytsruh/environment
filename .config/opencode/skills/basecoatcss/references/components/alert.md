# Alert


A callout component for important inline messages. Alerts use semantic HTML with an icon, title, and description, plus an optional footer for actions.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.alert`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/alert";
@import "basecoat-css/styles/vega";
```

## Variants

| Variant | Markup | Description |
|---|---|---|
| Default | `<div class="alert">` | Neutral information alert. |
| Destructive | `<div class="alert" data-variant="destructive">` | Error / destructive state. Uses the destructive token. |

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-variant` | `.alert` | `"destructive"` | Visual variant. Omit for default. |

## HTML structure

```html
<div class="alert">
  <svg><!-- icon, optional --></svg>
  <h2>Title</h2>
  <section>Description text.</section>
  <footer>
    <!-- optional action buttons -->
  </footer>
</div>
```

- `<div class="alert">` — main container
- `<svg>` — optional icon
- `<h2>` — title (use the heading level that fits the surrounding outline)
- `<section>` — optional description
- `<footer>` — optional action region, aligned to the inline end

## Examples

### Basic

```html
<div class="alert">
  <svg class="lucide lucide-circle-check" ...></svg>
  <h2>Account updated successfully</h2>
  <section>Your profile information has been saved.</section>
</div>
```

### Destructive

```html
<div class="alert" data-variant="destructive">
  <svg class="lucide lucide-circle-alert" ...></svg>
  <h2>Payment failed</h2>
  <section>Your payment could not be processed. Please check your payment method and try again.</section>
</div>
```

### With action button

```html
<div class="alert">
  <h2>Dark mode is now available</h2>
  <section>Enable it under your profile settings to get started.</section>
  <footer>
    <button type="button" class="btn" data-size="xs">Enable</button>
  </footer>
</div>
```

### Custom colors

Use Tailwind utilities to override the color palette:

```html
<div class="alert border-amber-200 bg-amber-50 text-amber-900 dark:border-amber-900 dark:bg-amber-950 dark:text-amber-50">
  <svg class="lucide lucide-triangle-alert" ...></svg>
  <h2>Your subscription will expire in 3 days.</h2>
  <section>Renew now to avoid service interruption.</section>
</div>
```

### Stacked

```html
<div class="grid items-start gap-4">
  <div class="alert">
    <svg ...></svg>
    <h2>Payment successful</h2>
    <section>Your payment of $29.99 has been processed.</section>
  </div>
  <div class="alert">
    <svg ...></svg>
    <h2>New feature available</h2>
    <section>We've added dark mode support.</section>
  </div>
</div>
```

### RTL

```html
<div class="grid items-start gap-4" dir="rtl">
  <div class="alert">
    <svg ...></svg>
    <h2>تم الدفع بنجاح</h2>
    <section>تمت معالجة دفعتك البالغة 29.99 دولارًا.</section>
  </div>
</div>
```

## Accessibility

- Use the heading level that matches the surrounding document outline. `<h2>` is the most common choice.
- The icon should be decorative; mark it `aria-hidden="true"` so screen readers don't announce it.
- For destructive alerts, consider also adding `role="alert"` to the root if the message is dynamic (e.g., rendered after a server error).
- The `<footer>` is a content section, not the document footer; it is styled to align actions to the inline end.
- Pair color with text and an icon — never rely on color alone to communicate state.

## Gotchas

- The default heading is `<h2>`. Adjust to match your document outline.
- Without `data-variant="destructive"`, alerts render in the neutral default state.
- Custom-color overrides (Tailwind utilities) take precedence over the variant — be careful mixing them.
- For interactive notifications that auto-dismiss or stack, use [Toast](./toast.md) instead.
