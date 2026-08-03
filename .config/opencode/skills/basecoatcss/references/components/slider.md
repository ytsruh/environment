# Slider


A native range input styled as a slider. Basecoat intentionally uses the native range input for built-in keyboard support, touch handling, and form integration.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/range`
- **Root class:** `class="input"` (on the `<input type="range">`)
- **Native element:** `<input type="range">`

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
@import "basecoat-css/components/range";
@import "basecoat-css/styles/vega";
```

Slider uses the Range component CSS.

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>
```

Or:

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/range.min.js" defer></script>
```

The range script keeps the filled track in sync with the input value.

## HTML structure

```html
<input type="range" class="input w-full" min="0" max="100" value="50" />
```

- `<input type="range" class="input">` — native range input styled as a slider
- Standard range attributes: `min`, `max`, `step`, `value`

## JavaScript API

| API | Type | Description |
|---|---|---|
| `slider.refresh()` | Method | Rescans the range after attributes change. |

## Examples

### Default

```html
<input type="range" class="input w-full" min="0" max="100" value="50" />
```

### With label and value display

```html
<div class="grid w-full gap-1 max-w-sm">
  <div class="flex items-center justify-between gap-2">
    <label class="label" for="temperature">Temperature</label>
    <output class="text-sm text-muted-foreground" for="temperature">50</output>
  </div>
  <input
    id="temperature"
    type="range"
    class="input w-full"
    min="0"
    max="100"
    value="50"
    oninput="this.previousElementSibling.querySelector('output').value = this.value"
  />
</div>
```

### Disabled

```html
<input type="range" class="input w-full" min="0" max="100" value="50" disabled />
```

### With step

```html
<input type="range" class="input w-full" min="0" max="100" step="5" value="50" />
```

### Range with min/max labels

```html
<div class="grid gap-2">
  <input type="range" class="input w-full" min="0" max="100" value="50" />
  <div class="flex justify-between text-xs text-muted-foreground">
    <span>0</span>
    <span>100</span>
  </div>
</div>
```

### RTL

```html
<input type="range" class="input w-full" min="0" max="100" value="50" dir="rtl" />
```

## Accessibility

- Always pair with a `<label>` (using `for` matching the `id`).
- For a value display, use `<output for="...">` so the value is associated with the input. Update the output via JavaScript on `input` events.
- Native range inputs have built-in keyboard support:
  - `←` / `→` — small step (decrement / increment by `step`)
  - `↑` / `↓` — small step
  - `Home` / `End` — min / max
  - `Page Up` / `Page Down` — large step
- For descriptive helper text (e.g., "Set your maximum budget"), connect it with `aria-describedby`.
- For invalid state, add `aria-invalid="true"` and connect the error with `aria-describedby`.

## Gotchas

- Basecoat intentionally uses the native range input. It does not support multiple thumbs (unlike shadcn/ui's Base UI slider).
- Vertical orientation is not supported by the native range input in all browsers. If you need a vertical slider, use a custom implementation.
- The `value` attribute is the initial value. The current value is the `value` property — read it via JavaScript to get the live value.
- The `step` attribute controls the increment. `step="any"` allows any decimal value.
- The range script is needed to keep the filled track in sync with the value. Without it, the visual track may not reflect the current value in all browsers.
- For form submission, the `<input type="range">` is included automatically (with its current value).
- For a custom-styled slider with full control, consider a custom implementation. Basecoat's Slider is for simple, accessible range inputs.
