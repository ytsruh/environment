# Command


A searchable command palette. Can be used standalone (inline) or inside a native `<dialog>` (the command palette pattern).

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/command`
- **Root class:** `.command` (inline) or `<dialog class="command-dialog">` (palette)
- **Template macros:** `command()` and `command_dialog()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/command";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/command.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-filter` | `.command` | `"manual"` | Disable built-in filtering. Your app provides filtering (e.g., remote search). |
| `data-empty` | `role="menu"` | string | Empty-state text when no items match. |

## HTML structure

Standalone:

```html
<div class="command" aria-label="Command menu">
  <header>
    <svg><!-- search icon --></svg>
    <input type="text" placeholder="Type a command or search..." role="combobox" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="true" aria-controls="command-menu" />
  </header>
  <div role="menu" id="command-menu" aria-orientation="vertical" data-empty="No results found.">
    <div role="group" aria-labelledby="suggestions">
      <span role="heading" id="suggestions">Suggestions</span>
      <div role="menuitem" data-filter="Calendar">Calendar</div>
    </div>
  </div>
</div>
```

In a dialog (palette):

```html
<button type="button" class="btn" data-variant="outline" onclick="document.getElementById('palette').showModal()">Open</button>
<dialog id="palette" class="command-dialog" aria-label="Command menu" onclick="if (event.target === this) this.close()">
  <div class="command">
    <!-- same as standalone -->
  </div>
</dialog>
```

- `<dialog class="command-dialog">` (optional) — wraps a direct child `<div class="command">`
- `<div class="command">` — root; can also be used standalone
- `<header>` — search input wrapper
- `<input type="text" role="combobox">` — filter input
- `<div role="menu">` — command list
- `<div role="group" aria-labelledby="...">` — group of related items
- `<span role="heading" id="...">` — group heading
- `<div role="menuitem">` or `<a role="menuitem">` — selectable command item
- `<span data-shortcut>` — optional shortcut hint
- `<span data-indicator>` — optional item indicator (visible with `data-checked` or `aria-selected`)
- `<hr role="separator">` — separator (hidden while filtering)

## Examples

### Standalone (inline)

```html
<div class="command border" aria-label="Command menu">
  <header>
    <svg class="lucide lucide-search" ...></svg>
    <input type="text" placeholder="Type a command or search..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="true" aria-controls="command-menu" />
  </header>
  <div role="menu" id="command-menu" aria-orientation="vertical" data-empty="No results found.">
    <div role="group" aria-labelledby="suggestions">
      <span role="heading" id="suggestions">Suggestions</span>
      <div role="menuitem" data-filter="Calendar">Calendar</div>
      <div role="menuitem" data-filter="Search Emoji">Search Emoji</div>
      <div role="menuitem" aria-disabled="true">Calculator</div>
    </div>
  </div>
</div>
```

### In a dialog (palette)

```html
<button type="button" class="btn" data-variant="outline" onclick="document.getElementById('command-basic').showModal()">Open Menu</button>
<dialog id="command-basic" class="command-dialog" aria-label="Command menu" onclick="if (event.target === this) this.close()">
  <div class="command">
    <header>
      <svg class="lucide lucide-search" ...></svg>
      <input type="text" id="command-basic-input" placeholder="Type a command or search..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="true" aria-controls="command-basic-menu" />
    </header>
    <div role="menu" id="command-basic-menu" aria-orientation="vertical" data-empty="No results found.">
      <div role="group" aria-labelledby="command-basic-suggestions">
        <span role="heading" id="command-basic-suggestions">Suggestions</span>
        <div role="menuitem" data-filter="Calendar">Calendar</div>
      </div>
    </div>
  </div>
</dialog>
```

### With shortcuts and icons

```html
<div role="menuitem" data-filter="Profile" data-keywords="user account">
  <svg class="lucide lucide-user" ...></svg>
  <span>Profile</span>
  <span data-shortcut>⌘P</span>
</div>
```

`data-filter` is the primary text matched against the search. `data-keywords` provides extra search terms (space-separated).

### With groups and separators

```html
<div role="menu" id="cmd-menu" data-empty="No results found.">
  <div role="group" aria-labelledby="suggestions-heading">
    <span role="heading" id="suggestions-heading">Suggestions</span>
    <div role="menuitem" data-filter="Calendar">Calendar</div>
    <div role="menuitem" data-filter="Search Emoji">Search Emoji</div>
  </div>
  <hr role="separator" />
  <div role="group" aria-labelledby="settings-heading">
    <span role="heading" id="settings-heading">Settings</span>
    <div role="menuitem" data-filter="Profile"><svg ...></svg> <span>Profile</span> <span data-shortcut>⌘P</span></div>
  </div>
</div>
```

### Item data attributes

| Attribute | Description |
|---|---|
| `data-filter` | Primary text matched against the search. |
| `data-keywords` | Additional space-separated search terms. |
| `data-force` | Always show this item, even if it doesn't match the current search. |
| `data-keep-command-open` | Don't close the command menu after this item is activated. |
| `aria-disabled="true"` | Disabled item. |
| `data-disabled="true"` | Disabled item (alternative). |

### With selection indicators

```html
<div role="menuitem" data-checked="true" aria-selected="true">
  <span data-indicator><svg class="lucide lucide-check" ...></svg></span>
  Status Bar
</div>
```

### RTL

```html
<div dir="rtl">
  <div id="command-rtl" class="command border" aria-label="Command menu">
    <header>
      <svg class="lucide lucide-search" ...></svg>
      <input type="text" placeholder="اكتب أمرًا أو ابحث..." autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" role="combobox" aria-expanded="true" aria-controls="command-rtl-menu" />
    </header>
    <div role="menu" id="command-rtl-menu" data-empty="لم يتم العثور على نتائج.">
      <div role="group" aria-labelledby="suggestions-rtl">
        <span role="heading" id="suggestions-rtl">اقتراحات</span>
        <div role="menuitem" data-filter="Calendar">التقويم</div>
      </div>
    </div>
  </div>
</div>
```

## JavaScript API

| API | Type | Description |
|---|---|---|
| `command.refresh()` | Method | Rescans command items after children change inside the existing `role="menu"` element. |

```js
const command = document.querySelector("#cmd-menu").basecoat;
command.refresh();
```

## Accessibility

- Use `aria-label` on the `.command` root or `<dialog>` to identify the command region.
- The input is `role="combobox"` with `aria-autocomplete="list"`. Connect it to the list via `aria-controls`.
- Use `<a role="menuitem">` for navigation and `<div role="menuitem">` for actions. Both should activate on `Enter` (handled by the script).
- Use `aria-disabled="true"` or `data-disabled="true"` for items the user cannot activate. The script will skip them in keyboard navigation.
- For groups, use `role="group"` with `aria-labelledby` pointing to the group heading.
- Separators (`<hr role="separator">`) are hidden during filtering.
- The empty state (set via `data-empty` on the list) is announced when no items match.

## Gotchas

- The command menu uses `role="menu"` for the list and `role="menuitem"` for items. This is the menu pattern, not the listbox pattern.
- Use `data-filter` to control what text is matched against the search. This is separate from the displayed text.
- Use `data-keywords` to add extra search terms without changing the displayed text.
- The dialog variant (`<dialog class="command-dialog">`) must contain exactly one direct child `<div class="command">`. The script wraps the dialog automatically.
- The default empty-state text is "No results found." Override with `data-empty="..."` on the `role="menu"`.
- For palette mode (`<dialog>`), the dialog handles focus trapping, `Esc` to close, and backdrop click to close.
- For server-rendered search results, set `data-filter="manual"` on the `.command` and call `command.refresh()` after updating the list.
