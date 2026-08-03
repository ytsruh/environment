# Dropdown Menu


An inline-positioned menu that opens on click. Use for action menus, contextual menus, and any list of actions triggered by a button.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/dropdown-menu`
- **Root class:** `.dropdown-menu`
- **Template macro:** `dropdown_menu()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/dropdown-menu";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/dropdown-menu.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-side` | `data-popover` | `"top"`, `"right"`, `"bottom"`, `"left"`, `"inline-start"`, `"inline-end"` | Side the menu appears on. RTL-aware. |
| `data-align` | `data-popover` | `"start"`, `"center"`, `"end"` | Alignment along the chosen side. |
| `data-variant` | `<div role="menuitem">` | `"destructive"` | Style the item as destructive. |

## HTML structure

```html
<div class="dropdown-menu">
  <button type="button" id="trigger" aria-haspopup="menu" aria-controls="menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="w-40">
    <div role="menu" id="menu" aria-labelledby="trigger">
      <div role="group" aria-labelledby="group-label">
        <div role="heading" id="group-label">My Account</div>
        <div role="menuitem">Profile</div>
        <div role="menuitem">Billing</div>
        <div role="menuitem">Settings</div>
      </div>
    </div>
  </div>
</div>
```

- `<div class="dropdown-menu">` — relative wrapper for the trigger and menu
- `<button type="button" aria-haspopup="menu" aria-controls="..." aria-expanded="false">` — trigger
- `<div data-popover aria-hidden="true">` — menu content
- `<div role="menu">` — menu container
- `<div role="group" aria-labelledby="...">` — group of related items
- `<div role="heading" id="...">` — group label
- `<div role="menuitem">` — standard action item
- `<div role="menuitemcheckbox" aria-checked="true|false">` — checkbox-style item
- `<div role="menuitemradio" aria-checked="true|false">` — radio-style item
- `<kbd>` — optional shortcut hint
- `<hr role="separator">` — separator between groups

## Examples

### Basic

```html
<div class="dropdown-menu">
  <button type="button" id="basic-trigger" aria-haspopup="menu" aria-controls="basic-menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="min-w-32">
    <div role="menu" id="basic-menu" aria-labelledby="basic-trigger">
      <div role="menuitem">Profile</div>
      <div role="menuitem">Billing</div>
      <div role="menuitem">Settings</div>
    </div>
  </div>
</div>
```

### With shortcuts

```html
<div class="dropdown-menu">
  <button type="button" id="shortcuts-trigger" aria-haspopup="menu" aria-controls="shortcuts-menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="min-w-46">
    <div role="menu" id="shortcuts-menu" aria-labelledby="shortcuts-trigger">
      <div role="menuitem">
        <span>Profile</span>
        <kbd>⇧⌘P</kbd>
      </div>
      <div role="menuitem">
        <span>Billing</span>
        <kbd>⌘B</kbd>
      </div>
      <div role="menuitem">
        <span>Settings</span>
        <kbd>⌘S</kbd>
      </div>
    </div>
  </div>
</div>
```

### With icons

```html
<div class="dropdown-menu">
  <button type="button" id="icons-trigger" aria-haspopup="menu" aria-controls="icons-menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="min-w-32">
    <div role="menu" id="icons-menu" aria-labelledby="icons-trigger">
      <div role="menuitem"><svg class="lucide lucide-user" ...></svg>Profile</div>
      <div role="menuitem"><svg class="lucide lucide-credit-card" ...></svg>Billing</div>
      <div role="menuitem"><svg class="lucide lucide-settings" ...></svg>Settings</div>
    </div>
  </div>
</div>
```

### With groups

```html
<div class="dropdown-menu">
  <button type="button" id="groups-trigger" aria-haspopup="menu" aria-controls="groups-menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="w-40">
    <div role="menu" id="groups-menu" aria-labelledby="groups-trigger">
      <div role="group" aria-labelledby="groups-account">
        <div role="heading" id="groups-account">My Account</div>
        <div role="menuitem">Profile</div>
        <div role="menuitem">Billing</div>
      </div>
      <hr role="separator" />
      <div role="group">
        <div role="menuitem">GitHub</div>
        <div role="menuitem">Support</div>
        <div role="menuitem" aria-disabled="true">API</div>
      </div>
    </div>
  </div>
</div>
```

### Checkboxes

```html
<div class="dropdown-menu">
  <button type="button" id="checkboxes-trigger" aria-haspopup="menu" aria-controls="checkboxes-menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="w-40">
    <div role="menu" id="checkboxes-menu" aria-labelledby="checkboxes-trigger">
      <div role="group" aria-labelledby="checkboxes-label">
        <div role="heading" id="checkboxes-label">Appearance</div>
        <div role="menuitemcheckbox" aria-checked="true">
          <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
          Status Bar
        </div>
        <div role="menuitemcheckbox" aria-checked="false" aria-disabled="true">
          <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
          Activity Bar
        </div>
        <div role="menuitemcheckbox" aria-checked="false">
          <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
          Panel
        </div>
      </div>
    </div>
  </div>
</div>
```

Add a child with `data-indicator` to render a check icon when `aria-checked="true"`.

### Radio group

```html
<div class="dropdown-menu">
  <button type="button" id="radio-trigger" aria-haspopup="menu" aria-controls="radio-menu" aria-expanded="false" class="btn" data-variant="outline">Open</button>
  <div data-popover aria-hidden="true" class="min-w-32">
    <div role="menu" id="radio-menu" aria-labelledby="radio-trigger">
      <div role="group" aria-labelledby="radio-label">
        <div role="heading" id="radio-label">Panel Position</div>
        <div role="menuitemradio" aria-checked="false">
          <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
          Top
        </div>
        <div role="menuitemradio" aria-checked="true">
          <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
          Bottom
        </div>
        <div role="menuitemradio" aria-checked="false">
          <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
          Right
        </div>
      </div>
    </div>
  </div>
</div>
```

### Destructive

```html
<div class="dropdown-menu">
  <button type="button" id="destructive-trigger" aria-haspopup="menu" aria-controls="destructive-menu" aria-expanded="false" class="btn" data-variant="outline">Actions</button>
  <div data-popover aria-hidden="true" data-align="end" class="min-w-32">
    <div role="menu" id="destructive-menu" aria-labelledby="destructive-trigger">
      <div role="menuitem"><svg ...></svg>Edit</div>
      <div role="menuitem"><svg ...></svg>Share</div>
      <hr role="separator" />
      <div role="menuitem" data-variant="destructive"><svg ...></svg>Delete</div>
    </div>
  </div>
</div>
```

For destructive items, use `data-variant="destructive"` on the menuitem. The item will use destructive colors. You can also use the manual class approach:

```html
<div role="menuitem" class="text-destructive hover:bg-destructive/10 dark:hover:bg-destructive/20 focus:bg-destructive/10 dark:focus:bg-destructive/20 focus:text-destructive [&_svg]:!text-destructive">
  <svg ...></svg>
  Delete
</div>
```

### Disabled item

```html
<div role="menuitem" aria-disabled="true">API</div>
```

### Avatar trigger

```html
<div class="dropdown-menu">
  <button type="button" id="avatar-trigger" aria-label="Open user menu" aria-haspopup="menu" aria-controls="avatar-menu" aria-expanded="false" class="btn rounded-full" data-variant="ghost" data-size="icon">
    <span class="avatar">
      <img src="https://github.com/shadcn.png" alt="@shadcn" />
      <span>CN</span>
    </span>
  </button>
  <div data-popover aria-hidden="true" class="w-32">
    <div role="menu" id="avatar-menu" aria-labelledby="avatar-trigger">
      <div role="menuitem">Profile</div>
      <div role="menuitem">Billing</div>
      <div role="menuitem">Settings</div>
      <hr role="separator" />
      <div role="menuitem" data-variant="destructive">Log out</div>
    </div>
  </div>
</div>
```

### RTL

```html
<div dir="rtl">
  <div class="dropdown-menu">
    <button type="button" id="rtl-trigger" aria-haspopup="menu" aria-controls="rtl-menu" aria-expanded="false" class="btn" data-variant="outline">افتح القائمة</button>
    <div data-popover aria-hidden="true" class="w-36" data-align="end">
      <div role="menu" id="rtl-menu" aria-labelledby="rtl-trigger">
        <div role="group" aria-labelledby="rtl-team">
          <div role="heading" id="rtl-team">الفريق</div>
          <div role="menuitem">الفريق</div>
          <div role="menuitem">فريق جديد</div>
        </div>
        <hr role="separator" />
        <div role="group">
          <div role="menuitem">شريط الحالة</div>
        </div>
        <hr role="separator" />
        <div role="group">
          <div role="menuitem" data-variant="destructive">تسجيل الخروج</div>
        </div>
      </div>
    </div>
  </div>
</div>
```

## JavaScript API

| API | Type | Description |
|---|---|---|
| `dropdown.open()` | Method | Opens the menu. |
| `dropdown.close()` | Method | Closes the menu. |
| `dropdown.toggle()` | Method | Toggles the menu. |
| `dropdown.refresh()` | Method | Rescans menu items after children change inside the existing `role="menu"` element. |

```js
const dropdown = document.querySelector("#basic-menu").closest(".dropdown-menu").basecoat;
dropdown.open();
dropdown.close();
```

## Accessibility

- The trigger has `aria-haspopup="menu"`, `aria-expanded`, and `aria-controls` (pointing to the menu's id).
- The menu has `role="menu"` and `aria-labelledby` (pointing to the trigger's id or a heading).
- For grouped items, use `role="group"` with `aria-labelledby` pointing to a group heading (`<div role="heading">`).
- For checkboxes, use `role="menuitemcheckbox"` with `aria-checked="true"` or `"false"`.
- For radio items, use `role="menuitemradio"` with `aria-checked="true"` or `"false"`.
- For disabled items, use `aria-disabled="true"`.
- Decorative icons should be `aria-hidden="true"`. The text content of the menuitem is the accessible name.
- `Esc` closes the menu. Clicking outside also closes. Focus returns to the trigger.
- Arrow keys (`↑` / `↓`) move between items. `Home` / `End` jump to the first / last item.
- `Enter` / `Space` activates the focused item.

## Gotchas

- The dropdown menu is **inline-positioned** — it does not portal to the body. The menu content is a sibling of the trigger, positioned relative to the `.dropdown-menu` wrapper. This means very wide menus or those that need to extend beyond their parent may be clipped.
- For a button with `data-icon` (e.g., chevron down), use `data-icon="inline-end"` for proper icon-aware spacing.
- For destructive menu items, prefer `data-variant="destructive"` (cleaner) over manual class overrides.
- For dynamic menu items, call `dropdown.refresh()` after changing the `role="menu"` children.
- The `data-popover` is hidden with `aria-hidden="true"`. The script toggles this on open/close.
- For very tall menus, use `class="scrollbar-sm max-h-72 overflow-y-auto"` on the `role="menu"` element to enable internal scrolling.
- For multiple menus on a page, each `.dropdown-menu` must have a unique `id` pattern (`{prefix}-trigger` and `{prefix}-menu`).
- The script requires the basecoat runtime to load **before** the dropdown-menu script. Loading them in the wrong order results in the menu not initializing.
- For a menu that should not close when an item is clicked (e.g., a settings menu), listen for the item's `click` event and call `event.stopPropagation()`.
