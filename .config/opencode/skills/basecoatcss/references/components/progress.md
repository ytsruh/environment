# Progress


A progress bar showing completion or progress. Use for uploads, multi-step workflows, or any task with measurable progress.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.progress` (with `role="progressbar"`)
- **Native element:** the styled `<div>`, but you can also use `<progress>` for native semantics

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/progress";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<div class="progress" role="progressbar" aria-label="Loading" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">
  <span style="width: 66%"></span>
</div>
```

- `<div class="progress" role="progressbar">` — root; set `aria-label` or `aria-labelledby`, plus `aria-valuenow`, `aria-valuemin`, `aria-valuemax`
- `<span style="width: ...%">` — visual indicator; its width should match the current value

## Examples

### Basic

```html
<div class="progress" role="progressbar" aria-label="Loading" aria-valuenow="13" aria-valuemin="0" aria-valuemax="100">
  <span style="width: 13%"></span>
</div>
```

### With label and value

```html
<div class="field">
  <div class="flex items-center gap-3 text-sm">
    <label id="progress-label">Upload progress</label>
    <output class="ms-auto tabular-nums">66%</output>
  </div>
  <div class="progress" role="progressbar" aria-labelledby="progress-label" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">
    <span style="width: 66%"></span>
  </div>
</div>
```

### Indeterminate (no value)

For an indeterminate progress, omit `aria-valuenow`:

```html
<div class="progress" role="progressbar" aria-label="Loading">
  <span style="width: 100%; animation: indeterminate 1.5s infinite linear"></span>
</div>
```

You'll need to provide your own animation CSS for the indeterminate state. Alternatively, use a [Spinner](./spinner.md) for true indeterminate progress.

### Update progress with JavaScript

```html
<div id="progress-demo" class="progress" role="progressbar" aria-label="Loading" aria-valuenow="13" aria-valuemin="0" aria-valuemax="100">
  <span style="width: 13%"></span>
</div>

<script>
  setTimeout(() => {
    const progress = document.getElementById("progress-demo");
    const indicator = progress.querySelector("span");
    progress.setAttribute("aria-valuenow", "66");
    indicator.style.width = "66%";
  }, 500);
</script>
```

### RTL

```html
<div class="field w-full" dir="rtl">
  <label id="progress-upload-rtl" for="progress-upload">تقدم الرفع <span class="ms-auto">٦٦%</span></label>
  <div id="progress-upload" class="progress" role="progressbar" aria-labelledby="progress-upload-rtl" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100">
    <span style="width: 66%"></span>
  </div>
</div>
```

## Accessibility

- The progress root needs `role="progressbar"` and `aria-valuenow`, `aria-valuemin`, `aria-valuemax` attributes.
- Provide an accessible name via `aria-label` or `aria-labelledby` (e.g., a visible label that describes what the progress is measuring).
- For dynamic progress, update `aria-valuenow` and the inner `<span>` width together. The screen reader will announce the new value.
- For indeterminate progress, omit `aria-valuenow`. The screen reader will announce the progress as "busy" without a value.
- For an upload that takes a long time, consider also announcing completion with [Toast](./toast.md) or another live region.
- Don't use progress for indeterminate animations — use [Spinner](./spinner.md) instead.

## Gotchas

- The progress bar is a `<div>`, not the native `<progress>` element. This is intentional — the native `<progress>` element doesn't support the styling flexibility Basecoat needs. The `role="progressbar"` provides the semantics.
- The inner `<span>` width must be kept in sync with `aria-valuenow` (as a percentage of `aria-valuemax - aria-valuemin`).
- For RTL, the progress fills from the right by default. The visual direction follows the document direction.
- For multi-step workflows, consider using [Steps](./steps.md) (if available) or a custom implementation with a heading list.
- Use `tabular-nums` on the value `<output>` for nice number alignment as the value updates.
- The progress fill animation is not built-in. For smooth transitions when the value changes, add `transition: width 200ms ease;` to the inner `<span>`.
