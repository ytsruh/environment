# Badge


A small inline label for status, count, or category. Badges are designed to draw attention without dominating the layout.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.badge`
- **Native element:** `<span>` (or `<a>` for links)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/badge";
@import "basecoat-css/styles/vega";
```

## Variants

| Variant | Markup | Description |
|---|---|---|
| Default | `<span class="badge">` | Primary filled badge. |
| Secondary | `<span class="badge" data-variant="secondary">` | Muted background. |
| Destructive | `<span class="badge" data-variant="destructive">` | Error / destructive state. |
| Outline | `<span class="badge" data-variant="outline">` | Outlined style. |
| Ghost | `<span class="badge" data-variant="ghost">` | Transparent with no border. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-variant` | `"secondary"`, `"destructive"`, `"outline"`, `"ghost"` | Visual variant. |
| `data-icon` | `"inline-start"`, `"inline-end"` | Icon-aware spacing on a leading/trailing `<svg>`. |

## HTML structure

```html
<span class="badge">Default</span>
```

For an icon + text:

```html
<span class="badge">
  <svg data-icon="inline-start" ...></svg>
  Verified
</span>
```

## Examples

### Variants

```html
<div class="flex flex-wrap gap-2">
  <span class="badge">Default</span>
  <span class="badge" data-variant="secondary">Secondary</span>
  <span class="badge" data-variant="destructive">Destructive</span>
  <span class="badge" data-variant="outline">Outline</span>
  <span class="badge" data-variant="ghost">Ghost</span>
</div>
```

### With icon (leading)

```html
<span class="badge">
  <svg data-icon="inline-start" class="lucide lucide-badge-check" ...></svg>
  Verified
</span>
```

### With icon (trailing)

```html
<span class="badge" data-variant="secondary">
  Bookmark
  <svg data-icon="inline-end" class="lucide lucide-bookmark" ...></svg>
</span>
```

### With spinner

```html
<span class="badge" data-variant="destructive">
  <svg aria-label="Loading" role="status" data-icon="inline-start" class="animate-spin lucide lucide-loader-circle" ...></svg>
  Deleting
</span>
```

### As a link

```html
<a href="#" class="badge">
  Open Link
  <svg data-icon="inline-end" class="lucide lucide-arrow-up-right" ...></svg>
</a>
```

### Custom colors

Use Tailwind utilities to override colors:

```html
<div class="flex flex-wrap gap-2">
  <span class="badge bg-blue-50 text-blue-700 dark:bg-blue-950 dark:text-blue-300">Blue</span>
  <span class="badge bg-green-50 text-green-700 dark:bg-green-950 dark:text-green-300">Green</span>
</div>
```

### RTL

```html
<div dir="rtl" class="flex flex-wrap gap-2">
  <span class="badge">شارة</span>
  <span class="badge" data-variant="secondary">ثانوي</span>
</div>
```

## Accessibility

- Badges are purely presentational — pair them with descriptive text or a heading so the meaning is conveyed in context.
- For badges that convey status (e.g., "Verified"), include the status text or use an `aria-label` when the badge is icon-only.
- Decorative icons inside badges should be `aria-hidden="true"`.
- For dynamic badges that update (e.g., a notification count), wrap them in a live region or update with `aria-live="polite"`.
- When used as a link, the badge's text content is the accessible name of the link.

## Gotchas

- Badges are inline elements. Use `<span>` (not `<div>`) to keep them inline.
- Use `data-icon="inline-start"` / `"inline-end"` on the `<svg>` for icon-aware spacing — without it, the icon will not be spaced correctly.
- Icon size variants from [Button](./button.md) (`data-size="icon-xs"`, etc.) do **not** apply to badges. Use standard SVG sizing.
- For removable badges ("chip"-style with an X), see [Combobox](./combobox.md) multiple mode for that pattern.
- The "ghost" variant has no background and no border; it is suitable for use on solid backgrounds where you want minimal visual weight.
