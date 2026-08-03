# Tabs


Tabbed content with horizontal or vertical tabs, line or default variant, and full keyboard navigation.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/tabs`
- **Root class:** `.tabs`
- **Template macro:** `tabs()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/tabs";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/tabs.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `aria-orientation` | `role="tablist"` | `"horizontal"`, `"vertical"` | Tab orientation. |
| `data-variant` | `role="tablist"` | `"line"` | Line-style tablist. |

## HTML structure

```html
<div class="tabs">
  <nav role="tablist" aria-orientation="horizontal">
    <button type="button" role="tab" id="tabs-1" aria-controls="panel-1" aria-selected="true" tabindex="0">Tab 1</button>
    <button type="button" role="tab" id="tabs-2" aria-controls="panel-2" aria-selected="false" tabindex="-1">Tab 2</button>
  </nav>
  <div role="tabpanel" id="panel-1" aria-labelledby="tabs-1" tabindex="-1">Panel 1 content.</div>
  <div role="tabpanel" id="panel-2" aria-labelledby="tabs-2" tabindex="-1" hidden>Panel 2 content.</div>
</div>
```

- `<div class="tabs">` — root; orientation follows the tablist's `aria-orientation`
- `<nav role="tablist" aria-orientation="horizontal">` — tablist
- `<button role="tab" id="..." aria-controls="..." aria-selected="..." tabindex="...">` — tab trigger
  - Active: `aria-selected="true"` and `tabindex="0"`
  - Inactive: `aria-selected="false"` and `tabindex="-1"`
  - Disabled: `disabled` or `aria-disabled="true"`
- `<div role="tabpanel" id="..." aria-labelledby="...">` — panel; hidden when inactive

## JavaScript API

| API | Type | Description |
|---|---|---|
| `tabs.select(tab)` | Method | Selects a tab button in the tablist. |
| `tabs.refresh()` | Method | Rescans tabs and panels after children change. |

```js
const tabs = document.querySelector("#my-tabs").basecoat;
tabs.select(document.querySelector("#tabs-2"));
tabs.refresh();
```

## Examples

### Basic horizontal

```html
<div class="tabs" id="my-tabs">
  <nav role="tablist" aria-orientation="horizontal">
    <button type="button" role="tab" id="my-tabs-1" aria-controls="my-tabs-panel-1" aria-selected="true" tabindex="0">Account</button>
    <button type="button" role="tab" id="my-tabs-2" aria-controls="my-tabs-panel-2" aria-selected="false" tabindex="-1">Password</button>
  </nav>
  <div role="tabpanel" id="my-tabs-panel-1" aria-labelledby="my-tabs-1" tabindex="-1">Account settings content.</div>
  <div role="tabpanel" id="my-tabs-panel-2" aria-labelledby="my-tabs-2" tabindex="-1" hidden>Password settings content.</div>
</div>
```

### With rich panel content

```html
<div class="tabs" id="tabs-with-panels">
  <nav role="tablist" aria-orientation="horizontal" class="w-full">
    <button type="button" role="tab" id="account-tab" aria-controls="account-panel" aria-selected="true" tabindex="0">Account</button>
    <button type="button" role="tab" id="password-tab" aria-controls="password-panel" aria-selected="false" tabindex="-1">Password</button>
  </nav>
  <div role="tabpanel" id="account-panel" aria-labelledby="account-tab" tabindex="-1">
    <div class="card">
      <header>
        <h2>Account</h2>
        <p>Make changes to your account here.</p>
      </header>
      <section>
        <form class="grid gap-4">
          <div role="group" class="field">
            <label for="account-name">Name</label>
            <input type="text" id="account-name" value="Pedro Duarte" />
          </div>
        </form>
      </section>
      <footer>
        <button type="button" class="btn">Save changes</button>
      </footer>
    </div>
  </div>
  <div role="tabpanel" id="password-panel" aria-labelledby="password-tab" tabindex="-1" hidden>
    <div class="card">
      <header>
        <h2>Password</h2>
        <p>Change your password here.</p>
      </header>
      <section>
        <form class="grid gap-4">
          <div role="group" class="field">
            <label for="password-current">Current password</label>
            <input type="password" id="password-current" />
          </div>
        </form>
      </section>
      <footer>
        <button type="button" class="btn">Save password</button>
      </footer>
    </div>
  </div>
</div>
```

### Line variant

```html
<div class="tabs" id="tabs-line">
  <nav role="tablist" aria-orientation="horizontal" data-variant="line">
    <button type="button" role="tab" id="overview-tab" aria-controls="overview-panel" aria-selected="true" tabindex="0">Overview</button>
    <button type="button" role="tab" id="analytics-tab" aria-controls="analytics-panel" aria-selected="false" tabindex="-1">Analytics</button>
    <button type="button" role="tab" id="reports-tab" aria-controls="reports-panel" aria-selected="false" tabindex="-1">Reports</button>
  </nav>
  <div role="tabpanel" id="overview-panel" aria-labelledby="overview-tab" tabindex="-1">Overview content.</div>
  <div role="tabpanel" id="analytics-panel" aria-labelledby="analytics-tab" tabindex="-1" hidden>Analytics content.</div>
  <div role="tabpanel" id="reports-panel" aria-labelledby="reports-tab" tabindex="-1" hidden>Reports content.</div>
</div>
```

### Vertical orientation

```html
<div class="tabs" id="tabs-vertical">
  <nav role="tablist" aria-orientation="vertical">
    <button type="button" role="tab" id="v-account-tab" aria-controls="v-account-panel" aria-selected="true" tabindex="0">Account</button>
    <button type="button" role="tab" id="v-password-tab" aria-controls="v-password-panel" aria-selected="false" tabindex="-1">Password</button>
    <button type="button" role="tab" id="v-notifications-tab" aria-controls="v-notifications-panel" aria-selected="false" tabindex="-1">Notifications</button>
  </nav>
  <div role="tabpanel" id="v-account-panel" aria-labelledby="v-account-tab" tabindex="-1">Account content.</div>
  <div role="tabpanel" id="v-password-panel" aria-labelledby="v-password-tab" tabindex="-1" hidden>Password content.</div>
  <div role="tabpanel" id="v-notifications-panel" aria-labelledby="v-notifications-tab" tabindex="-1" hidden>Notifications content.</div>
</div>
```

### Disabled tab

```html
<div class="tabs" id="tabs-disabled">
  <nav role="tablist" aria-orientation="horizontal">
    <button type="button" role="tab" id="home-tab" aria-controls="home-panel" aria-selected="true" tabindex="0">Home</button>
    <button type="button" role="tab" id="settings-tab" aria-controls="settings-panel" aria-selected="false" tabindex="-1" disabled>Disabled</button>
  </nav>
  <div role="tabpanel" id="home-panel" aria-labelledby="home-tab" tabindex="-1">Home content.</div>
  <div role="tabpanel" id="settings-panel" aria-labelledby="settings-tab" tabindex="-1" hidden>Settings content.</div>
</div>
```

### With icons

```html
<div class="tabs" id="tabs-icons">
  <nav role="tablist" aria-orientation="horizontal">
    <button type="button" role="tab" id="preview-tab" aria-controls="preview-panel" aria-selected="true" tabindex="0">
      <svg class="lucide lucide-app-window" ...></svg>
      Preview
    </button>
    <button type="button" role="tab" id="code-tab" aria-controls="code-panel" aria-selected="false" tabindex="-1">
      <svg class="lucide lucide-code" ...></svg>
      Code
    </button>
  </nav>
  <div role="tabpanel" id="preview-panel" aria-labelledby="preview-tab" tabindex="-1">Preview content.</div>
  <div role="tabpanel" id="code-panel" aria-labelledby="code-tab" tabindex="-1" hidden>Code content.</div>
</div>
```

### RTL

```html
<div class="tabs w-full max-w-sm" id="tabs-rtl" dir="rtl">
  <nav role="tablist" aria-orientation="horizontal" dir="rtl">
    <button type="button" role="tab" id="tabs-rtl-tab-overview" aria-controls="tabs-rtl-panel-overview" aria-selected="true" tabindex="0">نظرة عامة</button>
    <button type="button" role="tab" id="tabs-rtl-tab-analytics" aria-controls="tabs-rtl-panel-analytics" aria-selected="false" tabindex="-1">التحليلات</button>
    <button type="button" role="tab" id="tabs-rtl-tab-reports" aria-controls="tabs-rtl-panel-reports" aria-selected="false" tabindex="-1">التقارير</button>
  </nav>
  <div role="tabpanel" id="tabs-rtl-panel-overview" aria-labelledby="tabs-rtl-tab-overview" tabindex="-1">محتوى النظرة العامة.</div>
  <div role="tabpanel" id="tabs-rtl-panel-analytics" aria-labelledby="tabs-rtl-tab-analytics" tabindex="-1" hidden>محتوى التحليلات.</div>
  <div role="tabpanel" id="tabs-rtl-panel-reports" aria-labelledby="tabs-rtl-tab-reports" tabindex="-1" hidden>محتوى التقارير.</div>
</div>
```

## Accessibility

- Use `<nav role="tablist">` (or `<div role="tablist">` if not navigation) for the tablist.
- Each tab is a `<button role="tab">` with:
  - `id` — unique id referenced by the panel's `aria-labelledby`
  - `aria-controls` — id of the controlled panel
  - `aria-selected` — `true` for the active tab, `false` for others
  - `tabindex` — `0` for the active tab, `-1` for others (roving tabindex)
- Each panel is a `<div role="tabpanel">` with:
  - `id` — unique id referenced by the tab's `aria-controls`
  - `aria-labelledby` — id of the controlling tab
  - `tabindex="0"` (optional) — makes the panel focusable for keyboard users
  - `hidden` — present on inactive panels
- For disabled tabs, use `disabled` (removes from tab order and prevents activation) or `aria-disabled="true"` (keeps in tab order, prevents activation).
- Keyboard support (provided by the script):
  - `Tab` — moves focus into and out of the tablist
  - `←` / `→` (horizontal) or `↑` / `↓` (vertical) — move between tabs
  - `Home` / `End` — first / last tab
  - `Enter` / `Space` — activate the focused tab

## Gotchas

- The script automatically manages `aria-selected`, `tabindex`, and `hidden` based on user interaction. You only need to set the initial state.
- The `data-variant="line"` on the tablist changes the visual style to an underline indicator.
- `aria-orientation` on the tablist controls both the visual layout and the keyboard navigation direction.
- For dynamic tab content (e.g., loading a panel via AJAX), use `tabs.refresh()` after adding the panel content.
- For URL-based tab selection (e.g., `?tab=account`), use `tabs.select()` on page load based on the URL.
- For tab panels with forms, the form's submit event will not fire when the panel is hidden. The form's data is preserved across tab switches but not submitted until the panel is active.
- Don't put interactive elements with their own keyboard navigation inside a tab trigger (e.g., a `<select>` inside a tab button).
- For vertical tabs, the tablist and panels are typically arranged side-by-side. Use a grid or flex layout to position them.
