# Button Group


A container that visually joins related buttons into a single segmented control. Use for toolbars, segmented selects, or split buttons.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.button-group`
- **Native element:** any block container (typically `<div>`)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/button-group";
@import "basecoat-css/components/button";
@import "basecoat-css/styles/vega";
```

Button Group composes Button styles for its child controls.

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-orientation` | `"vertical"` | Stacks items vertically instead of horizontally. |
| `data-size` | (inherited from button) | Pass through to children via direct child styles. |

## HTML structure

```html
<div role="group" class="button-group">
  <button type="button" class="btn" data-variant="outline">Option A</button>
  <button type="button" class="btn" data-variant="outline">Option B</button>
</div>
```

- `role="group"` (recommended) — groups related controls
- `aria-label` (recommended) — names the group for screen readers
- `<button>` / `<a>` — the joined controls
- `<hr role="separator">` — visual divider (for split buttons or grouped controls)
- `<span>`, `<label>`, `<output>` — non-interactive text segments
- `<div>` — custom layout (left unstyled)

## Examples

### Basic

```html
<div role="group" aria-label="Message actions" class="button-group">
  <button type="button" class="btn" data-variant="outline">Archive</button>
  <button type="button" class="btn" data-variant="outline">Report</button>
</div>
```

### Vertical orientation

```html
<div role="group" aria-label="Media controls" class="button-group h-fit" data-orientation="vertical">
  <button type="button" class="btn" data-variant="outline" data-size="icon" aria-label="Zoom in">
    <svg class="lucide lucide-plus" ...></svg>
  </button>
  <button type="button" class="btn" data-variant="outline" data-size="icon" aria-label="Zoom out">
    <svg class="lucide lucide-minus" ...></svg>
  </button>
</div>
```

### Sizes (pass through to children)

```html
<div class="flex flex-col items-start gap-8">
  <div role="group" class="button-group">
    <button type="button" class="btn" data-variant="outline" data-size="sm">Small</button>
    <button type="button" class="btn" data-variant="outline" data-size="sm">Group</button>
  </div>
  <div role="group" class="button-group">
    <button type="button" class="btn" data-variant="outline">Default</button>
    <button type="button" class="btn" data-variant="outline">Group</button>
  </div>
  <div role="group" class="button-group">
    <button type="button" class="btn" data-variant="outline" data-size="lg">Large</button>
    <button type="button" class="btn" data-variant="outline" data-size="lg">Group</button>
  </div>
</div>
```

### Nested groups (joined within, spaced between)

```html
<div role="group" aria-label="Pagination controls" class="button-group">
  <div role="group" class="button-group">
    <button type="button" class="btn" data-variant="outline" data-size="sm">1</button>
    <button type="button" class="btn" data-variant="outline" data-size="sm">2</button>
    <button type="button" class="btn" data-variant="outline" data-size="sm">3</button>
  </div>
  <div role="group" class="button-group">
    <button type="button" class="btn" data-variant="outline" data-size="icon-sm" aria-label="Previous">
      <svg class="lucide lucide-arrow-left" ...></svg>
    </button>
    <button type="button" class="btn" data-variant="outline" data-size="icon-sm" aria-label="Next">
      <svg class="lucide lucide-arrow-right" ...></svg>
    </button>
  </div>
</div>
```

### Separator (split button)

```html
<div role="group" class="button-group">
  <button type="button" class="btn" data-variant="secondary">Button</button>
  <hr role="separator" />
  <button type="button" class="btn" data-variant="secondary" data-size="icon" aria-label="Add">
    <svg class="lucide lucide-plus" ...></svg>
  </button>
</div>
```

### With input

```html
<div role="group" aria-label="Search" class="button-group">
  <input type="text" class="input" placeholder="Search..." />
  <button type="button" class="btn" data-variant="outline" aria-label="Search">
    <svg class="lucide lucide-search" ...></svg>
  </button>
</div>
```

### With input group

```html
<div role="group" class="button-group">
  <div role="group" class="button-group">
    <button type="button" class="btn" data-variant="outline" data-size="icon" aria-label="Add attachment">
      <svg class="lucide lucide-plus" ...></svg>
    </button>
  </div>
  <div role="group" class="button-group">
    <div class="input-group">
      <input type="text" placeholder="Send a message..." />
      <div role="group" data-align="inline-end">
        <button type="button" class="btn" data-variant="ghost" data-size="icon-xs" aria-label="Voice mode" aria-pressed="false">
          <svg class="lucide lucide-audio-lines" ...></svg>
        </button>
      </div>
    </div>
  </div>
</div>
```

### With dropdown menu

```html
<div role="group" class="button-group">
  <button type="button" class="btn" data-variant="outline">Follow</button>
  <div id="trigger" class="dropdown-menu">
    <button type="button" id="trigger-btn" aria-haspopup="menu" aria-controls="trigger-menu" aria-expanded="false" class="btn" data-variant="outline" data-size="icon" aria-label="More options">
      <svg class="lucide lucide-chevron-down" ...></svg>
    </button>
    <div data-popover aria-hidden="true" data-align="end">
      <div role="menu" id="trigger-menu" aria-labelledby="trigger-btn">
        <div role="menuitem">Mute</div>
        <div role="menuitem">Report</div>
      </div>
    </div>
  </div>
</div>
```

### With select

```html
<div class="flex items-stretch gap-2">
  <div role="group" aria-label="Currency amount" class="button-group">
    <div class="select">
      <button type="button" id="currency-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="currency-listbox">
        <span class="truncate">$</span>
        <svg class="lucide lucide-chevron-down" ...></svg>
      </button>
      <div data-popover aria-hidden="true">
        <div role="listbox" id="currency-listbox" aria-orientation="vertical" aria-labelledby="currency-trigger">
          <div role="option" data-value="$" data-label="$" aria-selected="true">$ <span class="text-muted-foreground">US Dollar</span></div>
          <div role="option" data-value="€" data-label="€">€ <span class="text-muted-foreground">Euro</span></div>
        </div>
      </div>
      <input type="hidden" name="currency" value="$" />
    </div>
    <input type="text" class="input" placeholder="10.00" />
  </div>
  <button type="button" class="btn" data-variant="outline" data-size="icon" aria-label="Submit">
    <svg class="lucide lucide-arrow-right" ...></svg>
  </button>
</div>
```

### RTL

```html
<div dir="rtl">
  <div role="group" aria-label="إجراءات الرسالة" class="button-group">
    <div role="group" class="button-group">
      <button type="button" class="btn" data-variant="outline" data-size="icon" aria-label="رجوع">
        <svg class="rtl:rotate-180 lucide lucide-arrow-left" ...></svg>
      </button>
    </div>
    <div role="group" class="button-group">
      <button type="button" class="btn" data-variant="outline">أرشفة</button>
      <button type="button" class="btn" data-variant="outline">تقرير</button>
    </div>
  </div>
</div>
```

## Accessibility

- Always add `role="group"` and `aria-label` to the root to identify the group for screen readers.
- Each button inside the group follows normal button accessibility (see [Button](./button.md)).
- For split buttons (button + separator + button), the separator should be `role="separator"`.
- For toggle buttons inside a group, use `aria-pressed="true"` / `"false"`.
- For radio-button-like groups, use `role="radiogroup"` and `role="radio"` with `aria-checked`.

## Gotchas

- The root element is just a styled wrapper. It does not constrain children to be a specific tag.
- Direct child `<div>` elements are left unstyled (use for custom layouts).
- Direct child `<span>`, `<label>`, or `<output>` elements are styled as non-interactive text segments.
- Use `<hr role="separator">` for visible dividers.
- Nested `.button-group` elements are joined within their own group but spaced between outer groups.
- For dropdown menus, select, or popover inside a button group, wrap the entire interactive component (including its `data-popover`) inside the group, not just the trigger button.
