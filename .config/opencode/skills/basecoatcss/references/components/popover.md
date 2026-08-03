# Popover


An inline-positioned floating panel. Unlike shadcn/ui's portalled Base UI popover, Basecoat popovers are positioned relative to their `.popover` wrapper. This keeps the markup dependency-free.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/popover`
- **Root class:** `.popover`
- **Template macro:** `popover()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/popover";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/popover.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-side` | `data-popover` | `"top"`, `"right"`, `"bottom"`, `"left"`, `"inline-start"`, `"inline-end"` | Side the popover appears on. RTL-aware. |
| `data-align` | `data-popover` | `"start"`, `"center"`, `"end"` | Alignment along the chosen side. RTL-aware. |

## HTML structure

```html
<div class="popover">
  <button type="button" id="trigger" aria-expanded="false" aria-controls="content" class="btn" data-variant="outline">Open popover</button>
  <div id="content" data-popover aria-hidden="true" class="w-72">
    <header>
      <h4>Title</h4>
      <p>Description</p>
    </header>
    <!-- content -->
  </div>
</div>
```

- `<div class="popover">` — relative wrapper
- `<button aria-expanded aria-controls>` — trigger
- `<div data-popover aria-hidden="true">` — popover content

## Examples

### Basic

```html
<div class="popover">
  <button type="button" id="popover-basic-trigger" aria-expanded="false" aria-controls="popover-basic-popover" class="btn" data-variant="outline">Open</button>
  <div id="popover-basic-popover" data-popover aria-hidden="true" class="w-72">
    <header>
      <h4>Title</h4>
      <p>Description text here.</p>
    </header>
  </div>
</div>
```

### With form

```html
<div class="popover">
  <button type="button" id="popover-form-trigger" aria-expanded="false" aria-controls="popover-form-popover" class="btn" data-variant="outline">Open popover</button>
  <div id="popover-form-popover" data-popover aria-hidden="true" class="w-72">
    <header>
      <h4>Dimensions</h4>
      <p>Set the dimensions for the layer.</p>
    </header>
    <form class="grid gap-2" onsubmit="event.preventDefault()">
      <div class="grid grid-cols-3 items-center gap-4">
        <label for="width">Width</label>
        <input type="text" id="width" value="100%" class="input col-span-2 h-8" autofocus />
      </div>
      <div class="grid grid-cols-3 items-center gap-4">
        <label for="max-width">Max. width</label>
        <input type="text" id="max-width" value="300px" class="input col-span-2 h-8" />
      </div>
    </form>
  </div>
</div>
```

### Alignment

```html
<div class="flex flex-wrap gap-3">
  <div class="popover">
    <button id="start-trigger" type="button" aria-expanded="false" aria-controls="start-popover" class="btn" data-variant="outline">Start</button>
    <div id="start-popover" data-popover aria-hidden="true" class="w-56" data-align="start">
      <p>Aligned to start.</p>
    </div>
  </div>
  <div class="popover">
    <button id="center-trigger" type="button" aria-expanded="false" aria-controls="center-popover" class="btn" data-variant="outline">Center</button>
    <div id="center-popover" data-popover aria-hidden="true" class="w-56" data-align="center">
      <p>Aligned to center.</p>
    </div>
  </div>
  <div class="popover">
    <button id="end-trigger" type="button" aria-expanded="false" aria-controls="end-popover" class="btn" data-variant="outline">End</button>
    <div id="end-popover" data-popover aria-hidden="true" class="w-56" data-align="end">
      <p>Aligned to end.</p>
    </div>
  </div>
</div>
```

### Sides

All six sides: `top`, `right`, `bottom`, `left`, `inline-start`, `inline-end`.

```html
<div class="flex flex-wrap gap-3">
  <div class="popover">
    <button id="inline-start-trigger" type="button" aria-expanded="false" aria-controls="inline-start-popover" class="btn" data-variant="outline">Inline start</button>
    <div id="inline-start-popover" data-popover aria-hidden="true" data-side="inline-start" data-align="center" class="w-40">
      <p>Inline start side.</p>
    </div>
  </div>
  <div class="popover">
    <button id="top-trigger" type="button" aria-expanded="false" aria-controls="top-popover" class="btn" data-variant="outline">Top</button>
    <div id="top-popover" data-popover aria-hidden="true" data-side="top" data-align="center" class="w-40">
      <p>Top side.</p>
    </div>
  </div>
  <!-- ... right, bottom, left, inline-end ... -->
</div>
```

### RTL

```html
<div dir="rtl">
  <div class="popover">
    <button id="rtl-trigger" type="button" aria-expanded="false" aria-controls="rtl-popover" class="btn" data-variant="outline">فتح</button>
    <div id="rtl-popover" data-popover aria-hidden="true" class="w-72" data-align="start">
      <header>
        <h4>العنوان</h4>
        <p>نص الوصف هنا.</p>
      </header>
    </div>
  </div>
</div>
```

## JavaScript API

| API | Type | Description |
|---|---|---|
| `popover.open()` | Method | Opens the popover. |
| `popover.close()` | Method | Closes the popover. |
| `popover.toggle()` | Method | Toggles the popover. |

```js
const popover = document.querySelector("#popover-basic").basecoat;
popover.open();
popover.close();
```

## Accessibility

- The trigger button needs `aria-expanded` (reflecting the popover state) and `aria-controls` (pointing to the popover's id).
- The popover content has `aria-hidden="true"` when closed (handled by the script).
- For interactive content inside the popover, add `role="dialog"` if the popover is modal-like (blocks the rest of the page). For non-modal popovers, no role is needed.
- `Esc` closes the popover (handled by the script).
- Clicking outside the popover closes it.
- Decorative icons should be `aria-hidden="true"`.
- For a popover that contains a form, the first focusable element should be focused when the popover opens (use `autofocus` on the input, as in the example).

## Gotchas

- Unlike shadcn/ui's portalled Base UI popover, Basecoat popovers are inline-positioned. The popover content is a sibling of the trigger, positioned relative to the `.popover` wrapper. The popover does **not** portal to the body.
- The popover content is hidden with `aria-hidden="true"`. The script toggles this on open/close.
- `data-side` accepts logical values (`inline-start`, `inline-end`) and physical values (`left`, `right`). Use logical for RTL-aware behavior.
- The popover script manages click-outside and `Esc` close behavior. You don't need to handle them manually.
- For very wide popovers or those that need to overflow the wrapper, consider using a [Dialog](./dialog.md) instead.
- For popovers that need to escape the wrapper (e.g., dropdowns that need to extend beyond their parent), consider positioning strategies or using a portal library.
