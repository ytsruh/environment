---
name: basecoatcss
description: "Implements Basecoat CSS UI components in HTML using semantic class names, data-variant/data-size attributes, and shadcn-compatible theming. Use when building UIs with Basecoat, styling buttons/forms/dialogs/dropdowns/tabs/toasts, customizing themes, or working with Tailwind CSS + shadcn-style design tokens in plain HTML, Jinja, or Nunjucks."
---

# Basecoat CSS


Use this skill for Basecoat CSS v1.x — a framework-agnostic, Tailwind-based component library inspired by shadcn/ui. Read only the reference file(s) needed for the task.

## Quick Start

1. Identify whether the task is install/setup, theming, templates, JS behavior, accessibility, or a specific component.
2. Open the matching file from `references/`. Component files live in `references/components/`.
3. Use semantic class names (`btn`, `card`, `field`, `dialog`), `data-variant` / `data-size`, and native HTML elements where possible.
4. Load Basecoat stylesheets **after** Tailwind. Load interactive JS components only for the components used.

Minimal CDN example — a styled button on a static page:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Basecoat demo</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/basecoat.cdn.min.css" />
</head>
<body>
  <button type="button" class="btn">Primary</button>
  <button type="button" class="btn" data-variant="outline">Outline</button>
  <button type="button" class="btn" data-variant="destructive">Delete</button>
</body>
</html>
```

Minimal npm example — a button rendered through a Tailwind build:

```css
/* app.css */
@import "tailwindcss";
@import "basecoat-css";
```

```html
<button type="button" class="btn">Primary</button>
```

Add `<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/all.min.js" defer></script>` only when using interactive components (dropdowns, dialogs, tabs, toasts, etc.).

## Critical Rules

1. **Stylesheet order matters** — Load Basecoat **after** any stylesheet that includes Tailwind base/preflight. Loading another full Tailwind build after Basecoat resets borders, inputs, and component defaults. `references/installation.md`
2. **Pick one style pack** — Vega, Nova, Maia, Lyra, Mira, Luma, Sera, or Rhea. Style packs are standalone. Do not stack them. `references/theming.md`
3. **Use `data-variant` and `data-size` (1.0+)** — These are the documented attributes. Legacy variant classes (`btn-outline`, `btn-sm`, etc.) require the `basecoat-css/compat` import and are for migration only. `references/installation.md`
4. **Native HTML where possible** — Basecoat uses native `<dialog>` with `showModal()`/`close()`, native `<details>`/`<summary>` for accordion, and native form elements. Do not recreate these as custom divs. `components/dialog.md`, `components/accordion.md`
5. **11 components need JavaScript** — Accordion, Combobox, Command, Drawer, Dropdown Menu, Popover, Select, Sidebar, Slider, Tabs, Toast. All others are CSS-only. Chart uses a separate helper. `references/installation.md`
6. **Call `initAll()` after dynamic HTML** — When inserting Basecoat markup via JavaScript, framework rendering, or after `innerHTML` swaps, call `window.basecoat.initAll()`. Use `{ force: true }` after HTMX history restores. `references/javascript.md`
7. **Dialogs use the native `<dialog>` API** — Open with `dialog.showModal()`, close with `dialog.close()` or `<form method="dialog">`. Backdrop-click close is added by the dialog component on the dialog element. `components/dialog.md`
8. **Popovers/menus are inline-positioned** — Unlike shadcn/ui's portalled Base UI, Basecoat popovers/menus/selects are positioned relative to their wrapper. This keeps markup dependency-free but means they don't portal. `components/dropdown-menu.md`, `components/popover.md`
9. **One Basecoat style bundle per project** — For a custom design, import `basecoat-css/base` (structure only) and write your own style pack, **not** an existing one to override. `references/theming.md`
10. **Themes use shadcn-compatible CSS variables** — Override `--background`, `--foreground`, `--primary`, `--muted`, `--border`, `--input`, `--ring` for `:root` and `.dark`. Compatible with TweakCN and other shadcn theme generators. `references/theming.md`
11. **Icons are not bundled** — Examples use Lucide. Inline SVGs are simplest for plain HTML, Jinja, Nunjucks, Rails, Django, Laravel. Install `lucide` for JS rendering. `references/theming.md`
12. **Geist Sans/Mono is the default font** — Basecoat's `--font-sans` and `--font-mono` tokens prefer Geist with full system fallbacks. Install via Fontsource if you want the actual Geist files. `references/theming.md`
13. **RTL via `dir="rtl"`** — Set on the component or any ancestor. Use logical properties (`data-side="inline-start"`) instead of physical (`data-side="left"`). All components support RTL. `references/accessibility.md`
14. **Interactive components auto-initialize on page load** — and when new DOM is inserted. Re-init via `initAll()` after manual inserts; `initAll({ force: true })` after framework cache restores (e.g., HTMX history snapshots). `references/javascript.md`
15. **Templates are optional** — Nunjucks and Jinja macros live in `node_modules/basecoat-css/templates/`. Copy them into your app to use, edit, or extend. They are not required for HTML authoring. `references/templates.md`
16. **Read the component file before writing it** — Each component has a documented HTML structure, allowed `data-*` values, JS API (if interactive), and gotchas. Don't invent markup patterns; copy from the reference. `references/components/`

## Reference Map

- Installation, CDN, npm, imports, JS lifecycle, pre-1.0 compat: `references/installation.md`
- Style packs, theme tokens, fonts, icons, custom style packs: `references/theming.md`
- Nunjucks/Jinja templates, install, full macro prop reference: `references/templates.md`
- Global JS API, controllers, init patterns, framework integration: `references/javascript.md`
- ARIA, keyboard, focus, RTL, reduced motion, screen reader notes: `references/accessibility.md`
- Cross-file index, task routing, suggested reading order: `references/REFERENCE.md`

### Components

- Accordion → `references/components/accordion.md`
- Alert → `references/components/alert.md`
- Alert Dialog → `references/components/alert-dialog.md`
- Avatar → `references/components/avatar.md`
- Badge → `references/components/badge.md`
- Breadcrumb → `references/components/breadcrumb.md`
- Button → `references/components/button.md`
- Button Group → `references/components/button-group.md`
- Card → `references/components/card.md`
- Chart → `references/components/chart.md`
- Checkbox → `references/components/checkbox.md`
- Combobox → `references/components/combobox.md`
- Command → `references/components/command.md`
- Dialog → `references/components/dialog.md`
- Drawer → `references/components/drawer.md`
- Dropdown Menu → `references/components/dropdown-menu.md`
- Empty → `references/components/empty.md`
- Field → `references/components/field.md`
- Input → `references/components/input.md`
- Input Group → `references/components/input-group.md`
- Item → `references/components/item.md`
- Kbd → `references/components/kbd.md`
- Label → `references/components/label.md`
- Native Select → `references/components/native-select.md`
- Pagination → `references/components/pagination.md`
- Popover → `references/components/popover.md`
- Progress → `references/components/progress.md`
- Radio Group → `references/components/radio-group.md`
- Scroll Area → `references/components/scroll-area.md`
- Select → `references/components/select.md`
- Sidebar → `references/components/sidebar.md`
- Skeleton → `references/components/skeleton.md`
- Slider → `references/components/slider.md`
- Spinner → `references/components/spinner.md`
- Switch → `references/components/switch.md`
- Table → `references/components/table.md`
- Tabs → `references/components/tabs.md`
- Textarea → `references/components/textarea.md`
- Theme Switcher → `references/components/theme-switcher.md`
- Toast → `references/components/toast.md`
- Tooltip → `references/components/tooltip.md`

## Task Routing

- Installing Basecoat, choosing CDN vs npm, picking which CSS/JS files to import → `references/installation.md`
- Switching style packs (Vega → Sera, etc.), adding dark mode, overriding theme tokens → `references/theming.md`
- Customizing colors, fonts, or writing a custom style pack from scratch → `references/theming.md`
- Using Nunjucks/Jinja macros (combobox, dialog, sidebar, tabs, toaster, etc.) → `references/templates.md`
- Calling the JS API, opening/closing a dialog from JS, showing a toast, re-initializing after dynamic HTML → `references/javascript.md`
- Integrating with HTMX, Turbo, Alpine, or any framework that swaps HTML → `references/javascript.md`
- ARIA roles, keyboard navigation, focus management, RTL support, reduced motion → `references/accessibility.md`
- Building a specific component (button, card, dialog, dropdown, etc.) → `references/components/{name}.md`
- Looking up exact `data-variant` / `data-size` values or allowed HTML structure → `references/components/{name}.md`
- Diagnosing why a component isn't working, missing JS, wrong import order, hydration mismatch → `references/javascript.md` and `references/installation.md`
- Deciding which Basecoat component to use for a UI requirement → `references/REFERENCE.md` then the component file
