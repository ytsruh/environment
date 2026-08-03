# Breadcrumb


A navigation aid showing the user's location in a site hierarchy. Uses a native `<nav>` landmark with an ordered list of ancestors.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.breadcrumb`
- **Native element:** `<nav>` + `<ol>`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/breadcrumb";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<nav class="breadcrumb" aria-label="Breadcrumb">
  <ol>
    <li><a href="#">Home</a></li>
    <li aria-hidden="true"><svg data-rtl-flip class="lucide lucide-chevron-right" ...></svg></li>
    <li><a href="#">Components</a></li>
    <li aria-hidden="true"><svg data-rtl-flip class="lucide lucide-chevron-right" ...></svg></li>
    <li><span aria-current="page">Breadcrumb</span></li>
  </ol>
</nav>
```

- `<nav class="breadcrumb" aria-label="Breadcrumb">` — landmark
- `<ol>` — ordered list in hierarchy order
- `<li><a>` — navigable ancestor
- `<li aria-hidden="true">` — visual separator (chevron, slash, dot, etc.)
- `<li><span aria-current="page">` — current page
- `<li><span aria-hidden="true">` — collapsed ellipsis

## Data attributes

| Attribute | Element | Description |
|---|---|---|
| `data-rtl-flip` | separator `<svg>` | Optional. When set, the chevron will be flipped in RTL. Basecoat provides CSS to handle this; you can also use `rtl:rotate-180`. |
| `aria-hidden` | separator `<li>` | Required. Hide the visual separator from screen readers. |
| `aria-current` | current `<span>` | Required. Use `"page"` for the current page. |

## Examples

### Basic

```html
<nav class="breadcrumb" aria-label="Breadcrumb">
  <ol>
    <li><a href="#">Home</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><a href="#">Components</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><span aria-current="page">Breadcrumb</span></li>
  </ol>
</nav>
```

### Custom separator

Replace the chevron with any icon — dot, slash, etc. Always mark the separator `aria-hidden="true"`.

```html
<nav class="breadcrumb" aria-label="Breadcrumb">
  <ol>
    <li><a href="#">Home</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-dot" ...></svg></li>
    <li><a href="#">Components</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-dot" ...></svg></li>
    <li><span aria-current="page">Breadcrumb</span></li>
  </ol>
</nav>
```

### Collapsed (ellipsis)

Use an ellipsis for long paths. The ellipsis `<li>` should be `aria-hidden="true"`.

```html
<nav class="breadcrumb" aria-label="Breadcrumb">
  <ol>
    <li><a href="#">Home</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><span aria-hidden="true"><svg class="lucide lucide-ellipsis" ...></svg></span></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><a href="#">Components</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><span aria-current="page">Breadcrumb</span></li>
  </ol>
</nav>
```

### With dropdown menu in the middle

Replace a separator with a dropdown menu trigger to show alternative paths.

```html
<nav class="breadcrumb" aria-label="Breadcrumb">
  <ol>
    <li><a href="#">Home</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li>
      <div class="dropdown-menu">
        <button type="button" id="bc-trigger" class="btn" data-variant="ghost" data-size="icon-sm" aria-haspopup="menu" aria-controls="bc-menu" aria-expanded="false">
          <svg class="lucide lucide-ellipsis" ...></svg>
          <span class="sr-only">Toggle menu</span>
        </button>
        <div data-popover aria-hidden="true">
          <div role="menu" id="bc-menu" aria-labelledby="bc-trigger">
            <div role="menuitem">Documentation</div>
            <div role="menuitem">Themes</div>
            <div role="menuitem">GitHub</div>
          </div>
        </div>
      </div>
    </li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><a href="#">Components</a></li>
    <li aria-hidden="true"><svg class="lucide lucide-chevron-right" ...></svg></li>
    <li><span aria-current="page">Breadcrumb</span></li>
  </ol>
</nav>
```

### RTL

```html
<nav class="breadcrumb" aria-label="Breadcrumb" dir="rtl">
  <ol>
    <li><a href="#">الرئيسية</a></li>
    <li aria-hidden="true"><svg data-rtl-flip class="lucide lucide-chevron-right" ...></svg></li>
    <li><a href="#">المكونات</a></li>
    <li aria-hidden="true"><svg data-rtl-flip class="lucide lucide-chevron-right" ...></svg></li>
    <li><span aria-current="page">مسار التنقل</span></li>
  </ol>
</nav>
```

## Accessibility

- Use a `<nav>` landmark with `aria-label="Breadcrumb"` (or localized equivalent) so screen readers can identify the breadcrumb region.
- Always mark the current page with `aria-current="page"`.
- Visual separators (chevrons, dots, slashes) must be `aria-hidden="true"` so they're not announced.
- Use `<ol>` (ordered list) because the hierarchy is sequential, not a set. Avoid `<ul>`.
- For collapsed ellipses, mark the entire ellipsis `<li>` as `aria-hidden="true"`. If the user needs to navigate to a hidden ancestor, provide a separate mechanism (e.g., a dropdown).
- Don't put interactive elements inside an `aria-hidden` `<li>`.

## Gotchas

- Use `<span aria-current="page">` (not `<a>`) for the current page — the current page should not be a link.
- The default separator is a chevron. Use any other icon (dot, slash) by replacing the SVG.
- For RTL, the chevron should be flipped. Use `data-rtl-flip` (Basecoat provides the CSS) or `rtl:rotate-180`.
- For a long path with collapsed ancestors, use the ellipsis pattern with `aria-hidden="true"`.
- The breadcrumb is an `<ol>` (ordered list) because the path is sequential. Do not use `<ul>`.
