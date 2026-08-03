# Sidebar


An app-level navigation sidebar. Uses a native `<aside>` next to your page content. Supports fixed left/right sidebars, mobile overlay, grouped navigation, active states, and native `<details>` submenus.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/sidebar`
- **Root class:** `.sidebar`
- **Native element:** `<aside>`
- **Template macro:** `sidebar()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/sidebar";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/sidebar.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-side` | `.sidebar` | `"left"`, `"right"` | Side of the viewport. Default: `"left"`. |
| `data-initial-open` | `.sidebar` | `"false"` | Initial open state. |
| `data-initial-mobile-open` | `.sidebar` | `"true"` | Initial mobile open state. |
| `data-breakpoint` | `.sidebar` | CSS length | Custom breakpoint for mobile vs desktop behavior. |
| `data-variant` | `<a>` / `<button>` inside sidebar | `"default"`, `"outline"` | Menu item visual variant. |
| `data-size` | `<a>` / `<button>` inside sidebar | `"default"`, `"sm"`, `"lg"` | Menu item size. |
| `data-active` | `<a>` / `<button>` inside sidebar | `"true"` | Active menu item. |
| `data-keep-mobile-sidebar-open` | any | (presence) | Don't close the mobile sidebar when this control is clicked. |

## HTML structure

```html
<aside class="sidebar" data-side="left">
  <nav aria-label="Sidebar navigation">
    <section class="scrollbar-sm">
      <div role="group" aria-labelledby="group-label">
        <h3 id="group-label">Getting started</h3>
        <ul>
          <li>
            <a href="#">
              <svg class="lucide lucide-square-terminal" ...></svg>
              <span>Playground</span>
            </a>
          </li>
          <li>
            <details>
              <summary aria-controls="submenu-content">
                <svg class="lucide lucide-settings" ...></svg>
                <span>Settings</span>
              </summary>
              <ul>
                <li><a href="#"><span>General</span></a></li>
                <li><a href="#"><span>Team</span></a></li>
              </ul>
            </details>
          </li>
        </ul>
      </div>
    </section>
  </nav>
</aside>
<main>
  <button onclick="document.getElementById('sidebar')?.toggle()">Toggle sidebar</button>
  <h1>Content</h1>
</main>
```

- `<aside class="sidebar">` — root sidebar
- `<nav aria-label="...">` — navigation landmark
- `<header>` — optional header
- `<section>` — scrollable content region
- `<div role="group" aria-labelledby="...">` — named navigation group
- `<ul>` + `<li>` — menu and menu item structure
- `<a>` / `<button>` — menu item control
- `<details>` / `<summary>` — native disclosure for collapsible submenus
- `<hr role="separator">` — separator
- `<footer>` — optional footer
- `<main>` — sibling content wrapper

## Differences with shadcn/ui

Basecoat intentionally supports the stable HTML sidebar surface:

- Fixed left/right sidebars
- Mobile overlay behavior
- Grouped navigation
- Active states
- Native `<details>` submenus

Basecoat does **not** expose shadcn/ui's:

- React provider
- Rail / icon-only collapse mode
- Inset / floating variants
- Menu actions / menu badges / menu skeleton API

## Examples

### Basic

```html
<aside id="sidebar" class="sidebar" data-side="left">
  <nav aria-label="Sidebar navigation">
    <section class="scrollbar-sm">
      <div role="group" aria-labelledby="group-label">
        <h3 id="group-label">Getting started</h3>
        <ul>
          <li>
            <a href="#">
              <svg class="lucide lucide-square-terminal" ...></svg>
              <span>Playground</span>
            </a>
          </li>
          <li>
            <a href="#">
              <svg class="lucide lucide-bot" ...></svg>
              <span>Models</span>
            </a>
          </li>
          <li>
            <details id="submenu">
              <summary aria-controls="submenu-content">
                <svg class="lucide lucide-settings" ...></svg>
                <span>Settings</span>
              </summary>
              <ul id="submenu-content">
                <li><a href="#"><span>General</span></a></li>
                <li><a href="#"><span>Team</span></a></li>
                <li><a href="#"><span>Billing</span></a></li>
                <li><a href="#"><span>Limits</span></a></li>
              </ul>
            </details>
          </li>
        </ul>
      </div>
    </section>
  </nav>
</aside>
<main>
  <button type="button" onclick="document.getElementById('sidebar')?.toggle()">Toggle sidebar</button>
  <h1>Content</h1>
</main>
```

### Active item

```html
<li>
  <a href="#" data-active="true" aria-current="page">
    <svg class="lucide lucide-home" ...></svg>
    <span>Home</span>
  </a>
</li>
```

For a link, prefer `aria-current="page"` (or `aria-current="true"` for non-page items). For buttons, use `data-active="true"` and `aria-pressed="true"`.

### Header and footer

```html
<aside class="sidebar" data-side="left">
  <header>
    <span class="avatar"><img src="..." alt="User" /></span>
    <h3>Acme Corp</h3>
  </header>
  <nav aria-label="Sidebar">
    <section class="scrollbar-sm">
      <!-- menu items -->
    </section>
  </nav>
  <footer>
    <button type="button" class="btn" data-variant="outline" data-size="sm">Settings</button>
  </footer>
</aside>
```

### Custom width

```css
:root {
  --sidebar-width: 14rem;
  --sidebar-mobile-width: 16rem;
}
```

Set on `:root` or the sidebar root to override the default `16rem` desktop width and `18rem` mobile width.

### With toggle button

```html
<button type="button" onclick="document.getElementById('sidebar')?.open()">Open</button>
<button type="button" onclick="document.getElementById('sidebar')?.close()">Close</button>
<button type="button" onclick="document.getElementById('sidebar')?.toggle()">Toggle</button>
```

### RTL

```html
<aside class="sidebar" data-side="right" dir="rtl">
  <nav aria-label="التنقل الجانبي">
    <!-- ... -->
  </nav>
</aside>
```

Logical spacing, nested borders, and item content follow document direction. `data-side` is physical: `left` and `right` refer to viewport sides.

## JavaScript API

| API | Type | Description |
|---|---|---|
| `sidebar.open()` | Method | Opens the sidebar. |
| `sidebar.close()` | Method | Closes the sidebar. |
| `sidebar.toggle()` | Method | Toggles the sidebar. |

```js
const sidebar = document.getElementById("sidebar").basecoat;
sidebar.open();
sidebar.close();
```

## Accessibility

- Use `<aside>` for the sidebar root and `<nav>` with `aria-label` for the navigation landmark.
- For grouped navigation, use `<div role="group" aria-labelledby="...">` with the group label as a heading.
- For the current page, use `<a aria-current="page">` (or `data-active="true"` if not a link).
- For submenus, use native `<details>`/`<summary>` for built-in disclosure support. The summary should have `aria-controls` when the relationship to the panel is not obvious.
- For icon-only menu items, add `aria-label` to the link/button.
- Mobile overlay is announced to screen readers when the sidebar opens. The script manages `aria-hidden` and `inert` on the sidebar.

## Gotchas

- The sidebar uses `position: fixed` and applies a margin to the sibling content (typically `<main>`). Make sure your main content comes immediately after the sidebar in the DOM.
- The mobile overlay closes when clicking outside or pressing `Esc`.
- The default width is `16rem` (desktop) and `18rem` (mobile). Override with `--sidebar-width` and `--sidebar-mobile-width`.
- The script manages `aria-hidden` and `inert` on the sidebar based on state. Don't manually toggle these.
- `data-keep-mobile-sidebar-open` is for controls that should not close the mobile sidebar (e.g., a submenu trigger).
- The sidebar is a static, fixed sidebar — not a slide-in panel. For slide-in panels, use [Drawer](./drawer.md) instead.
- For a non-fixed sidebar that scrolls with the page, omit the `data-side` attribute and use a regular flex/grid layout.
