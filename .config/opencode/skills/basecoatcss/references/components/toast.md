# Toast


A notification toast for non-blocking feedback. Toasts stack in a toaster container and auto-dismiss after a timeout.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/toast`
- **Root classes:** `.toaster` (container) and `.toast` (item)
- **Template macros:** `toaster()` and `toast()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/toast";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/toast.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-align` | `.toaster` | `"start"`, `"center"`, `"end"` | Toaster placement. |
| `data-category` | `.toast` | `"success"`, `"info"`, `"warning"`, `"error"` | Visual category. |
| `data-duration` | `.toast` | number | Override the timeout in milliseconds. `-1` to keep open. |
| `role` | `.toast` | `"status"`, `"alert"` | ARIA role. Default is `"status"` (or `"alert"` for error). |

## HTML structure

Toaster container (add one near the end of your page body):

```html
<div id="toaster" class="toaster"></div>
```

Toast item (server-rendered):

```html
<div class="toast" role="status" aria-atomic="true" aria-hidden="false" data-category="success">
  <div class="toast-content">
    <svg aria-hidden="true"><!-- icon --></svg>
    <section>
      <h2>Success</h2>
      <p>A success toast called from the front-end.</p>
    </section>
    <footer>
      <button type="button" class="btn" data-toast-action>Dismiss</button>
    </footer>
  </div>
</div>
```

- `<div id="toaster" class="toaster">` — toast container
- `<div class="toast">` — toast item
- `<div class="toast-content">` — content wrapper
- `<svg aria-hidden="true">` — icon (optional)
- `<section>` — message region
- `<h2>` — title
- `<p>` — description (optional)
- `<footer>` — action buttons or links (optional; clicking a footer button or link closes the toast)

## JavaScript API

| API | Type | Description |
|---|---|---|
| `toaster.toast(config)` | Method | Creates a toast from a config object and returns the inserted `.toast` element. |
| `toaster.closeAll()` | Method | Closes every toast inside the toaster. |
| `toast.close()` | Method | Closes one initialized toast element. |

### Config object

| Option | Type | Default | Description |
|---|---|---|---|
| `category` | `"success"`, `"info"`, `"warning"`, `"error"` | `"success"` | Toast category. Controls icon and ARIA role. |
| `title` | `string` | (required) | Toast title. |
| `description` | `string` | (optional) | Toast description. |
| `duration` | `number` | `3000` (or `5000` for error) | Timeout in milliseconds. `-1` to keep open. |
| `icon` | `string` | category icon | Custom icon HTML. |
| `action` | `object` | (optional) | Primary action. Supports `label` with either `href` or `onclick`. |
| `cancel` | `object` | (optional) | Secondary action. Supports `label` and optional `onclick`. |

## Examples

### Toaster with HTMX-served toast

```html
<button
  class="btn" data-variant="outline"
  hx-trigger="click"
  hx-select="unset"
  hx-get="/fragments/toast/success"
  hx-target="#toaster"
  hx-swap="beforeend"
>Toast from backend (with HTMX)</button>

<div id="toaster" class="toaster"></div>
```

The server returns a complete `<div class="toast">` markup. The toaster appends it.

### Toaster with front-end toast

```html
<button
  class="btn" data-variant="outline"
  onclick="document.getElementById('toaster').toast({
    category: 'success',
    title: 'Success',
    description: 'A success toast called from the front-end.',
    cancel: {
      label: 'Dismiss'
    }
  })"
>Toast from front-end</button>

<div id="toaster" class="toaster"></div>
```

### Server-rendered toast markup

```html
<div id="toaster" class="toaster">
  <div class="toast" role="status" aria-atomic="true" aria-hidden="false" data-category="success">
    <div class="toast-content">
      <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10" />
        <path d="m9 12 2 2 4-4" />
      </svg>
      <section>
        <h2>Success</h2>
        <p>A success toast called from the front-end.</p>
      </section>
      <footer>
        <button type="button" class="btn" data-toast-action>Dismiss</button>
      </footer>
    </div>
  </div>
</div>
```

### With action and cancel

```js
document.getElementById("toaster").toast({
  category: "info",
  title: "Update available",
  description: "A new version is ready to install.",
  duration: 10000,
  action: {
    label: "Update now",
    onclick: "window.location.reload()"
  },
  cancel: {
    label: "Later"
  }
});
```

### Custom duration (sticky)

```js
document.getElementById("toaster").toast({
  category: "warning",
  title: "Connection lost",
  description: "Trying to reconnect...",
  duration: -1  // keep open
});
```

### Close all toasts

```js
document.getElementById("toaster").closeAll();
```

### Close a specific toast

```js
const toastElement = document.querySelector(".toast");
toastElement.basecoat.close();
```

### Aligned toaster

```html
<div id="toaster" class="toaster" data-align="end"></div>
```

## Accessibility

- Use `role="status"` for non-urgent toasts (success, info). The toast is announced when it appears.
- Use `role="alert"` for urgent toasts (error). The toast interrupts the current announcement.
- The toast is announced as a whole — title and description together. Don't split them across multiple elements.
- Action buttons (e.g., "Undo") should be focusable and reachable via `Tab`. Use [Button](./button.md) classes.
- The toast auto-dismisses after the timeout. Provide enough time for the user to read and act.
- For sticky toasts (`duration: -1`), provide a clear way to dismiss (e.g., a close button).
- Don't rely solely on color to communicate the category — each category has a default icon and ARIA role.
- Toasts are transient. For important information that the user must address, use a [Dialog](./dialog.md) or [Alert Dialog](./alert-dialog.md) instead.

## Gotchas

- Add the toaster container once per page, near the end of `<body>`. Multiple toasters are allowed but unusual.
- The toaster script auto-initializes on page load and when new DOM is inserted. If you add a toaster container after `initAll()` runs, call `window.basecoat.initAll()` again.
- The default duration is `3000`ms (3 seconds). For error toasts, the default is `5000`ms (5 seconds). Override with `data-duration` or the `duration` config option.
- Use `duration: -1` to keep a toast open until the user dismisses it or a new operation completes.
- The toaster position defaults to the bottom-end. Override with `data-align="start"`, `"center"`, or `"end"`.
- For action buttons that should close the toast, add `data-toast-action` (the script handles the close on click).
- Server-rendered toasts need to be initialized. If you append them via `innerHTML` or HTMX swap, call `window.basecoat.initAll()` after the insertion.
- The toast animation is built-in. The toast slides in, pauses for the duration, then slides out.
- For accessibility, set `aria-atomic="true"` so the entire toast content is read as one unit.
- For a non-auto-dismissing toast (e.g., for a critical error), use `data-duration="-1"`. But consider a [Dialog](./dialog.md) instead for truly blocking notifications.
