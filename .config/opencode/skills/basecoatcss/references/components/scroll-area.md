# Scroll Area


A styled scrollable region. Scroll Area augments native scrolling with cross-browser scrollbar styling. It does not wrap content, replace browser behavior, or require JavaScript.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root classes:** `.scrollbar`, `.scrollbar-sm`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable (Scroll Area is part of `base`):

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/styles/vega";
```

## Sizes

| Size | Markup | Description |
|---|---|---|
| Default | `<div class="scrollbar">` | Standard scrollbar. |
| Small | `<div class="scrollbar-sm">` | Compact scrollbar (for menus, listboxes, sidebars, command results). |

## HTML structure

```html
<div class="scrollbar h-72 overflow-y-auto rounded-md border p-4">
  Your scrollable content here.
</div>
```

- `<div class="scrollbar">` or `class="scrollbar-sm"` — the scrollable element
- The scrollbar class is used with one of: `overflow-auto`, `overflow-y-auto`, `overflow-x-auto`

## Examples

### Vertical scroll

```html
<div class="card h-72 p-0">
  <div class="scrollbar h-full overflow-y-auto p-4">
    <div class="space-y-4">
      <h4 class="text-sm leading-none font-medium">Tags</h4>
      <div class="text-sm">
        <div class="border-b py-2">v1.2.0-beta.50</div>
        <div class="border-b py-2">v1.2.0-beta.49</div>
        <div class="border-b py-2">v1.2.0-beta.48</div>
        <!-- ... -->
      </div>
    </div>
  </div>
</div>
```

### Horizontal scroll

```html
<div class="card w-full max-w-sm p-0">
  <div class="scrollbar overflow-x-auto">
    <div class="flex w-max gap-4 p-4">
      <figure class="shrink-0">
        <div class="aspect-[3/4] w-40 rounded-md bg-muted"></div>
        <figcaption class="text-muted-foreground pt-2 text-xs">Photo by Ornella Binni</figcaption>
      </figure>
      <figure class="shrink-0">
        <div class="aspect-[3/4] w-40 rounded-md bg-muted"></div>
        <figcaption class="text-muted-foreground pt-2 text-xs">Photo by Tom Byrom</figcaption>
      </figure>
    </div>
  </div>
</div>
```

### Thin scrollbar (for menus, listboxes)

```html
<div class="card w-full max-w-sm p-1">
  <div class="px-2 py-1.5 text-xs font-medium text-muted-foreground">Recent files</div>
  <div class="scrollbar-sm max-h-48 overflow-y-auto">
    <button type="button" class="flex w-full items-center justify-between rounded-sm px-2 py-1.5 text-sm hover:bg-accent">
      <span>project-roadmap.md</span>
      <span class="text-xs text-muted-foreground">2m</span>
    </button>
    <button type="button" class="flex w-full items-center justify-between rounded-sm px-2 py-1.5 text-sm hover:bg-accent">
      <span>release-notes.md</span>
      <span class="text-xs text-muted-foreground">8m</span>
    </button>
    <!-- ... -->
  </div>
</div>
```

### RTL

```html
<div class="card h-72 p-0">
  <div dir="rtl" class="scrollbar h-full overflow-y-auto p-4">
    <div class="space-y-4">
      <h4 class="text-sm leading-none font-medium">العلامات</h4>
      <div class="text-sm">
        <div class="border-b py-2">v1.2.0-beta.50</div>
        <div class="border-b py-2">v1.2.0-beta.49</div>
      </div>
    </div>
  </div>
</div>
```

## Accessibility

- The native scroll behavior is preserved. Keyboard scrolling (arrow keys, `Page Up`/`Page Down`, `Home`/`End`, `Space`) works as expected.
- The scrollbar is styled, not removed. The scrollbar is a discoverable affordance for scrollable content.
- For very long content, consider adding a heading or summary at the top of the scrollable area.
- If the scroll area contains focusable elements, make sure they are reachable via `Tab`.
- For screen reader users, announce the scrollable nature of the region (e.g., "List of 50 items, scroll to see more"). The `aria-label` or visible heading can do this.

## Gotchas

- `scrollbar` and `scrollbar-sm` are **additive** to overflow utilities. You still need `overflow-auto`, `overflow-y-auto`, or `overflow-x-auto` on the same element.
- The class augments native scrolling; it does not replace it. No JavaScript, no virtualization, no custom scroll behavior.
- For long lists, the `scrollbar-sm` class is preferred to keep the UI compact.
- The scrollbar styling may not work in all browsers (notably older Safari). The default browser scrollbar will be shown as a fallback.
- The scrollbar is purely visual. Don't rely on it for accessibility — provide other navigation (links, tabs, etc.) for content that is "below the fold".
- For virtualized lists (where only visible items are rendered), use a virtual scrolling library. The `scrollbar` class works with virtualization, but the container still needs to have a defined height.
