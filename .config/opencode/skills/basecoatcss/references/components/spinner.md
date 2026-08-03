# Spinner


There is no dedicated Spinner component in Basecoat. Spinners are pure HTML using the `loader-circle` Lucide icon with the `animate-spin` Tailwind utility.

## Overview

- **CSS-only:** yes (no dedicated component CSS)
- **JS module:** none
- **Root class:** none (use Lucide `loader-circle` SVG with `animate-spin`)

## Imports

```css
@import "tailwindcss";
```

No Basecoat component CSS is required. Just include Tailwind.

## HTML structure

```html
<svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M21 12a9 9 0 1 1-6.219-8.56" />
</svg>
```

- `aria-label="Loading"` — accessible name
- `role="status"` — announces the spinner as a status update
- `class="animate-spin"` — Tailwind utility for the rotation animation
- `class="lucide lucide-loader-circle"` — Lucide icon class

## Examples

### Default (24px)

```html
<svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
  <path d="M21 12a9 9 0 1 1-6.219-8.56" />
</svg>
```

### Sizes

Use the `size-*` utility to change size:

```html
<div class="flex items-center gap-6">
  <svg aria-label="Loading" role="status" class="size-3 animate-spin lucide lucide-loader-circle" ...></svg>
  <svg aria-label="Loading" role="status" class="size-4 animate-spin lucide lucide-loader-circle" ...></svg>
  <svg aria-label="Loading" role="status" class="size-6 animate-spin lucide lucide-loader-circle" ...></svg>
  <svg aria-label="Loading" role="status" class="size-8 animate-spin lucide lucide-loader-circle" ...></svg>
</div>
```

### In a button

```html
<button class="btn" data-size="sm" disabled>
  <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
  Loading...
</button>
```

Place the spinner before or after the label; button spacing is handled automatically.

### In a badge

```html
<span class="badge">
  <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
  Syncing
</span>
```

### In an input group

```html
<div class="input-group">
  <input type="text" placeholder="Send a message..." disabled />
  <span data-align="inline-end">
    <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
  </span>
</div>
```

### In an empty state

```html
<div class="empty w-full">
  <header>
    <figure>
      <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
    </figure>
    <h3>Processing your request</h3>
    <p>Please wait while we process your request. Do not refresh the page.</p>
  </header>
  <section>
    <button class="btn" data-variant="outline" data-size="sm">Cancel</button>
  </section>
</div>
```

### In an item

```html
<article class="item bg-muted/50 border-transparent">
  <figure>
    <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
  </figure>
  <section>
    <h3>Processing payment...</h3>
  </section>
  <aside class="tabular-nums text-sm">$100.00</aside>
</article>
```

### RTL

```html
<article class="item bg-muted/50 border-transparent" dir="rtl">
  <figure>
    <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
  </figure>
  <section>
    <h3>جاري معالجة الدفع...</h3>
  </section>
  <aside class="tabular-nums text-sm">١٠٠.٠٠ دولار</aside>
</article>
```

## Accessibility

- Always set `aria-label="Loading"` and `role="status"` on the spinner SVG.
- `role="status"` makes the spinner announce as a status update when it appears in the accessibility tree.
- For a button or form control that triggers a loading state, add `disabled` (and optionally `aria-busy="true"`) to the control.
- The spinner is decorative when the loading state is communicated elsewhere (e.g., a text label "Loading..."). In that case, mark it `aria-hidden="true"` and let the text label carry the accessible name.
- For long-running operations, consider also providing a live region with a more descriptive update (e.g., "Loading user data…", "Almost done…").
- Respect `prefers-reduced-motion` by stopping the animation (Tailwind's `animate-spin` does this by default in modern setups; verify with your config).

## Gotchas

- The spinner is pure HTML — no Basecoat component CSS is required.
- The default icon is `loader-circle` (a ¾ circle spinner). Replace with any other rotating icon if you prefer.
- Use `size-*` utility to control the size. The default is `24x24` (the SVG's width/height attributes).
- The animation is provided by Tailwind's `animate-spin` utility. If you don't have Tailwind, add your own keyframe rotation.
- The animation respects `prefers-reduced-motion: reduce` by default (Tailwind v3+).
- Don't use `aria-busy="true"` on a `<div>` containing the spinner — use it on the form control being submitted instead.
- For determinate progress (a known percentage), use [Progress](./progress.md) instead. For indeterminate progress (no known duration), use Spinner.
