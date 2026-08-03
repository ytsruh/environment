# Theme Switcher


A button to toggle between light and dark mode. Uses `window.basecoat.theme` to manage the mode and persists the choice in `localStorage`.

## Overview

- **CSS-only:** no
- **JS module:** `basecoat-css/basecoat` (the runtime only — no additional component script)
- **Root element:** any `<button>`

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
@import "basecoat-css/components/button";
@import "basecoat-css/components/tooltip";
@import "basecoat-css/styles/vega";
```

Theme Switcher composes Button and Tooltip component CSS.

### JavaScript

```html
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
```

The basecoat runtime includes the theme helper — no additional component script is needed.

## Avoid the initial flash

Add this inline script **before** loading your styles so the stored mode is applied before the page renders:

```html
<script>
  (() => {
    try {
      const stored = localStorage.getItem("themeMode");
      if (stored ? stored === "dark" : matchMedia("(prefers-color-scheme: dark)").matches) {
        document.documentElement.classList.add("dark");
      }
    } catch (_) {}
  })();
</script>
```

This script:
- Checks `localStorage.themeMode` for an explicit user choice
- Falls back to the user's system preference (`prefers-color-scheme: dark`)
- Adds the `dark` class to `<html>` before the page paints

Without this script, users see a brief flash of the light theme before the dark mode kicks in.

## HTML structure

```html
<button type="button" aria-label="Toggle dark mode" data-tooltip="Toggle dark mode" data-side="bottom" onclick="window.basecoat.theme.toggle()" class="btn size-8" data-variant="outline" data-size="icon">
  <span class="hidden dark:block"><!-- sun icon --></span>
  <span class="block dark:hidden"><!-- moon icon --></span>
</button>
```

- The button has two icon spans, one for each mode, toggled by Tailwind's `dark:` variant
- `aria-label` provides the accessible name
- `data-tooltip` adds a hover/focus tooltip (requires the [Tooltip](./tooltip.md) script)
- `onclick` calls `window.basecoat.theme.toggle()`

## JavaScript API

| API | Type | Description |
|---|---|---|
| `window.basecoat.theme.get()` | Method | Returns `"dark"` or `"light"`. |
| `window.basecoat.theme.set(mode)` | Method | Sets the mode to `"dark"` or `"light"` and stores it in `localStorage.themeMode`. |
| `window.basecoat.theme.toggle()` | Method | Toggles between dark and light mode. |

```js
// Get the current mode
const mode = window.basecoat.theme.get(); // "dark" or "light"

// Set the mode explicitly
window.basecoat.theme.set("dark");
window.basecoat.theme.set("light");

// Toggle the mode
window.basecoat.theme.toggle();
```

## Examples

### Basic icon button

```html
<button
  type="button"
  aria-label="Toggle dark mode"
  data-tooltip="Toggle dark mode"
  data-side="bottom"
  onclick="window.basecoat.theme.toggle()"
  class="btn size-8" data-variant="outline" data-size="icon"
>
  <span class="hidden dark:block">
    <svg class="lucide lucide-sun" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <circle cx="12" cy="12" r="4" />
      <path d="M12 2v2" />
      <path d="M12 20v2" />
      <path d="m4.93 4.93 1.41 1.41" />
      <path d="m17.66 17.66 1.41 1.41" />
      <path d="M2 12h2" />
      <path d="M20 12h2" />
      <path d="m6.34 17.66-1.41 1.41" />
      <path d="m19.07 4.93-1.41 1.41" />
    </svg>
  </span>
  <span class="block dark:hidden">
    <svg class="lucide lucide-moon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
      <path d="M20.985 12.486a9 9 0 1 1-9.473-9.472c.405-.022.617.46.402.803a6 6 0 0 0 8.268 8.268c.344-.215.825-.004.803.401" />
    </svg>
  </span>
</button>
```

### Programmatic toggle

```html
<button type="button" onclick="window.basecoat.theme.set('dark')" class="btn">Force dark</button>
<button type="button" onclick="window.basecoat.theme.set('light')" class="btn">Force light</button>
<button type="button" onclick="window.basecoat.theme.toggle()" class="btn">Toggle</button>
```

### Listen for mode changes

```js
const observer = new MutationObserver((mutations) => {
  for (const mutation of mutations) {
    if (mutation.attributeName === "class") {
      const isDark = document.documentElement.classList.contains("dark");
      console.log("Mode is now:", isDark ? "dark" : "light");
    }
  }
});

observer.observe(document.documentElement, {
  attributes: true,
  attributeFilter: ["class"]
});
```

## Accessibility

- Always provide `aria-label` on the button (e.g., "Toggle dark mode", "Switch to dark mode").
- The two icon spans are decorative — they're toggled by Tailwind's `dark:` variant and the `hidden` / `block` classes.
- For a tooltip, use `data-tooltip` (requires the [Tooltip](./tooltip.md) script) or a custom tooltip.
- Announce the mode change to screen readers (e.g., "Dark mode enabled") via a live region if it's important for users to know.
- Respect `prefers-color-scheme` for users who haven't made an explicit choice.

## Gotchas

- Always include the inline script in `<head>` **before** the stylesheets to avoid a flash of the light theme.
- The theme mode is stored in `localStorage.themeMode` as `"dark"` or `"light"`.
- The `dark` class is added to `<html>` (`document.documentElement`), not `<body>`. Tailwind's `dark:` variant uses this class.
- The default mode (no stored preference and no system preference) is light. To make dark the default, add `class="dark"` to `<html>` and use the inline script to remove it if the user prefers light.
- The theme helper works with the active style pack. If you change stylesheets, the mode persists across page loads.
- For multiple tabs, all tabs should respect the same theme. The mode is shared via `localStorage`.
- For server-side rendering, you can read the stored mode in your server and add the `dark` class to `<html>` in the initial response. This avoids any flash even before the inline script runs.
- The theme switcher is not a component — it's a pattern using a button with `onclick="window.basecoat.theme.toggle()"`.
