# Avatar


A user/identity element. Shows an image with a fallback (initials or icon), supports sizes, a status badge, and grouping for stacked layouts.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.avatar` (and `.avatar-group` for grouped layouts)
- **Native element:** `<span>` or `<div>` (inline-level)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/avatar";
@import "basecoat-css/styles/vega";
```

## Sizes

| Size | Markup | Description |
|---|---|---|
| Small | `<span class="avatar" data-size="sm">` | ~32px. |
| Default | `<span class="avatar">` | ~40px. |
| Large | `<span class="avatar" data-size="lg">` | ~48px. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-size` | `"sm"`, `"lg"` | Avatar size. Omit for default. |

## HTML structure

```html
<span class="avatar">
  <img src="..." alt="User name" />
  <span>UN</span>  <!-- fallback initials -->
  <span class="avatar-badge"><!-- optional --></span>
</span>
```

- `<span class="avatar">` (or `<div>`) — root
- `<img>` — primary image; provide meaningful `alt`
- `<span>` — fallback initials or icon (rendered when image fails to load)
- `<span class="avatar-badge">` — optional status indicator
- `<div class="avatar-group">` — wrapper for stacked layouts
- `<span data-count>` — overflow count in a group

## Examples

### Basic

```html
<span class="avatar">
  <img src="https://github.com/shadcn.png" alt="@shadcn" />
  <span>CN</span>
</span>
```

### Initials only (no image)

```html
<span class="avatar"><span>JD</span></span>
```

### Sizes

```html
<span class="avatar" data-size="sm">
  <img src="..." alt="..." />
  <span>CN</span>
</span>
<span class="avatar">
  <img src="..." alt="..." />
  <span>CN</span>
</span>
<span class="avatar" data-size="lg">
  <img src="..." alt="..." />
  <span>CN</span>
</span>
```

### Status badge

```html
<span class="avatar">
  <img src="..." alt="..." />
  <span>CN</span>
  <span class="avatar-badge bg-green-600 dark:bg-green-800"></span>
</span>
```

### Badge with icon

```html
<span class="avatar">
  <img src="..." alt="..." />
  <span>PP</span>
  <span class="avatar-badge"><svg class="lucide lucide-plus" ...></svg></span>
</span>
```

### Avatar group (stacked)

```html
<div class="avatar-group">
  <span class="avatar"><img src="..." alt="@shadcn" /><span>CN</span></span>
  <span class="avatar"><img src="..." alt="@maxleiter" /><span>LR</span></span>
  <span class="avatar"><img src="..." alt="@evilrabbit" /><span>ER</span></span>
</div>
```

### Group with overflow count

```html
<div class="avatar-group">
  <span class="avatar"><img src="..." alt="@shadcn" /><span>CN</span></span>
  <span class="avatar"><img src="..." alt="@maxleiter" /><span>LR</span></span>
  <span class="avatar"><img src="..." alt="@evilrabbit" /><span>ER</span></span>
  <span data-count>+3</span>
</div>
```

### Rounded (square) variant

Add `rounded-lg` or any radius class to make the avatar square instead of circular:

```html
<span class="avatar rounded-lg">
  <img src="..." alt="..." />
  <span>ER</span>
</span>
```

### As a dropdown menu trigger

```html
<div class="dropdown-menu">
  <button type="button" id="avatar-trigger" aria-label="Open user menu" aria-haspopup="menu" aria-controls="avatar-menu" aria-expanded="false" class="btn rounded-full" data-variant="ghost" data-size="icon">
    <span class="avatar">
      <img src="..." alt="@shadcn" />
      <span>CN</span>
    </span>
  </button>
  <div data-popover aria-hidden="true" class="w-32">
    <div role="menu" id="avatar-menu" aria-labelledby="avatar-trigger">
      <div role="menuitem">Profile</div>
      <div role="menuitem">Billing</div>
    </div>
  </div>
</div>
```

### RTL

```html
<div class="avatar-group" dir="rtl">
  <span class="avatar"><img src="..." alt="..." /><span>CN</span></span>
</div>
```

## Accessibility

- Always provide meaningful `alt` text on the image. If the avatar represents a person's name, use that.
- The fallback span is decorative; mark it `aria-hidden="true"` if the image always loads.
- For status badges, provide an accessible name (e.g., `aria-label="Online"`) or use a visually hidden text node.
- For avatar groups with overflow counts, provide `aria-label` on the count element to explain what it represents (e.g., `aria-label="3 more users"`).
- When used as a button trigger, add `aria-label` to the button.

## Gotchas

- The fallback (`<span>` after the image) is shown when the image fails to load or hasn't loaded yet. It is hidden when the image loads successfully.
- Use `<span>` for inline contexts and `<div>` for block contexts. The default styles are designed for inline use.
- The `avatar-group` wrapper handles negative margin and overlap. Don't replicate this with manual margin utilities.
- For non-circular avatars (square with rounded corners), use `rounded-lg` or `rounded-md` on the `.avatar` element.
- Avatar badges are positioned at the block-end inline-end corner. They are absolute-positioned — the parent should be relatively positioned (which it is by default for `.avatar`).
