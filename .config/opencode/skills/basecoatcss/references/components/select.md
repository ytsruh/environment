# Select


A custom select control. Use when you need richer option content, multi-select with chips, async loading, or a JavaScript API. For native browser behavior, use [Native Select](./native-select.md) instead.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/select`
- **Root class:** `.select`
- **Template macro:** `select()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/select";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/select.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-placeholder` | `.select` | string | Placeholder text when no value is selected. |
| `data-close-on-select` | `.select` | `"true"` | Close the popover after each option selection (multiple mode). |
| `data-format` | `.select` | `"value"`, `"object"` | Hidden input serialization. `"object"` stores `{ value, label }`. |
| `data-side` | `data-popover` | `"top"`, `"right"`, `"bottom"`, `"left"`, `"inline-start"`, `"inline-end"` | Side the popover appears on. |
| `data-align` | `data-popover` | `"start"`, `"center"`, `"end"` | Alignment along the chosen side. |
| `data-empty` | `role="listbox"` | string | Empty-state text when no options match. |

## HTML structure

```html
<div class="select" data-placeholder="Select a fruit">
  <button type="button" aria-haspopup="listbox" aria-expanded="false" aria-controls="select-listbox">
    <span class="truncate">Select a fruit</span>
    <svg><!-- chevron --></svg>
  </button>
  <div data-popover aria-hidden="true">
    <div role="listbox" id="select-listbox" aria-orientation="vertical" aria-labelledby="select-trigger">
      <div role="option" data-value="apple">Apple</div>
      <div role="option" data-value="banana">Banana</div>
    </div>
  </div>
  <input type="hidden" name="select-value" value="" />
</div>
```

- `<div class="select">` — root
- `<button type="button">` — trigger; use `aria-haspopup="listbox"`, `aria-expanded`, and `aria-controls`
- `<div data-popover aria-hidden="true">` — popover content
- `<div role="listbox">` — options container; add `aria-multiselectable="true"` for multi-select
- `<div role="option" data-value="...">` — selectable option
- `<div role="group">` and `<span role="heading">` — optional groups
- `<hr role="separator">` — optional separator
- `<input type="hidden">` — submitted value (string for single, JSON array for multiple)

## Examples

### Basic

```html
<div class="select" data-placeholder="Theme">
  <button type="button" aria-haspopup="listbox" aria-expanded="false" aria-controls="theme-listbox">
    <span class="truncate">Theme</span>
    <svg aria-hidden="true"><!-- chevron --></svg>
  </button>
  <div data-popover aria-hidden="true">
    <div role="listbox" id="theme-listbox" aria-orientation="vertical" aria-labelledby="theme-trigger">
      <div role="option" data-value="light">Light</div>
      <div role="option" data-value="dark">Dark</div>
      <div role="option" data-value="system">System</div>
    </div>
  </div>
  <input type="hidden" name="theme" value="" />
</div>
```

### With groups

```html
<div class="select" data-placeholder="Select a fruit">
  <button type="button" aria-haspopup="listbox" aria-expanded="false" aria-controls="fruits-listbox">
    <span class="truncate">Select a fruit</span>
    <svg aria-hidden="true"><!-- chevron --></svg>
  </button>
  <div data-popover aria-hidden="true">
    <div role="listbox" id="fruits-listbox" aria-orientation="vertical" aria-labelledby="fruits-trigger">
      <div role="group" aria-labelledby="fruits-fruits">
        <span role="heading" id="fruits-fruits">Fruits</span>
        <div role="option" data-value="apple">Apple</div>
        <div role="option" data-value="banana">Banana</div>
      </div>
      <hr role="separator" />
      <div role="group" aria-labelledby="fruits-vegetables">
        <span role="heading" id="fruits-vegetables">Vegetables</span>
        <div role="option" data-value="carrot">Carrot</div>
        <div role="option" data-value="broccoli">Broccoli</div>
      </div>
    </div>
  </div>
  <input type="hidden" name="fruits-value" value="" />
</div>
```

### Scrollable (many options)

```html
<div class="select" data-placeholder="Select a timezone">
  <button type="button" aria-haspopup="listbox" aria-expanded="false" aria-controls="tz-listbox">
    <span class="truncate">Select a timezone</span>
    <svg aria-hidden="true"><!-- chevron --></svg>
  </button>
  <div data-popover aria-hidden="true">
    <div role="listbox" id="tz-listbox" class="scrollbar-sm max-h-70 overflow-y-auto" aria-orientation="vertical" aria-labelledby="tz-trigger">
      <div role="group" aria-labelledby="tz-na">
        <span role="heading" id="tz-na">North America</span>
        <div role="option" data-value="est">Eastern Standard Time (EST)</div>
        <div role="option" data-value="cst">Central Standard Time (CST)</div>
        <div role="option" data-value="mst">Mountain Standard Time (MST)</div>
        <div role="option" data-value="pst">Pacific Standard Time (PST)</div>
      </div>
      <div role="group" aria-labelledby="tz-eu">
        <span role="heading" id="tz-eu">Europe &amp; Africa</span>
        <div role="option" data-value="gmt">Greenwich Mean Time (GMT)</div>
        <div role="option" data-value="cet">Central European Time (CET)</div>
      </div>
    </div>
  </div>
  <input type="hidden" name="tz-value" value="" />
</div>
```

### Disabled

```html
<div class="select" data-placeholder="Select a fruit">
  <button type="button" aria-haspopup="listbox" aria-expanded="false" aria-controls="disabled-listbox" disabled>
    <span class="truncate">Select a fruit</span>
    <svg aria-hidden="true"><!-- chevron --></svg>
  </button>
  <div data-popover aria-hidden="true">
    <div role="listbox" id="disabled-listbox" aria-orientation="vertical" aria-labelledby="disabled-trigger">
      <div role="option" data-value="apple">Apple</div>
      <div role="option" data-value="banana" aria-disabled="true">Banana</div>
    </div>
  </div>
  <input type="hidden" name="disabled-value" value="" />
</div>
```

### Invalid

```html
<div class="field" data-invalid="true">
  <label for="invalid-trigger">Fruit</label>
  <div class="select" data-placeholder="Select a fruit">
    <button type="button" id="invalid-trigger" aria-haspopup="listbox" aria-expanded="false" aria-controls="invalid-listbox" aria-invalid="true">
      <span class="truncate">Select a fruit</span>
      <svg aria-hidden="true"><!-- chevron --></svg>
    </button>
    <div data-popover aria-hidden="true">
      <div role="listbox" id="invalid-listbox" aria-orientation="vertical" aria-labelledby="invalid-trigger">
        <div role="option" data-value="apple">Apple</div>
        <div role="option" data-value="banana">Banana</div>
      </div>
    </div>
    <input type="hidden" name="fruit" value="" />
  </div>
  <p role="alert">Please select a valid fruit.</p>
</div>
```

### RTL

```html
<div dir="rtl">
  <div class="select" data-placeholder="اختر فاكهة">
    <button type="button" aria-haspopup="listbox" aria-expanded="false" aria-controls="rtl-listbox">
      <span class="truncate">اختر فاكهة</span>
      <svg aria-hidden="true"><!-- chevron --></svg>
    </button>
    <div data-popover aria-hidden="true">
      <div role="listbox" id="rtl-listbox" aria-orientation="vertical" aria-labelledby="rtl-trigger">
        <div role="group" aria-labelledby="rtl-fruits">
          <span role="heading" id="rtl-fruits">الفواكه</span>
          <div role="option" data-value="apple">تفاح</div>
          <div role="option" data-value="banana">موز</div>
        </div>
      </div>
    </div>
    <input type="hidden" name="rtl-value" value="" />
  </div>
</div>
```

## JavaScript API

| API | Type | Description |
|---|---|---|
| `change` | Event | Dispatched on selection changes with `event.detail.value` and `event.detail.selected`. |
| `select.refresh()` | Method | Rescans options after children change inside the existing `role="listbox"` element. |

```js
const select = document.querySelector("#theme-listbox").closest(".select").basecoat;
select.refresh();
```

## Accessibility

- The trigger button has `aria-haspopup="listbox"`, `aria-expanded`, and `aria-controls` (pointing to the listbox id).
- The listbox has `role="listbox"` with `aria-orientation="vertical"` and `aria-labelledby` (pointing to the trigger's id).
- Each option has `role="option"` and `data-value` (the submitted value). `data-label` is optional and controls the selected display label.
- `aria-selected="true"` on the currently selected option (handled by the script).
- For groups, use `role="group"` with `aria-labelledby` pointing to the group heading.
- For invalid state, add `aria-invalid="true"` to the trigger button and connect the error message with `aria-describedby`.
- For disabled state, add `disabled` to the trigger button.
- For multi-select, `aria-multiselectable="true"` on the listbox enables chip-based selection.
- `Esc` closes the popover. Clicking outside also closes.

## Gotchas

- Use `Select` for custom option content, multi-select, or JS APIs. Use `Native Select` for native browser behavior, form integration, and mobile-optimized pickers.
- The trigger is a `<button>` not an `<a>`. Select is for actions (changing a value), not navigation.
- The hidden input is the form submission target. Set the `name` attribute on the hidden input, not on the trigger button.
- For server-rendered initial value, set the `value` attribute on the hidden input. Use a JSON array for multi-select.
- The chevron icon should be `aria-hidden="true"`.
- The listbox is not portalled — it renders inside the `.select` root. For very long lists, use `scrollbar-sm` and `max-h-*` on the listbox.
- Use `data-format="object"` if you need to serialize the full `{ value, label }` object in the hidden input.
- For dynamic options, call `select.refresh()` after changing the listbox children.
- The width of the trigger should match the popover width. Use `class="w-[180px]"` on the button to control the trigger width.
