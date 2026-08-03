# Drawer


A side-pinned slide-over panel built on a native `<dialog>` element. Use for navigation, filters, or detail panels that need to be focus-trapped. **Beta component.**

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/drawer`
- **Root class:** `.drawer` (applied to a native `<dialog>`)
- **Native element:** `<dialog>`
- **Beta status:** API may change

## Imports

### CSS

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/drawer";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/drawer.min.js" defer></script>
```

## Sides

| Side | Markup | Description |
|---|---|---|
| Bottom (default) | `<dialog class="drawer">` | Slides up from the bottom. |
| Top | `<dialog class="drawer" data-side="top">` | Slides down from the top. |
| Right | `<dialog class="drawer" data-side="right">` | Slides in from the right. |
| Left | `<dialog class="drawer" data-side="left">` | Slides in from the left. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-side` | `"top"`, `"right"`, `"bottom"`, `"left"` | Side the drawer slides in from. Defaults to `"bottom"`. |

## HTML structure

```html
<button type="button" class="btn" data-variant="outline" onclick="document.getElementById('my-drawer').showModal()">Open Drawer</button>
<dialog id="my-drawer" class="drawer" aria-labelledby="my-drawer-title" aria-describedby="my-drawer-desc">
  <article>
    <header>
      <h2 id="my-drawer-title">Title</h2>
      <p id="my-drawer-desc">Description.</p>
    </header>
    <section>Body content.</section>
    <footer>
      <button type="button" class="btn" onclick="this.closest('dialog').close()">Submit</button>
      <button type="button" class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
    </footer>
  </article>
</dialog>
```

- Trigger button (optional) — calls `showModal()`
- `<dialog class="drawer">` — the native modal drawer
- `<article>` — content surface
- `<header>` — header with title and optional description
- `<section>` — scrollable body
- `<footer>` — action area

## JavaScript API

| API | Type | Description |
|---|---|---|
| `drawer.open()` | Method | Opens the drawer. |
| `drawer.close()` | Method | Closes the drawer. |
| `drawer.toggle()` | Method | Toggles the drawer. |

## Examples

### Basic (bottom, default)

```html
<button type="button" class="btn" data-variant="outline" onclick="document.getElementById('demo-drawer').showModal()">Open Drawer</button>
<dialog id="demo-drawer" class="drawer" aria-labelledby="demo-drawer-title" aria-describedby="demo-drawer-description">
  <article>
    <header class="mx-auto w-full max-w-sm">
      <h2 id="demo-drawer-title">Move Goal</h2>
      <p id="demo-drawer-description">Set your daily activity goal.</p>
    </header>
    <section class="px-4">
      <div class="mx-auto w-full max-w-sm">
        <div class="flex items-center justify-center gap-6">
          <button type="button" class="btn rounded-full" data-variant="outline" data-size="icon-sm" aria-label="Decrease">
            <svg aria-hidden="true"><!-- minus --></svg>
          </button>
          <div class="text-center">
            <div class="text-7xl font-bold">350</div>
            <div class="text-muted-foreground text-xs uppercase">Calories/day</div>
          </div>
          <button type="button" class="btn rounded-full" data-variant="outline" data-size="icon-sm" aria-label="Increase">
            <svg aria-hidden="true"><!-- plus --></svg>
          </button>
        </div>
      </div>
    </section>
    <footer class="mx-auto w-full max-w-sm">
      <button type="button" class="btn" onclick="this.closest('dialog').close()">Submit</button>
      <button type="button" class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
    </footer>
  </article>
</dialog>
```

### All four sides

```html
<div class="flex flex-wrap gap-2">
  <button type="button" class="btn" data-variant="outline" onclick="document.getElementById('d-top').showModal()">Top</button>
  <button type="button" class="btn" data-variant="outline" onclick="document.getElementById('d-right').showModal()">Right</button>
  <button type="button" class="btn" data-variant="outline" onclick="document.getElementById('d-bottom').showModal()">Bottom</button>
  <button type="button" class="btn" data-variant="outline" onclick="document.getElementById('d-left').showModal()">Left</button>
</div>

<dialog id="d-top" class="drawer" data-side="top" aria-labelledby="d-top-title">
  <article class="max-h-[50vh]">
    <header><h2 id="d-top-title">Top</h2></header>
    <section>Content...</section>
    <footer><button onclick="this.closest('dialog').close()">Close</button></footer>
  </article>
</dialog>

<dialog id="d-right" class="drawer" data-side="right" aria-labelledby="d-right-title">
  <article>
    <header><h2 id="d-right-title">Right</h2></header>
    <section>Content...</section>
    <footer><button onclick="this.closest('dialog').close()">Close</button></footer>
  </article>
</dialog>
```

### Scrollable content with sticky footer

```html
<dialog id="scrollable-drawer" class="drawer" aria-labelledby="scrollable-drawer-title" aria-describedby="scrollable-drawer-desc">
  <article>
    <header>
      <h2 id="scrollable-drawer-title">Move Goal</h2>
      <p id="scrollable-drawer-desc">Set your daily activity goal.</p>
    </header>
    <section class="px-4 max-h-[50vh] overflow-y-auto scrollbar">
      <p>Long content...</p>
    </section>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Close</button>
    </footer>
  </article>
</dialog>
```

## Accessibility

- Always set `aria-labelledby` (pointing to the title) and `aria-describedby` (pointing to the description) when present.
- The native `<dialog>` traps focus, returns focus to the trigger on close, and makes the rest of the page inert.
- `Esc` closes the drawer.
- For side drawers, set `data-side` to indicate the drawer's origin so screen readers can announce position.
- Use the `<article>` semantic for the drawer content.

## Gotchas

- The Drawer is **beta**. The API may change before the stable 1.0 release.
- Basecoat does not implement Vaul's drag-to-close gesture, snap points, or drag handle. Drawers close with outside click, `Esc`, or explicit close controls.
- The Drawer script adds safe backdrop-click close and lets the exit animation finish before calling the native close.
- Use `<article>` for the content surface (not `<div>`) for semantic correctness.
- The default side is `bottom`. If you want a different side, set `data-side` explicitly.
- For very tall content, use `max-h-[50vh]` (or appropriate value) on the `<article>` and `overflow-y-auto` on `<section>` to keep the footer visible.
