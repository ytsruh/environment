# Skeleton


A loading placeholder. Use to show the shape of content while data is loading.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.skeleton`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/skeleton";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<div class="skeleton h-4 w-[150px]"></div>
```

The class is applied to a `<div>` (or any block element) with sizing utilities. The element renders as a gray block with a subtle pulse animation.

## Examples

### Text line

```html
<div class="skeleton h-4 w-[150px]"></div>
```

### Multiple lines

```html
<div class="flex flex-col gap-2">
  <div class="skeleton h-4 w-full"></div>
  <div class="skeleton h-4 w-full"></div>
  <div class="skeleton h-4 w-3/4"></div>
</div>
```

### Avatar

```html
<div class="flex items-center gap-4">
  <div class="skeleton size-10 shrink-0 rounded-full"></div>
  <div class="grid gap-2">
    <div class="skeleton h-4 w-[150px]"></div>
    <div class="skeleton h-4 w-[100px]"></div>
  </div>
</div>
```

### Card

```html
<div class="card w-full">
  <header>
    <div class="skeleton h-4 w-2/3"></div>
    <div class="skeleton h-4 w-1/2"></div>
  </header>
  <section>
    <div class="skeleton aspect-video w-full"></div>
  </section>
</div>
```

### Form

```html
<div class="flex flex-col gap-7">
  <div class="flex flex-col gap-3">
    <div class="skeleton h-4 w-20"></div>
    <div class="skeleton h-10 w-full"></div>
  </div>
  <div class="flex flex-col gap-3">
    <div class="skeleton h-4 w-24"></div>
    <div class="skeleton h-10 w-full"></div>
  </div>
  <div class="skeleton h-9 w-24"></div>
</div>
```

### Table

```html
<div class="flex flex-col gap-2">
  <div class="flex gap-4">
    <div class="skeleton h-4 flex-1"></div>
    <div class="skeleton h-4 w-24"></div>
    <div class="skeleton h-4 w-20"></div>
  </div>
  <div class="flex gap-4">
    <div class="skeleton h-4 flex-1"></div>
    <div class="skeleton h-4 w-24"></div>
    <div class="skeleton h-4 w-20"></div>
  </div>
  <div class="flex gap-4">
    <div class="skeleton h-4 flex-1"></div>
    <div class="skeleton h-4 w-24"></div>
    <div class="skeleton h-4 w-20"></div>
  </div>
</div>
```

### RTL

```html
<div dir="rtl" class="flex items-center gap-4">
  <div class="skeleton size-10 shrink-0 rounded-full"></div>
  <div class="grid gap-2">
    <div class="skeleton h-4 w-[150px]"></div>
    <div class="skeleton h-4 w-[100px]"></div>
  </div>
</div>
```

## Accessibility

- Skeleton elements should be `aria-hidden="true"` or replaced with live region announcements. Otherwise, screen readers will announce the placeholder text.
- Provide a parent loading announcement: `<div role="status" aria-live="polite">Loading…</div>` or `<div role="status">Loading…</div>` near the skeleton block.
- For longer loading times, consider an additional live region that announces progress.
- After content loads, remove the skeleton and replace with real content. Announce the loaded content with a separate live region if needed.
- For image skeletons, use `aria-label="Loading image"` or similar.

## Gotchas

- Skeleton elements are visual placeholders only. They are not interactive and do not represent real content.
- Use sizing utilities (`h-*`, `w-*`, `size-*`) to set the dimensions. The class does not provide default sizing.
- The pulse animation is built-in. To disable it for users with `prefers-reduced-motion`, the animation respects that media query.
- The skeleton background uses the `--muted` token (or similar). To customize the color, override the `background-color` with a utility.
- For dark mode, the skeleton adjusts automatically.
- Don't use skeletons for text content that should be readable. Use them only for content that is genuinely loading.
