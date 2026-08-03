# Combobox


An input-first autocomplete / filterable select. Type to filter, arrow keys to navigate, Enter to select. Supports single and multiple (with chips) modes, an optional clear button, custom filter strings, and object serialization.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/combobox`
- **Root class:** `.combobox`
- **Template macro:** `combobox()` for Nunjucks/Jinja — see `references/templates.md`

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
@import "basecoat-css/components/combobox";
@import "basecoat-css/styles/vega";
```

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/combobox.min.js" defer></script>
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-auto-highlight` | `.combobox` | `"true"` | Auto-highlight the first matching option when list opens or filters. |
| `data-format` | `.combobox` | `"value"`, `"object"` | Hidden input serialization. `"object"` stores `{ value, label }`. |
| `data-filter` | `.combobox` | `"manual"` | Disable built-in filtering. Your app provides filtering. |
| `data-empty` | `role="listbox"` | string | Empty-state text when no options match. |
| `aria-multiselectable` | `role="listbox"` | `"true"` | Enables chip-based multi-select. |

## HTML structure

```html
<div id="framework-combobox" class="combobox">
  <input type="text" role="combobox" placeholder="Select a framework" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="framework-combobox-listbox" />
  <svg aria-hidden="true" class="combobox-trigger-icon"><!-- chevron --></svg>
  <div id="framework-combobox-popover" data-popover aria-hidden="true">
    <div role="listbox" id="framework-combobox-listbox" aria-orientation="vertical" data-empty="No items found.">
      <div role="option" data-value="Next.js">Next.js</div>
      <div role="option" data-value="SvelteKit">SvelteKit</div>
    </div>
  </div>
  <input type="hidden" name="framework" value="" />
</div>
```

- `<div class="combobox">` — root
- `<input type="text" role="combobox">` — editable input; can be a direct child, inside `.input-group`, or inside `data-popover` for popup mode
- `<svg class="combobox-trigger-icon">` — decorative trailing icon
- `<button data-clear>` — optional clear button
- `<div data-popover>` — suggestions popup; supports `data-side` and `data-align`
- `<div role="listbox">` — suggestions list
- `<div role="option" data-value="...">` — selectable option
- `<input type="hidden">` — submitted value (string for single, JSON array for multiple)

## Examples

### Basic (single select)

```html
<div id="framework-combobox" class="combobox">
  <input type="text" role="combobox" placeholder="Select a framework" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="framework-combobox-listbox" />
  <svg aria-hidden="true" class="combobox-trigger-icon"><!-- chevron --></svg>
  <div id="framework-combobox-popover" data-popover aria-hidden="true">
    <div role="listbox" id="framework-combobox-listbox" aria-orientation="vertical" data-empty="No items found.">
      <div role="option" data-value="Next.js">Next.js</div>
      <div role="option" data-value="SvelteKit">SvelteKit</div>
      <div role="option" data-value="Nuxt.js">Nuxt.js</div>
    </div>
  </div>
  <input type="hidden" name="framework" value="" />
</div>
```

### Multiple select (chips)

Add `aria-multiselectable="true"` to the listbox and seed the hidden input with a JSON array:

```html
<div id="frameworks-combobox" class="combobox w-full" data-auto-highlight="true">
  <input type="text" role="combobox" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="frameworks-combobox-listbox" />
  <div id="frameworks-combobox-popover" data-popover aria-hidden="true">
    <div role="listbox" id="frameworks-combobox-listbox" aria-orientation="vertical" aria-multiselectable="true" data-empty="No items found.">
      <div role="option" data-value="Next.js">Next.js</div>
      <div role="option" data-value="SvelteKit">SvelteKit</div>
    </div>
  </div>
  <input type="hidden" name="frameworks" value='["Next.js"]' />
</div>
```

### With clear button

Use the `data-clear` attribute and a `.input-group` wrapper for the clear + chevron buttons:

```html
<div id="clear-combobox" class="combobox">
  <div class="input-group">
    <input type="text" role="combobox" placeholder="Select a framework" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="clear-combobox-listbox" />
    <span role="group" data-align="inline-end">
      <button type="button" data-clear aria-label="Clear selection">
        <svg class="size-4" aria-hidden="true"><!-- X --></svg>
      </button>
      <button type="button" class="btn" data-variant="ghost" data-size="icon-xs" aria-label="Open suggestions" aria-haspopup="listbox" aria-expanded="false" aria-controls="clear-combobox-listbox">
        <svg aria-hidden="true"><!-- chevron --></svg>
      </button>
    </span>
  </div>
  <div id="clear-combobox-popover" data-popover aria-hidden="true">
    <div role="listbox" id="clear-combobox-listbox" aria-orientation="vertical" data-empty="No items found.">
      <div role="option" data-value="Next.js">Next.js</div>
    </div>
  </div>
  <input type="hidden" name="framework-clear" value="Next.js" />
</div>
```

### Grouped options

```html
<div id="timezone-combobox" class="combobox">
  <input type="text" role="combobox" placeholder="Select a timezone" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="timezone-combobox-listbox" />
  <svg aria-hidden="true" class="combobox-trigger-icon"><!-- chevron --></svg>
  <div id="timezone-combobox-popover" data-popover aria-hidden="true">
    <div role="listbox" id="timezone-combobox-listbox" class="scrollbar-sm" aria-orientation="vertical" data-empty="No timezones found.">
      <div role="group" aria-labelledby="timezone-americas">
        <div role="heading" id="timezone-americas">Americas</div>
        <div role="option" data-value="(GMT-5) New York">(GMT-5) New York</div>
        <div role="option" data-value="(GMT-8) Los Angeles">(GMT-8) Los Angeles</div>
      </div>
      <hr role="separator" />
      <div role="group" aria-labelledby="timezone-europe">
        <div role="heading" id="timezone-europe">Europe</div>
        <div role="option" data-value="(GMT+0) London">(GMT+0) London</div>
      </div>
    </div>
  </div>
  <input type="hidden" value="" />
</div>
```

### Custom items (rich content with separate filter string)

Use `data-label` to set the input display text and `data-filter` to provide a custom match string:

```html
<div id="country-combobox" class="combobox">
  <input type="text" role="combobox" placeholder="Search countries" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="country-combobox-listbox" />
  <svg aria-hidden="true" class="combobox-trigger-icon"><!-- chevron --></svg>
  <div id="country-combobox-popover" data-popover aria-hidden="true">
    <div role="listbox" id="country-combobox-listbox" aria-orientation="vertical" data-empty="No items found.">
      <div role="option" data-value="argentina" data-label="Argentina" data-filter="Argentina South America">
        <span class="flex flex-col">
          <span>Argentina</span>
          <span class="text-muted-foreground text-xs">South America</span>
        </span>
      </div>
    </div>
  </div>
  <input type="hidden" value="" />
</div>
```

### Invalid

Add `aria-invalid="true"` to the input and `data-invalid` to the field:

```html
<div role="group" class="field" data-invalid="true">
  <label for="invalid-combobox-input">Framework</label>
  <div id="invalid-combobox" class="combobox">
    <input type="text" role="combobox" id="invalid-combobox-input" placeholder="Select a framework" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="invalid-combobox-listbox" aria-invalid="true" />
    <svg aria-hidden="true" class="combobox-trigger-icon"><!-- chevron --></svg>
    <div id="invalid-combobox-popover" data-popover aria-hidden="true">
      <div role="listbox" id="invalid-combobox-listbox" aria-orientation="vertical" data-empty="No items found.">
        <div role="option" data-value="Next.js">Next.js</div>
      </div>
    </div>
    <input type="hidden" value="" />
  </div>
  <p role="alert">Select a framework to continue.</p>
</div>
```

### Popup mode (button trigger, not inline)

The button shows the selected value; clicking opens a popover that contains the search input and listbox:

```html
<div id="popup-combobox" class="combobox">
  <button type="button" class="btn w-64 justify-between font-normal" data-variant="outline" aria-haspopup="listbox" aria-expanded="false" aria-controls="popup-combobox-listbox">
    <span data-value data-placeholder="Select country">Select country</span>
    <svg aria-hidden="true"><!-- chevron --></svg>
  </button>
  <div id="popup-combobox-popover" data-popover aria-hidden="true">
    <div class="input-group">
      <input type="text" role="combobox" placeholder="Search" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="popup-combobox-listbox" />
    </div>
    <div role="listbox" id="popup-combobox-listbox" aria-orientation="vertical" data-empty="No items found.">
      <div role="option" data-value="argentina" data-label="Argentina">Argentina</div>
    </div>
  </div>
  <input type="hidden" value="" />
</div>
```

### Auto highlight

```html
<div id="auto-highlight-combobox" class="combobox" data-auto-highlight="true">
  <!-- ... -->
</div>
```

Pressing Enter immediately selects the first visible option.

### RTL

```html
<div dir="rtl" class="field w-full max-w-xs">
  <label for="rtl-combobox-input">الفئات</label>
  <div id="rtl-combobox" class="combobox w-full" data-auto-highlight="true">
    <input id="rtl-combobox-input" type="text" role="combobox" placeholder="أضف فئات" autocomplete="off" autocorrect="off" spellcheck="false" aria-autocomplete="list" aria-expanded="false" aria-controls="rtl-combobox-listbox" />
    <div id="rtl-combobox-popover" data-popover aria-hidden="true">
      <div role="listbox" id="rtl-combobox-listbox" aria-orientation="vertical" aria-multiselectable="true" data-empty="لم يتم العثور على فئات.">
        <div role="option" data-value="technology" data-label="التكنولوجيا">التكنولوجيا</div>
        <div role="option" data-value="design" data-label="التصميم">التصميم</div>
      </div>
    </div>
    <input type="hidden" value='["technology"]' />
  </div>
</div>
```

## JavaScript API

| API | Type | Description |
|---|---|---|
| `change` | Event | Dispatched on selection changes with `event.detail.value` and `event.detail.selected`. |
| `combobox.setValue(value)` | Method | Sets the selected value from a plain value or `{ value, label }` object. |
| `combobox.clear()` | Method | Clears the selected value. |
| `combobox.refresh()` | Method | Rescans options after children change inside the existing `role="listbox"` element. |

```js
const combobox = document.querySelector("#framework-combobox").basecoat;
combobox.setValue("SvelteKit");
combobox.clear();
```

## Accessibility

- The input is `role="combobox"` with `aria-autocomplete="list"`. The popover is `role="listbox"`. This is the standard ARIA combobox pattern.
- Connect the input to the listbox via `aria-controls`.
- `aria-expanded` on the input reflects the popover state.
- For invalid state, add `aria-invalid="true"` to the input and connect the error message via `aria-describedby`.
- For custom filter strings, use `data-filter` so users can search by the search term, not the displayed text.
- For multi-select, `aria-multiselectable="true"` on the listbox enables chip-based selection.
- Decorative chevron icons should be `aria-hidden="true"`.
- Use a `<label>` element (via `.field`) or `aria-label` for the input.

## Gotchas

- The input must have `role="combobox"`, `autocomplete="off"`, and `spellcheck="false"`. Without these, the browser's built-in autocomplete can interfere with the combobox behavior.
- For multi-select, the hidden input value is a JSON-encoded array string, not a comma-separated list.
- For custom filter strings, the `data-label` controls what shows in the input after selection; `data-filter` controls what the user can search by.
- When the listbox is inside an `input-group`, the input must be the **first** child for the script to attach correctly.
- Use `data-format="object"` if you need to serialize the full `{ value, label }` object in the hidden input.
- For server-rendered initial value, set the `value` attribute on the hidden input (use `value='["a","b"]'` for arrays, with proper HTML escaping).
- The combobox script must load after `basecoat-css/basecoat` runtime.
