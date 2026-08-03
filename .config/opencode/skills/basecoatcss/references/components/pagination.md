# Pagination


There is no dedicated pagination component in Basecoat. Pagination is built using [Button](./button.md) and a `<nav>` landmark.

## Overview

- **CSS-only:** yes (uses Button styles)
- **JS module:** none

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/button";
@import "basecoat-css/styles/vega";
```

Pagination uses Button component CSS for its links and controls.

## HTML structure

```html
<nav role="navigation" aria-label="pagination" class="mx-auto flex w-full justify-center">
  <ul class="flex flex-row items-center gap-1">
    <li>
      <a href="#" class="btn" data-variant="ghost">
        <svg class="lucide lucide-chevron-left" ...></svg>
        <span>Previous</span>
      </a>
    </li>
    <li><a href="#" class="btn" data-variant="ghost" data-size="icon">1</a></li>
    <li><a href="#" class="btn" data-variant="outline" data-size="icon">2</a></li>
    <li><a href="#" class="btn" data-variant="ghost" data-size="icon">3</a></li>
    <li>
      <div class="size-9 flex items-center justify-center">
        <svg class="size-4 shrink-0 lucide lucide-ellipsis" ...></svg>
      </div>
    </li>
    <li>
      <a href="#" class="btn" data-variant="ghost">
        <span>Next</span>
        <svg class="lucide lucide-chevron-right" ...></svg>
      </a>
    </li>
  </ul>
</nav>
```

- `<nav role="navigation" aria-label="pagination">` — landmark
- `<ul>` — list of page controls
- `<li>` — each control or separator
- `<a class="btn">` — page link (use `<a>` for navigation, never `<button>`)
- `<a class="btn" data-variant="outline">` — current page indicator
- `<svg>` ellipsis — collapsed range indicator

## Examples

### Basic

```html
<nav role="navigation" aria-label="pagination" class="mx-auto flex w-full justify-center">
  <ul class="flex flex-row items-center gap-1">
    <li>
      <a href="#" class="btn" data-variant="ghost">
        <svg class="lucide lucide-chevron-left" ...></svg>
        Previous
      </a>
    </li>
    <li><a href="#" class="btn" data-variant="ghost" data-size="icon">1</a></li>
    <li><a href="#" class="btn" data-variant="outline" data-size="icon">2</a></li>
    <li><a href="#" class="btn" data-variant="ghost" data-size="icon">3</a></li>
    <li>
      <div class="size-9 flex items-center justify-center">
        <svg class="size-4 shrink-0 lucide lucide-ellipsis" ...></svg>
      </div>
    </li>
    <li>
      <a href="#" class="btn" data-variant="ghost">
        Next
        <svg class="lucide lucide-chevron-right" ...></svg>
      </a>
    </li>
  </ul>
</nav>
```

### Current page

Use `data-variant="outline"` on the current page link. For better accessibility, also add `aria-current="page"`:

```html
<li><a href="#" class="btn" data-variant="outline" data-size="icon" aria-current="page">2</a></li>
```

### First / Last / Disabled

```html
<li>
  <a href="#" class="btn" data-variant="ghost" data-size="icon" aria-label="First page">
    <svg class="lucide lucide-chevrons-left" ...></svg>
  </a>
</li>
<li>
  <a href="#" class="btn" data-variant="ghost" data-size="icon" aria-label="Previous page" rel="prev">
    <svg class="lucide lucide-chevron-left" ...></svg>
  </a>
</li>
<li>
  <span class="btn" data-variant="ghost" data-size="icon" aria-disabled="true" aria-label="Previous page (disabled)">
    <svg class="lucide lucide-chevron-left" ...></svg>
  </span>
</li>
```

### With size

Use `data-size` to match surrounding controls:

```html
<li><a href="#" class="btn" data-variant="ghost" data-size="icon-sm">1</a></li>
```

### RTL

```html
<nav dir="rtl" role="navigation" aria-label="ترقيم الصفحات" class="mx-auto flex w-full justify-center">
  <ul class="flex flex-row items-center gap-1">
    <li>
      <a href="#" class="btn" data-variant="ghost">
        <svg class="lucide lucide-chevron-right" ...></svg>
        <span>السابق</span>
      </a>
    </li>
    <li><a href="#" class="btn" data-variant="ghost" data-size="icon">١</a></li>
    <li><a href="#" class="btn" data-variant="outline" data-size="icon">٢</a></li>
    <li><a href="#" class="btn" data-variant="ghost" data-size="icon">٣</a></li>
    <li>
      <div class="size-9 flex items-center justify-center">
        <svg class="size-4 shrink-0 lucide lucide-ellipsis" ...></svg>
      </div>
    </li>
    <li>
      <a href="#" class="btn" data-variant="ghost">
        <span>التالي</span>
        <svg class="lucide lucide-chevron-left" ...></svg>
      </a>
    </li>
  </ul>
</nav>
```

## Accessibility

- Use `<nav role="navigation" aria-label="pagination">` (or localized "pagination" label) as the landmark.
- Use `<a>` for page links, never `<button>`. Pagination is navigation, not actions.
- Mark the current page with `aria-current="page"` and `data-variant="outline"` (or similar visual treatment).
- For disabled previous/next links, use `<span class="btn" aria-disabled="true">` instead of `<a>` (a disabled link is still in the tab order, which is confusing).
- For ellipsis separators (`...`), use a plain `<div>` or `<span>` with the icon. They're decorative; don't make them focusable.
- For icon-only previous/next links, add `aria-label="Previous page"` or `aria-label="Next page"`.
- For first/last page links, use `aria-label="First page"` / `aria-label="Last page"`.
- Add `rel="prev"` and `rel="next"` to the previous and next links for SEO and browser features.

## Gotchas

- Use `<a>` for page links. Using `<button>` would prevent middle-click open in new tab and other browser features.
- For current page indication, use both `aria-current="page"` (accessibility) and `data-variant="outline"` (visual).
- The ellipsis (`...`) is decorative. Use a plain `<div>` with the icon, not a focusable element.
- For RTL, the chevron icons should be swapped: `<` becomes `>` and vice versa.
- The Pagination pattern doesn't have a dedicated component, but it's small enough to be expressed in HTML + Button styles.
- For a smaller pagination, use `data-size="icon-sm"` on the buttons.
