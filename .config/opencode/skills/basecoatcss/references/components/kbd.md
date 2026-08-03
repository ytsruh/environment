# Kbd


A keyboard key indicator. Use for displaying keyboard shortcuts in documentation, tooltips, or input hints.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.kbd`
- **Native element:** `<kbd>`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/kbd";
@import "basecoat-css/components/button";
@import "basecoat-css/components/button-group";
@import "basecoat-css/components/input-group";
@import "basecoat-css/components/tooltip";
@import "basecoat-css/styles/vega";
```

Kbd examples compose Button, Button Group, Input Group, and Tooltip styles.

## HTML structure

```html
<kbd class="kbd">⌘K</kbd>
```

For multiple keys, wrap them in an inline-flex container:

```html
<span class="inline-flex items-center gap-1">
  <kbd class="kbd">⌘</kbd>
  <kbd class="kbd">⇧</kbd>
  <kbd class="kbd">⌥</kbd>
</span>
```

## Examples

### Single key

```html
<kbd class="kbd">⌘K</kbd>
```

### Grouped keys (modifier combo)

```html
<span class="inline-flex items-center gap-1">
  <kbd class="kbd">⌘</kbd>
  <span>+</span>
  <kbd class="kbd">B</kbd>
</span>
```

### Multiple combinations

```html
<p class="text-muted-foreground text-sm">Use
  <span class="inline-flex items-center gap-1">
    <kbd class="kbd">Ctrl</kbd>
    <span>+</span>
    <kbd class="kbd">B</kbd>
  </span>
  <span class="inline-flex items-center gap-1">
    <kbd class="kbd">Ctrl</kbd>
    <span>+</span>
    <kbd class="kbd">K</kbd>
  </span>
  to open the command palette
</p>
```

### Inside a button (with shortcut hint)

```html
<button class="btn" data-variant="outline">
  Accept
  <kbd class="kbd translate-x-0.5" data-icon="inline-end">⏎</kbd>
</button>
```

### In an input group (search shortcut)

```html
<div class="input-group">
  <input type="search" placeholder="Search..." />
  <span data-align="start" aria-hidden="true">
    <svg class="lucide lucide-search" ...></svg>
  </span>
  <span data-align="end">
    <span class="inline-flex items-center gap-1">
      <kbd class="kbd">⌘</kbd>
      <kbd class="kbd">K</kbd>
    </span>
  </span>
</div>
```

### RTL

```html
<div class="flex flex-col items-center gap-4" dir="rtl">
  <span class="inline-flex items-center gap-1">
    <kbd class="kbd">⌘</kbd>
    <kbd class="kbd">⇧</kbd>
    <kbd class="kbd">⌥</kbd>
    <kbd class="kbd">⌃</kbd>
  </span>
  <span class="inline-flex items-center gap-1">
    <kbd class="kbd">Ctrl</kbd>
    <span>+</span>
    <kbd class="kbd">B</kbd>
  </span>
</div>
```

## Accessibility

- The `<kbd>` element has implicit `role="text"` (technically, the spec says it represents user input). Screen readers will announce the key as keyboard input.
- For shortcut hints, use the natural language form: "Press Ctrl+B" or "⌘B".
- Use the actual key names or symbols (`⌘`, `Ctrl`, `Shift`, `Tab`, `Enter`, etc.). Don't abbreviate to letters unless the user is expected to press a letter key.
- Modifier keys: ⌘ (Command), ⇧ (Shift), ⌥ (Option/Alt), ⌃ (Control), ↵ (Enter), ⏎ (Return), ⌫ (Delete/Backspace), ⌦ (Forward Delete), ⇥ (Tab).
- For a "press these keys together" combo, use `+` between keys.
- For a "press these keys in sequence" combo, separate with space or "then".

## Gotchas

- `<kbd>` is the semantic element for keyboard input. Don't use `<span class="kbd">`.
- The base class is `kbd` (not `btn` or `key`). Don't confuse with button or input.
- Modifier symbols (⌘, ⇧, ⌥, ⌃) are direction-neutral — no need to flip in RTL.
- For wider key labels (e.g., "Ctrl", "Shift", "Enter"), the `.kbd` class adjusts the sizing automatically.
- Keyboard labels are typically read by screen readers as their character (e.g., ⌘ might be read as "command" or "place of interest" depending on the screen reader). Provide a textual alternative nearby for clarity.
- Use `data-icon="inline-end"` on the `<kbd>` when it's inside a button to get icon-aware spacing.
