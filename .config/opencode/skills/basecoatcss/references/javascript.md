---
description: Basecoat JavaScript API, controllers, init lifecycle, force reinit, and framework integration (HTMX, Turbo, Alpine, vanilla).
globs: "*.{js,ts,mjs,jsx,tsx}"
---

# JavaScript


Basecoat's JavaScript layer is small. The 11 interactive components each register a controller. The runtime auto-initializes controllers on `DOMContentLoaded` and when new DOM is inserted, and exposes a global `window.basecoat` API for manual control and re-initialization.

## Contents

- [The 11 interactive components](#the-11-interactive-components)
- [Global API](#global-api)
- [Per-component controllers](#per-component-controllers)
- [Lifecycle hooks](#lifecycle-hooks)
- [Framework integration](#framework-integration)
- [Manual initialization](#manual-initialization)
- [Force re-initialization](#force-re-initialization)
- [Disabling a component](#disabling-a-component)
- [Custom events](#custom-events)

## The 11 interactive components

| Component | JS module | Needs basecoat runtime |
|---|---|---|
| Accordion | `basecoat-css/tabs` (when used as tabs) or none (when native `<details>`) | No (native) / Yes (advanced) |
| Combobox | `basecoat-css/combobox` | Yes |
| Command | `basecoat-css/command` | Yes |
| Dialog | none | No — uses native `HTMLDialogElement` |
| Drawer | `basecoat-css/drawer` | Yes |
| Dropdown Menu | `basecoat-css/dropdown-menu` | Yes |
| Popover | `basecoat-css/popover` | Yes |
| Select | `basecoat-css/select` | Yes |
| Sidebar | `basecoat-css/sidebar` | Yes |
| Slider | `basecoat-css/range` | Yes |
| Tabs | `basecoat-css/tabs` | Yes |
| Toast | `basecoat-css/toast` | Yes |
| Chart | `basecoat-css/chart` | Yes (Chart.js separately) |

Accordion: simple accordions use native `<details>`/`<summary>` and need no JS. Advanced accordion behaviors (single-open, controlled open state) use the `tabs` controller with a different data shape — see `components/accordion.md`.

Dialog: the dialog itself uses the native `HTMLDialogElement` API. There is no Basecoat JS for it. Open with `dialog.showModal()` and close with `dialog.close()`.

## Global API

```ts
window.basecoat = {
  // Manually initialize all uninitialized Basecoat components
  initAll(): void;

  // Manually initialize, destroying existing instances first
  initAll(options: { force: true }): void;

  // Register a component type
  register(name: string, controller: ControllerClass): void;

  // Inspect all registered controllers
  controllers: Map<string, ControllerClass>;
};
```

The runtime is set by `basecoat-css/basecoat` (or the equivalent `dist/js/basecoat.min.js`). It is required by every individual component script.

## Per-component controllers

Each interactive component exposes a controller on the root element. Access it via `element.basecoat`:

```js
const dropdown = document.querySelector("#my-dropdown-menu");
dropdown.basecoat.open();
dropdown.basecoat.close();
dropdown.basecoat.toggle();
dropdown.basecoat.refresh();
```

### Dropdown Menu

| Method | Description |
|---|---|
| `dropdown.open()` | Opens the menu. |
| `dropdown.close()` | Closes the menu. |
| `dropdown.toggle()` | Toggles the menu. |
| `dropdown.refresh()` | Rescans menu items after children change inside the existing `role="menu"` element. |

### Select

| Method | Description |
|---|---|
| `select.open()` | Opens the popover. |
| `select.close()` | Closes the popover. |
| `select.toggle()` | Toggles the popover. |
| `select.refresh()` | Rescans options after the listbox children change. |
| `select.setValue(value)` | Sets the current value programmatically. |
| `select.clear()` | Clears the selection. |

### Popover

| Method | Description |
|---|---|
| `popover.open()` | Opens the popover. |
| `popover.close()` | Closes the popover. |
| `popover.toggle()` | Toggles the popover. |

### Tabs

| Method | Description |
|---|---|
| `tabs.activate(index)` | Activates the tab at the given (zero-based) index. |
| `tabs.refresh()` | Rescans tabs and panels after children change. |

### Toast / Toaster

```js
const toaster = document.querySelector("#my-toaster");
toaster.basecoat.show({
  category: "success",            // "success" | "error" | "info" | "warning"
  title: "Saved",
  description: "Your changes were saved.",
  duration: 4000,                  // ms, default; -1 to keep open
  icon: "<svg>...</svg>",          // optional custom icon HTML
  action: { label: "Undo", onclick: "undo()" },   // optional
  cancel: { label: "Dismiss" },                    // optional
});
toaster.basecoat.dismiss(toastElement);
toaster.basecoat.dismissAll();
```

### Combobox

| Method | Description |
|---|---|
| `combobox.open()` | Opens the popover. |
| `combobox.close()` | Closes the popover. |
| `combobox.refresh()` | Rescans options after the listbox children change. |
| `combobox.setValue(value)` | Sets the current value(s) programmatically. |
| `combobox.clear()` | Clears the selection. |

### Command / Command Dialog

| Method | Description |
|---|---|
| `command.open()` | Opens the command menu. |
| `command.close()` | Closes the command menu. |
| `command.refresh()` | Rescans items. |
| `commandDialog.open()` | Opens the command dialog. |
| `commandDialog.close()` | Closes the command dialog. |

### Drawer

| Method | Description |
|---|---|
| `drawer.open()` | Opens the drawer. |
| `drawer.close()` | Closes the drawer. |
| `drawer.toggle()` | Toggles the drawer. |

### Sidebar

| Method | Description |
|---|---|
| `sidebar.open()` | Opens the sidebar. |
| `sidebar.close()` | Closes the sidebar. |
| `sidebar.toggle()` | Toggles the sidebar. |

### Slider

| Method | Description |
|---|---|
| `slider.refresh()` | Rescans the range after attributes change. |

## Lifecycle hooks

Basecoat dispatches custom events on the root element of each interactive component. Use them to hook into state changes without monkey-patching:

| Event | Fires on | When |
|---|---|---|
| `basecoat:init` | Component root | After controller initialization |
| `basecoat:open` | Component root | When component opens (popover, dialog, etc.) |
| `basecoat:close` | Component root | When component closes |
| `basecoat:change` | Component root | When value/selection changes (select, combobox, tabs, switch, slider, etc.) |
| `basecoat:destroy` | Component root | Before controller is destroyed (e.g., on `initAll({ force: true })`) |

```js
document.querySelector("#my-select").addEventListener("basecoat:change", (e) => {
  console.log("new value:", e.detail.value);
});
```

## Framework integration

### HTMX

HTMX swaps HTML fragments on the page. After every swap, Basecoat's auto-initializer re-initializes new components. If your swap also restores previously cached DOM (e.g., history restoration), call `initAll({ force: true })` explicitly:

```js
document.body.addEventListener("htmx:historyRestore", () => {
  window.basecoat.initAll({ force: true });
});

// Or run on every swap (less efficient but simple)
document.body.addEventListener("htmx:afterSwap", () => {
  window.basecoat.initAll();
});
```

### Turbo

```js
document.addEventListener("turbo:render", () => {
  window.basecoat.initAll({ force: true });
});
```

### Alpine

Alpine is mostly DOM-mutation-driven; Basecoat's auto-initializer handles new components. For `x-html` or other innerHTML-based directives, manually call `initAll()` afterward:

```html
<div x-html="await fetch(url).then(r => r.text())" x-effect="$nextTick(() => window.basecoat.initAll())"></div>
```

### Vanilla JS / `innerHTML`

After any `element.innerHTML = ...` or `appendChild` of Basecoat markup, call:

```js
window.basecoat.initAll();
```

If you are replacing the contents of a container that previously had Basecoat components, use `{ force: true }` to destroy stale instances first:

```js
container.innerHTML = newHtml;
window.basecoat.initAll({ force: true });
```

### React / Vue / Svelte

These frameworks re-create DOM on every render. Use `useEffect` / `onUpdated` / `afterUpdate` to call `initAll()` after the framework has committed. Avoid force-reinit on every render — it can destroy controller state mid-interaction. Prefer force-reinit only on full route changes.

## Manual initialization

By default, Basecoat scans the DOM on `DOMContentLoaded` and initializes any component it finds. If you load Basecoat JS after the document is already parsed, you must call `initAll()` manually:

```js
// Loaded after DOMContentLoaded
window.basecoat.initAll();
```

This is also useful in test setups, after dynamic imports, or after manually constructed DOM.

## Force re-initialization

`initAll()` skips elements that are already initialized. This is normally what you want — you don't want a controller attached twice to the same element.

But there are cases where a controller is attached but its state is stale:

- The element was cached by a navigation library (HTMX history, Turbo cache, BFCache) and restored with old state.
- The framework re-attached a previously-mounted component (React StrictMode, Vue keep-alive).
- Hot-reload re-evaluated the JS module but the DOM was preserved.

In these cases, call `initAll({ force: true })`. The force flag destroys existing controller instances before reinitializing, which resets transient state (open menus, focus, in-progress interactions).

```js
window.basecoat.initAll({ force: true });
```

`{ force: true }` triggers a `basecoat:destroy` event on each component being torn down.

## Disabling a component

To prevent a specific component from auto-initializing, set `data-basecoat-skip` on its root element:

```html
<div class="dropdown-menu" data-basecoat-skip>
  <!-- This dropdown will not be initialized by Basecoat. -->
  <!-- You are responsible for wiring it up. -->
</div>
```

You can then attach the controller manually:

```js
import { DropdownMenu } from "basecoat-css/dropdown-menu";
const el = document.querySelector(".dropdown-menu");
new DropdownMenu(el).init();
```

(Exact import paths depend on your bundler; the `basecoat-css` ESM build exposes each component as a named export.)

## Custom events

All custom events are `CustomEvent` instances with a `detail` payload. Documented event names:

| Event | `detail` payload |
|---|---|
| `basecoat:init` | `{ controller }` |
| `basecoat:open` | `{ controller }` |
| `basecoat:close` | `{ controller }` |
| `basecoat:change` | `{ value, previousValue, controller }` |
| `basecoat:destroy` | `{ controller }` |

Listen on the component root or any ancestor:

```js
document.addEventListener("basecoat:change", (e) => {
  if (e.target.matches(".select")) {
    console.log("select changed:", e.detail.value);
  }
});
```
