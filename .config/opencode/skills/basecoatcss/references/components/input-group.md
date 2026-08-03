# Input Group


A shell for adding icons, text, buttons, or helper content inside an input. The Input Group turns the input into a composite control with inline or block addons.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.input-group`
- **Native element:** any block container (typically `<div>`)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/input-group";
@import "basecoat-css/styles/vega";
```

## Data attributes

| Attribute | Element | Values | Description |
|---|---|---|---|
| `data-orientation` | `.input-group` | `"vertical"` | Stack addons above/below the input (use with `<header>` / `<footer>`). |
| `data-align` | `<span>` addon | `"start"`, `"end"` | Logical position. `"start"` = inline-start, `"end"` = inline-end. RTL-aware. |
| `data-control` | custom control element | (presence) | Escape hatch for custom controls that aren't native `<input>`, `<textarea>`, or `<select>`. |

## HTML structure

```html
<div class="input-group">
  <input type="text" placeholder="Search..." />
  <span data-align="start" aria-hidden="true"><!-- icon --></span>
  <span data-align="end">12 results</span>
</div>
```

- `<div class="input-group">` — root shell
- `<input>`, `<textarea>`, `<select>` — the native control; becomes borderless inside the shell
- `<span>`, `<svg>`, `<kbd>` — decorative or helper content
- `<button>`, `<div role="group">` — interactive actions
- `<header>`, `<footer>` — header/footer addons for vertical orientation
- `[data-control]` — escape hatch for custom controls

## Examples

### Basic (icon + text addons)

```html
<div class="input-group">
  <input type="text" placeholder="Search..." />
  <span data-align="start" aria-hidden="true">
    <svg class="lucide lucide-search" ...></svg>
  </span>
  <span data-align="end">12 results</span>
</div>
```

### Inline start (icon at the start)

```html
<div class="field">
  <label for="inline-start">Input</label>
  <div class="input-group">
    <input id="inline-start" type="text" placeholder="Search..." />
    <span role="group" data-align="start" aria-hidden="true">
      <svg class="text-muted-foreground lucide lucide-search" ...></svg>
    </span>
  </div>
  <p>Icon positioned at the start.</p>
</div>
```

### Inline end (icon at the end)

```html
<div class="field">
  <label for="inline-end">Input</label>
  <div class="input-group">
    <input id="inline-end" type="password" placeholder="Enter password" />
    <span role="group" data-align="end" aria-hidden="true">
      <svg class="lucide lucide-eye-off" ...></svg>
    </span>
  </div>
  <p>Icon positioned at the end.</p>
</div>
```

### Block start (header above input)

```html
<div class="field">
  <label for="block-start">Input</label>
  <div class="input-group" data-orientation="vertical">
    <input id="block-start" type="text" placeholder="Enter your name" />
    <header data-align="start">
      <span>Full Name</span>
    </header>
  </div>
</div>
```

### Block end (footer below input)

```html
<div class="field">
  <label for="block-end">Input</label>
  <div class="input-group" data-orientation="vertical">
    <input id="block-end" type="text" placeholder="Enter amount" />
    <footer data-align="end">
      <span>USD</span>
    </footer>
  </div>
</div>
```

### With text addons (currency, URL, etc.)

```html
<div class="grid gap-6">
  <div class="input-group">
    <input type="text" placeholder="0.00" />
    <span data-align="start">$</span>
    <span data-align="end">USD</span>
  </div>
  <div class="input-group">
    <input type="text" placeholder="example.com" />
    <span data-align="start">https://</span>
    <span data-align="end">.com</span>
  </div>
  <div class="input-group">
    <input type="text" placeholder="Enter your username" />
    <span data-align="end">@company.com</span>
  </div>
</div>
```

### With buttons

```html
<div class="input-group">
  <input type="text" readonly placeholder="https://x.com/shadcn" />
  <button type="button" class="btn" data-variant="ghost" data-size="icon-xs" data-align="end" aria-label="Copy" title="Copy">
    <svg class="lucide lucide-copy" ...></svg>
  </button>
</div>

<div class="input-group [--radius:9999px]">
  <button type="button" class="btn" data-variant="secondary" data-size="icon-xs" data-align="start" aria-label="Connection information">
    <svg class="lucide lucide-info" ...></svg>
  </button>
  <span data-align="start" class="text-muted-foreground">https://</span>
  <input type="text" id="input-secure" />
  <button type="button" class="btn" data-variant="ghost" data-size="icon-xs" data-align="end" aria-label="Favorite">
    <svg class="lucide lucide-star" ...></svg>
  </button>
</div>
```

### With kbd shortcut

```html
<div class="input-group">
  <input type="text" placeholder="Search..." />
  <span data-align="start" aria-hidden="true">
    <svg class="lucide lucide-search" ...></svg>
  </span>
  <span data-align="end"><kbd class="kbd">⌘K</kbd></span>
</div>
```

### With dropdown menu

```html
<div class="input-group">
  <input type="text" placeholder="Enter file name" />
  <div class="dropdown-menu" data-align="end">
    <button type="button" id="file-trigger" aria-haspopup="menu" aria-controls="file-menu" aria-expanded="false" class="btn" data-variant="ghost" data-size="icon-xs" aria-label="Open file actions">
      <svg class="lucide lucide-ellipsis" ...></svg>
    </button>
    <div data-popover aria-hidden="true" data-align="end" class="min-w-32">
      <div role="menu" id="file-menu" aria-labelledby="file-trigger">
        <div role="menuitem">Settings</div>
        <div role="menuitem">Copy path</div>
      </div>
    </div>
  </div>
</div>
```

### With spinner (loading)

```html
<div class="input-group">
  <input type="text" placeholder="Searching..." />
  <span data-align="end">
    <svg aria-label="Loading" role="status" class="animate-spin lucide lucide-loader-circle" ...></svg>
  </span>
</div>
```

### Textarea in input group (e.g., code editor)

```html
<div class="input-group min-h-[200px]" data-orientation="vertical">
  <textarea placeholder="console.log('Hello, world!');"></textarea>
  <footer data-align="end" class="border-t">
    <span>Line 1, Column 1</span>
    <button type="button" class="btn ml-auto" data-size="sm">
      Run
      <svg class="lucide lucide-corner-down-left" ...></svg>
    </button>
  </footer>
  <header data-align="start" class="border-b">
    <svg class="text-muted-foreground lucide lucide-file-code" ...></svg>
    <span>script.js</span>
    <div role="group" aria-label="File actions" class="ml-auto flex gap-1">
      <button type="button" class="btn" data-variant="ghost" data-size="icon-xs" aria-label="Refresh">
        <svg class="lucide lucide-refresh-ccw" ...></svg>
      </button>
      <button type="button" class="btn" data-variant="ghost" data-size="icon-xs" aria-label="Copy">
        <svg class="lucide lucide-copy" ...></svg>
      </button>
    </div>
  </header>
</div>
```

### Custom control (autosize textarea)

```html
<div class="input-group" data-orientation="vertical">
  <textarea data-control placeholder="Autoresize textarea..." class="field-sizing-content min-h-16 resize-none"></textarea>
  <footer data-align="end">
    <button type="button" class="btn ml-auto" data-size="sm">Submit</button>
  </footer>
</div>
```

### RTL

```html
<div dir="rtl" class="grid gap-6">
  <div class="input-group">
    <input type="text" placeholder="بحث..." />
    <span role="group" data-align="start" aria-hidden="true">
      <svg class="lucide lucide-search" ...></svg>
    </span>
    <span role="group" data-align="end">١٢ نتيجة</span>
  </div>
</div>
```

## Accessibility

- The native control (`<input>`, `<textarea>`, `<select>`) inside the group is the accessible name source. Add a `<label>` via `.field` or `aria-label`.
- Decorative icons should be `aria-hidden="true"`. They should not be the only way to identify the input.
- For interactive addons (buttons, kbd shortcuts), ensure they have accessible names. Icon-only buttons need `aria-label`.
- For multiple buttons sharing one side, wrap them in `<div role="group" aria-label="...">` so screen readers can announce them as a group.
- The custom-control escape hatch (`data-control`) is for advanced cases. Provide your own focus management, ARIA, and form integration.

## Gotchas

- `data-align="start"` / `"end"` are logical (RTL-aware). Don't use physical `left` / `right`.
- For vertical layout, use `data-orientation="vertical"` on the root and addons as `<header>` / `<footer>`.
- Native controls inside `.input-group` become borderless — the shell provides the border.
- For a custom control (not `<input>`, `<textarea>`, `<select>`), add the `data-control` attribute so the script knows to handle it correctly.
- For borderless addons that look like buttons, use the `<button class="btn" data-size="icon-xs">` pattern.
- The `--radius` CSS custom property can override the border radius for individual groups: `class="input-group [--radius:1rem]"`.
- For the manual `relative` + `absolute` icon positioning pattern, use `ps-9` (padding-start) and `start-3` for RTL-aware positioning.
