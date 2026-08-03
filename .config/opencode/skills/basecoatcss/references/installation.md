---
description: Complete installation guide for Basecoat CSS — CDN, npm, all CSS/JS imports, stylesheet order, JavaScript lifecycle, and v1.0 compatibility.
globs: "*.{html,css,js,njk,jinja}"
---

# Installation


How to install Basecoat v1.x, which files to import, the correct load order, and how the JavaScript lifecycle works.

## Contents

- [Choosing CDN vs npm](#choosing-cdn-vs-npm)
- [CDN setup](#cdn-setup)
- [NPM setup](#npm-setup)
- [Stylesheet order](#stylesheet-order)
- [JavaScript imports](#javascript-imports)
- [Templates (Nunjucks / Jinja)](#templates-nunjucks--jinja)
- [JavaScript components](#javascript-components)
- [JavaScript lifecycle](#javascript-lifecycle)
- [Compatibility (pre-1.0)](#compatibility-pre-10)
- [CDN file reference](#cdn-file-reference)
- [CSS import reference](#css-import-reference)
- [JavaScript import reference](#javascript-import-reference)

## Choosing CDN vs npm

| Use CDN when | Use npm when |
|---|---|
| Static pages, prototypes, demos | You have a Tailwind build step |
| No bundler, no build pipeline | You want tree-shaking per component |
| Quickest setup | You want to extend or override component CSS |
| You use the same style pack as the CDN default (Vega) | You use one of the named style packs (Nova, Maia, Lyra, etc.) |

CDN loads a single pre-built stylesheet plus a pre-built JS bundle. npm lets you import only the components you need.

## CDN setup

### Add the stylesheet

Default bundle (alias for the Vega style):

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/basecoat.cdn.min.css" />
```

Or pick a named style bundle:

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/basecoat-maia.cdn.min.css" />
```

Available styles: `vega` (default), `nova`, `maia`, `lyra`, `mira`, `luma`, `sera`, `rhea`.

### Add JavaScript when needed

Only the 11 interactive components need JS. Use the all-in-one bundle if file size is not a concern:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or load the runtime once and only the component scripts you use:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/dropdown-menu.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/select.min.js" defer></script>
```

The `basecoat.min.js` runtime must load **before** any individual component script.

### Use the markup

```html
<button class="btn">Button</button>
<div class="card">
  <header>
    <h3>Card title</h3>
    <p>Card description.</p>
  </header>
  <section>Card content.</section>
</div>
```

## NPM setup

### Install Tailwind CSS first

Basecoat is authored for Tailwind CSS. If you don't have a Tailwind build yet, follow the [Tailwind CSS installation guide](https://tailwindcss.com/docs/installation).

### Install Basecoat

```bash
npm install basecoat-css
# or
pnpm add basecoat-css
# or
bun add basecoat-css
# or
yarn add basecoat-css
```

If you are not using a bundler, copy or serve the files you need from `node_modules/basecoat-css/dist`.

### Add CSS

Load one Basecoat stylesheet **after** your Tailwind CSS. The default stylesheet is an alias for the Vega style bundle:

```css
/* app.css */
@import "tailwindcss";
@import "basecoat-css";
```

Or pick a named style bundle:

```css
@import "tailwindcss";
@import "basecoat-css/maia";
```

### Add JavaScript

For maximum simplicity, import the all-in-one script:

```js
import "basecoat-css/all";
```

Or import the runtime once and only the components you use:

```js
import "basecoat-css/basecoat";
import "basecoat-css/dropdown-menu";
import "basecoat-css/select";
```

The `basecoat-css/basecoat` runtime must load **before** any individual component script.

## Stylesheet order

The order in which you load stylesheets matters. Loading another full Tailwind build after Basecoat can reset borders, inputs, and other component defaults.

Correct order:

1. Tailwind CSS (or any reset/base layer)
2. One Basecoat style bundle (`basecoat-css`, `basecoat-css/sera`, etc.)
3. Optional theme overrides (TweakCN variables, custom CSS)
4. Optional pre-1.0 compatibility layer (last, if migrating)

```css
/* Correct order */
@import "tailwindcss";
@import "basecoat-css/sera";
@import "./theme.css";          /* TweakCN variables, custom tokens */
@import "basecoat-css/compat";  /* only if migrating pre-1.0 code */
```

Wrong order (will break components):

```css
/* Wrong */
@import "basecoat-css/sera";
@import "tailwindcss";          /* this overrides Basecoat */
```

## JavaScript imports

These components need JavaScript for behavior:

- Accordion
- Combobox
- Command
- Drawer
- Dropdown Menu
- Popover
- Select
- Sidebar
- Slider
- Tabs
- Toast

Chart uses a separate helper and is not in `basecoat-css/all`.

Every interactive component file shows the minimal scripts or imports required.

## Templates (Nunjucks / Jinja)

Basecoat ships optional Nunjucks and Jinja templates with `basecoat-css`.

```bash
# Nunjucks
cp -R node_modules/basecoat-css/templates/nunjucks ./templates/basecoat

# Jinja
cp -R node_modules/basecoat-css/templates/jinja ./templates/basecoat
```

Templates are versioned with `basecoat-css`. The generated markup matches the CSS and JS files you installed. They are app-owned once copied — edit freely.

If you previously used `basecoat-cli`, install `basecoat-css` instead and copy the template files from the package.

See `references/templates.md` for the full macro reference.

## JavaScript components

| Component | JS import | Bundle | Notes |
|---|---|---|---|
| Accordion | `basecoat-css/tabs` (with `data-tabs` configuration) or no JS | — | Often works with native `<details>`/`<summary>` |
| Combobox | `basecoat-css/combobox` | Yes | Filterable single/multi select with chips |
| Command | `basecoat-css/command` | Yes | Searchable command palette, also a dialog variant |
| Dialog | none required | — | Uses native `HTMLDialogElement.showModal()` |
| Drawer | `basecoat-css/drawer` | Yes | Side-pinned slide-over (Beta) |
| Dropdown Menu | `basecoat-css/dropdown-menu` | Yes | Inline-positioned popover menu |
| Popover | `basecoat-css/popover` | Yes | Generic inline-positioned popover |
| Select | `basecoat-css/select` | Yes | Custom select with single/multi + chips |
| Sidebar | `basecoat-css/sidebar` | Yes | App-level navigation |
| Slider | `basecoat-css/range` | Yes | Range input controller |
| Tabs | `basecoat-css/tabs` | Yes | Roving tabindex, keyboard nav |
| Toast | `basecoat-css/toast` | Yes | Stacked toasts, action/cancel buttons |
| Chart | `basecoat-css/chart` | No (load Chart.js separately) | Helper for Chart.js |

## JavaScript lifecycle

Basecoat initializes registered components:

1. On `DOMContentLoaded` (page load).
2. When new DOM is inserted by the framework (e.g., HTMX swap, Turbo visit, custom `appendChild`).

### Manual re-initialization

After manually inserting HTML that contains Basecoat components, call:

```js
window.basecoat.initAll();
```

`initAll()` only initializes components that are not already initialized, so it is safe to call multiple times.

### Force re-initialization

When a framework or navigation library restores previously initialized DOM from a cache (e.g., HTMX history restore, Turbo cache restore, BFCache restore, framework hot reload), the cached DOM still has the old component instances attached. Call:

```js
window.basecoat.initAll({ force: true });
```

`{ force: true }` destroys existing component instances before reinitializing them, which resets transient state such as:

- Open menus / popovers / dialogs
- Focus state
- Active interactions (mid-drag sliders, in-progress combobox search)
- Cached controller references

### Programmatic API

Every interactive component exposes a controller. See the per-component file for the methods (`open`, `close`, `toggle`, `refresh`, etc.).

```js
// Dropdown menu example
const dropdown = document.querySelector("#my-dropdown-menu");
dropdown.basecoat.open();
dropdown.basecoat.close();

// Toast example
const toaster = document.querySelector("#my-toaster");
toaster.basecoat.show({
  category: "success",
  title: "Saved",
  description: "Your changes were saved.",
});
```

## Compatibility (pre-1.0)

Basecoat 1.0 introduced new style packs and a smaller public API based on root classes plus semantic HTML and documented attributes.

If you have pre-1.0 code that uses legacy class aliases (e.g., `btn-outline` instead of `data-variant="outline"`, `btn-sm` instead of `data-size="sm"`), load the compatibility stylesheet **after** your Basecoat stylesheet:

```css
@import "tailwindcss";
@import "basecoat-css";
@import "basecoat-css/compat";
```

The compatibility stylesheet is intended for the default Basecoat style (Vega). It is not a separate style pack.

New code should use the documented 1.0 API (`data-variant`, `data-size`).

## CDN file reference

| File | Description |
|---|---|
| `dist/basecoat.cdn.min.css` | Default standalone CDN stylesheet. Alias for Vega. |
| `dist/basecoat-{style}.cdn.min.css` | Standalone CDN stylesheet for a named style (`vega`, `nova`, `maia`, `lyra`, `mira`, `luma`, `sera`, `rhea`). |
| `dist/basecoat-base.cdn.min.css` | Base tokens, utilities, and component structure without a style pack. |
| `dist/basecoat-compat.cdn.min.css` | Optional pre-1.0 compatibility aliases. Load after Basecoat. |
| `dist/js/all.min.js` | All auto-initialized JS components except Chart. |
| `dist/js/basecoat.min.js` | Runtime only. Load once before individual component scripts. |
| `dist/js/{component}.min.js` | Individual JS component file. |

## CSS import reference

| Import | Description |
|---|---|
| `basecoat-css` | Default full stylesheet. Alias for `basecoat-css/vega`. |
| `basecoat-css/{style}` | Full stylesheet for a named style. |
| `basecoat-css/base` | Base tokens, utilities, and component structure without a style pack. |
| `basecoat-css/components` | All component structure without a style pack. |
| `basecoat-css/components/button` | Individual component CSS (replace `button` with any component file). |
| `basecoat-css/styles/maia` | Individual style-pack CSS. Use with `basecoat-css/base` or `basecoat-css/components`. |
| `basecoat-css/all.css` | Full default stylesheet plus all style-pack CSS. Use only when you need every style pack available at runtime. |
| `basecoat-css/compat` | Optional pre-1.0 compatibility aliases. Load after Basecoat. |

## JavaScript import reference

| Import | Description |
|---|---|
| `basecoat-css/all` | All auto-initialized JS components except Chart. |
| `basecoat-css/basecoat` | Runtime only. Import once before individual component scripts. |
| `basecoat-css/chart` | Chart helper. Load Chart.js separately. |
| `basecoat-css/combobox` | Combobox controller. |
| `basecoat-css/command` | Command controller. |
| `basecoat-css/drawer` | Drawer controller. |
| `basecoat-css/dropdown-menu` | Dropdown Menu controller. |
| `basecoat-css/popover` | Popover controller. |
| `basecoat-css/range` | Slider / range controller. |
| `basecoat-css/select` | Select controller. |
| `basecoat-css/sidebar` | Sidebar controller. |
| `basecoat-css/tabs` | Tabs controller. |
| `basecoat-css/toast` | Toast controller. |
