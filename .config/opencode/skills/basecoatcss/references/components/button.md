# Button


A clickable control for actions. Buttons support multiple variants (primary, secondary, outline, ghost, link, destructive), sizes (xs, sm, default, lg, and icon-only sizes), and icon-aware spacing.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.btn`
- **Native element:** `<button>` (or `<a>` for navigation)

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

## Variants

| Variant | Markup | Description |
|---|---|---|
| Primary (default) | `<button class="btn">` | Default primary action. Filled. |
| Secondary | `<button class="btn" data-variant="secondary">` | Muted background. |
| Outline | `<button class="btn" data-variant="outline">` | Outlined style. |
| Ghost | `<button class="btn" data-variant="ghost">` | Transparent; hover surface only. |
| Link | `<button class="btn" data-variant="link">` | Styled as a link. |
| Destructive | `<button class="btn" data-variant="destructive">` | Error / destructive action. |

## Sizes

| Size | Markup | Description |
|---|---|---|
| Extra small | `<button class="btn" data-size="xs">` | Compact text. |
| Small | `<button class="btn" data-size="sm">` | Standard smaller. |
| Default | `<button class="btn">` | Default. |
| Large | `<button class="btn" data-size="lg">` | Larger. |
| Icon extra small | `<button class="btn" data-size="icon-xs">` | Square for icons. |
| Icon small | `<button class="btn" data-size="icon-sm">` | Square for icons. |
| Icon | `<button class="btn" data-size="icon">` | Default square for icons. |
| Icon large | `<button class="btn" data-size="icon-lg">` | Larger square for icons. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-variant` | `"secondary"`, `"outline"`, `"ghost"`, `"link"`, `"destructive"` | Visual variant. Omit for primary. |
| `data-size` | `"xs"`, `"sm"`, `"lg"`, `"icon"`, `"icon-xs"`, `"icon-sm"`, `"icon-lg"` | Size. Omit for default. |
| `data-icon` | `"inline-start"`, `"inline-end"` | Icon-aware spacing on the `<svg>`. |

## HTML structure

```html
<button type="button" class="btn">Primary</button>
<button type="button" class="btn" data-variant="outline">Outline</button>
```

For a navigation link, use `<a class="btn">` with `href`.

## Examples

### Variants

```html
<div class="flex flex-wrap items-center gap-2">
  <button type="button" class="btn">Button</button>
  <button type="button" class="btn" data-variant="secondary">Secondary</button>
  <button type="button" class="btn" data-variant="outline">Outline</button>
  <button type="button" class="btn" data-variant="ghost">Ghost</button>
  <button type="button" class="btn" data-variant="link">Link</button>
  <button type="button" class="btn" data-variant="destructive">Destructive</button>
</div>
```

### Sizes

```html
<div class="flex flex-wrap items-center gap-2">
  <button type="button" class="btn" data-variant="outline" data-size="xs">Extra Small</button>
  <button type="button" class="btn" data-variant="outline" data-size="sm">Small</button>
  <button type="button" class="btn" data-variant="outline">Default</button>
  <button type="button" class="btn" data-variant="outline" data-size="lg">Large</button>
</div>
```

### Icon only

```html
<button type="button" class="btn" data-variant="outline" data-size="icon" aria-label="Submit">
  <svg class="lucide lucide-arrow-up" ...></svg>
</button>
```

Available icon sizes: `icon-xs`, `icon-sm`, `icon`, `icon-lg`.

### With icon (text button)

Add `data-icon="inline-start"` or `data-icon="inline-end"` on the `<svg>` to get icon-aware spacing:

```html
<button type="button" class="btn" data-variant="outline" data-size="sm">
  <svg data-icon="inline-start" class="lucide lucide-git-branch" ...></svg>
  New Branch
</button>
```

### Rounded (pill)

```html
<button type="button" class="btn rounded-full" data-variant="outline" data-size="icon" aria-label="Scroll up">
  <svg class="lucide lucide-arrow-up" ...></svg>
</button>
```

### With spinner (loading state)

```html
<button type="button" class="btn" disabled>
  <svg data-icon="inline-start" class="animate-spin lucide lucide-loader-circle" ...></svg>
  Generating
</button>
<button type="button" class="btn" data-variant="secondary" disabled>
  Downloading
  <svg data-icon="inline-end" class="animate-spin lucide lucide-loader-circle" ...></svg>
</button>
```

### As a link

```html
<a href="https://example.com" class="btn" data-variant="outline">
  Visit example.com
</a>
```

### Inside a button group

See [Button Group](./button-group.md).

### RTL

```html
<div dir="rtl" class="flex flex-wrap items-center gap-2">
  <button type="button" class="btn" data-variant="outline">زر</button>
  <button type="button" class="btn" data-variant="destructive">حذف</button>
  <button type="button" class="btn" data-variant="outline">
    إرسال
    <svg data-icon="inline-end" class="rtl:rotate-180 lucide lucide-arrow-right" ...></svg>
  </button>
</div>
```

## Accessibility

- Always use `<button type="button">` for actions and `<a href>` for navigation. Native semantics include focus, keyboard, and form participation.
- Icon-only buttons require an accessible name — use `aria-label` (e.g., `aria-label="Close"`) or wrap in a `<label>`.
- For destructive actions, prefer `data-variant="destructive"` and add a confirmation step (e.g., a [Dialog](./dialog.md) or [Alert Dialog](./alert-dialog.md)) for irreversible operations.
- `disabled` buttons cannot receive focus and are excluded from the tab order. For a button that should remain focusable but inactive, use `aria-disabled="true"` and handle clicks manually.
- For loading state, set `disabled` and use a spinner. Don't rely on `aria-busy` alone.

## Gotchas

- Use `<button type="button">` to prevent form submission when used outside a `<form>`. The default `type` is `"submit"`.
- For icon-only buttons, use a dedicated icon size (`icon`, `icon-xs`, etc.) — not the text sizes.
- For text buttons with icons, use `data-icon="inline-start"` / `"inline-end"` on the `<svg>` for proper spacing.
- Use `rounded-full` for a pill-shaped button (especially for icon buttons).
- For form submission, the default `<button>` without `type` submits the form. Add `type="button"` for non-submit actions.
- The `link` variant looks like a link but is still a button. Use `<a class="btn" data-variant="link">` for actual navigation.
