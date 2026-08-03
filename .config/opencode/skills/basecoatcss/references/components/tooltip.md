# Tooltip


A CSS-only tooltip for displaying additional information on hover or focus. Text-only — no rich content, no portal.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root element:** any element (the tooltip is added via `data-tooltip`)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/tooltip";
@import "basecoat-css/styles/vega";
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-tooltip` | any | string | Tooltip text (required). |
| `data-side` | any | `"top"`, `"right"`, `"bottom"`, `"left"`, `"inline-start"`, `"inline-end"` | Tooltip side. Defaults to `"top"`. |
| `data-align` | any | `"start"`, `"center"`, `"end"` | Tooltip alignment. Defaults to `"center"`. |

## HTML structure

```html
<button class="btn" data-variant="outline" data-tooltip="Tooltip text" data-side="top">Hover</button>
```

Add `data-tooltip` to any element. The tooltip appears on hover and focus.

## Examples

### Default (top)

```html
<button class="btn" data-variant="outline" data-tooltip="Add to library">Hover</button>
```

### Sides

```html
<div class="flex flex-wrap gap-2">
  <button class="btn" data-variant="outline" data-tooltip="Tooltip" data-side="inline-start">Inline Start</button>
  <button class="btn" data-variant="outline" data-tooltip="Tooltip" data-side="top">Top</button>
  <button class="btn" data-variant="outline" data-tooltip="Tooltip" data-side="bottom">Bottom</button>
  <button class="btn" data-variant="outline" data-tooltip="Tooltip" data-side="inline-end">Inline End</button>
</div>
```

All six sides: `top`, `right`, `bottom`, `left`, `inline-start`, `inline-end`.

### Icon button

```html
<button class="btn" data-variant="ghost" data-size="icon" data-tooltip="Additional information" aria-label="Info">
  <svg class="lucide lucide-info" ...></svg>
</button>
```

### Disabled button

Wrap the disabled button in a span so the tooltip can still trigger on focus/hover:

```html
<span class="inline-block" data-tooltip="This feature is currently unavailable">
  <button class="btn" data-variant="outline" disabled>Disabled</button>
</span>
```

A disabled button cannot receive focus, so the wrapper span is what receives the tooltip events.

### Link

```html
<a href="#" class="text-primary text-sm underline-offset-4 hover:underline" data-tooltip="Click to read the documentation">Learn more</a>
```

### With kbd shortcut

```html
<button class="btn" data-variant="outline" data-tooltip="Open command palette" data-side="bottom">
  Search
  <kbd class="kbd" data-icon="inline-end">⌘K</kbd>
</button>
```

### RTL

```html
<div dir="rtl" class="flex gap-2">
  <button class="btn" data-variant="outline" data-tooltip="تلميح" data-side="inline-start">Inline Start</button>
  <button class="btn" data-variant="outline" data-tooltip="تلميح" data-side="inline-end">Inline End</button>
</div>
```

## Accessibility

- The trigger element must have an accessible name (visible text or `aria-label`).
- The tooltip text is associated with the trigger via `aria-describedby` automatically (when present and visible). For icon-only buttons, the tooltip can serve as the accessible name — add `aria-label` to be safe.
- The tooltip appears on hover and on focus. Users navigating with keyboard will see the tooltip when they focus the trigger.
- The tooltip is hidden from screen readers when not visible (handled by the CSS).
- For important information that the user must read, don't rely on tooltips — use a visible label, a [Popover](./popover.md), or inline text.
- Don't put interactive elements (links, buttons) inside the tooltip — the CSS-only tooltip doesn't support focus management. Use [Popover](./popover.md) for interactive content.

## Gotchas

- Basecoat tooltips are CSS-only and text-only. They cannot contain HTML, links, or buttons. For richer content, use [Popover](./popover.md) or [Dropdown Menu](./dropdown-menu.md).
- Unlike shadcn/ui, Basecoat tooltips do not portal. The tooltip is positioned relative to its trigger.
- The tooltip shows on `:hover` and `:focus-visible`. There's no click or manual trigger.
- The tooltip arrow can be hidden by removing the `::before` / `::after` pseudo-elements if needed. By default, Basecoat does not include a tooltip arrow.
- For long tooltip text, the tooltip will wrap. Set a `max-width` on the tooltip to control wrapping (the default is `max-width: 16rem`).
- For very small trigger elements, ensure the tooltip has enough hover/focus area. The trigger itself defines the hover area.
- Disabled buttons cannot trigger tooltips directly. Wrap in a span to enable the tooltip.
- The tooltip respects `prefers-reduced-motion` for the transition.
- The tooltip is keyboard-focusable but not interactive. `Tab` moves focus past the tooltip, not into it.
