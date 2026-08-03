---
description: Cross-file index for the Basecoat CSS skill. Use this to pick the smallest reference file that matches the task.
globs: "*.{html,css,js,ts,njk,jinja}"
---

# Basecoat CSS Reference Index


Use this index to pick the smallest reference file that matches the task.

## Domain Guides

| Domain | File | Use For |
|---|---|---|
| Installation & imports | `references/installation.md` | CDN vs npm, all CSS/JS imports, stylesheet order, JS lifecycle, pre-1.0 compat |
| Theming | `references/theming.md` | Style packs (Vega/Nova/Maia/Lyra/Mira/Luma/Sera/Rhea), theme tokens, TweakCN, fonts, icons, custom style packs |
| Templates (Nunjucks/Jinja) | `references/templates.md` | Macro install, full prop reference for all 11 macros |
| JavaScript API & lifecycle | `references/javascript.md` | `window.basecoat` API, per-component controllers, `initAll()`, framework integration |
| Accessibility | `references/accessibility.md` | ARIA, keyboard nav, focus management, RTL, reduced motion, a11y patterns |

## Component Files

All component files live in `references/components/`.

| Component | File | JS Required |
|---|---|---|
| Accordion | `references/components/accordion.md` | Optional (single-open enforcement) |
| Alert | `references/components/alert.md` | No |
| Alert Dialog | `references/components/alert-dialog.md` | No (native `<dialog>`) |
| Avatar | `references/components/avatar.md` | No |
| Badge | `references/components/badge.md` | No |
| Breadcrumb | `references/components/breadcrumb.md` | No |
| Button | `references/components/button.md` | No |
| Button Group | `references/components/button-group.md` | No |
| Card | `references/components/card.md` | No |
| Chart (Beta) | `references/components/chart.md` | Yes (Chart.js + basecoat-css/chart) |
| Checkbox | `references/components/checkbox.md` | No |
| Combobox | `references/components/combobox.md` | Yes (`basecoat-css/combobox`) |
| Command | `references/components/command.md` | Yes (`basecoat-css/command`) |
| Dialog | `references/components/dialog.md` | No (native `<dialog>`) |
| Drawer (Beta) | `references/components/drawer.md` | Yes (`basecoat-css/drawer`) |
| Dropdown Menu | `references/components/dropdown-menu.md` | Yes (`basecoat-css/dropdown-menu`) |
| Empty | `references/components/empty.md` | No |
| Field | `references/components/field.md` | No |
| Input | `references/components/input.md` | No |
| Input Group | `references/components/input-group.md` | No |
| Item | `references/components/item.md` | No |
| Kbd | `references/components/kbd.md` | No |
| Label | `references/components/label.md` | No |
| Native Select | `references/components/native-select.md` | No |
| Pagination | `references/components/pagination.md` | No (uses Button) |
| Popover | `references/components/popover.md` | Yes (`basecoat-css/popover`) |
| Progress | `references/components/progress.md` | No |
| Radio Group | `references/components/radio-group.md` | No |
| Scroll Area | `references/components/scroll-area.md` | No |
| Select | `references/components/select.md` | Yes (`basecoat-css/select`) |
| Sidebar | `references/components/sidebar.md` | Yes (`basecoat-css/sidebar`) |
| Skeleton | `references/components/skeleton.md` | No |
| Slider | `references/components/slider.md` | Yes (`basecoat-css/range`) |
| Spinner | `references/components/spinner.md` | No (pure HTML) |
| Switch | `references/components/switch.md` | No |
| Table | `references/components/table.md` | No |
| Tabs | `references/components/tabs.md` | Yes (`basecoat-css/tabs`) |
| Textarea | `references/components/textarea.md` | No |
| Theme Switcher | `references/components/theme-switcher.md` | Yes (`basecoat-css/basecoat` runtime) |
| Toast | `references/components/toast.md` | Yes (`basecoat-css/toast`) |
| Tooltip | `references/components/tooltip.md` | No |

## Common Task Routing

### Setup and configuration

- Choosing CDN vs npm, picking which CSS/JS files to import → `references/installation.md`
- Switching style packs (Vega → Sera, etc.), adding dark mode, overriding theme tokens → `references/theming.md`
- Customizing colors, fonts, or writing a custom style pack from scratch → `references/theming.md`
- Using Nunjucks/Jinja macros (combobox, dialog, sidebar, tabs, toaster, etc.) → `references/templates.md`
- Calling the JS API, opening/closing a dialog from JS, showing a toast, re-initializing after dynamic HTML → `references/javascript.md`
- Integrating with HTMX, Turbo, Alpine, or any framework that swaps HTML → `references/javascript.md`

### Building UI

- Building a specific component (button, card, dialog, dropdown, etc.) → `references/components/{name}.md`
- Looking up exact `data-variant` / `data-size` values or allowed HTML structure → `references/components/{name}.md`
- Deciding which Basecoat component to use for a UI requirement → this index, then the component file

### Accessibility

- ARIA roles, keyboard navigation, focus management, RTL support, reduced motion → `references/accessibility.md`
- A11y for a specific component → `references/components/{name}.md` (Accessibility section)

### Debugging

- Component isn't working → check the component file's HTML structure and gotchas
- Missing JS behavior → `references/javascript.md` and `references/installation.md`
- Wrong import order or missing import → `references/installation.md`
- Styles not applying → check the stylesheet order in `references/installation.md`

## Quick Patterns

| Pattern | Components |
|---|---|
| Form field | [Field](./components/field.md) + [Input](./components/input.md) / [Textarea](./components/textarea.md) / [Native Select](./components/native-select.md) / [Checkbox](./components/checkbox.md) / [Radio Group](./components/radio-group.md) / [Switch](./components/switch.md) |
| Modal dialog | [Dialog](./components/dialog.md) (with optional close) or [Alert Dialog](./components/alert-dialog.md) (no close, explicit choice) |
| Side panel | [Drawer](./components/drawer.md) (slide-over) or [Sheet](#) (not in Basecoat) |
| Navigation | [Sidebar](./components/sidebar.md) (app-level) or [Tabs](./components/tabs.md) (content) |
| Page header | [Breadcrumb](./components/breadcrumb.md) + [Heading](#) (not in Basecoat) |
| Data display | [Card](./components/card.md) + [Table](./components/table.md) |
| Status | [Alert](./components/alert.md) (inline) or [Toast](./components/toast.md) (transient) |
| User identity | [Avatar](./components/avatar.md) + [Badge](./components/badge.md) |
| List rows | [Item](./components/item.md) |
| Empty state | [Empty](./components/empty.md) |
| Loading | [Skeleton](./components/skeleton.md) (placeholder) or [Spinner](./components/spinner.md) (active) or [Progress](./components/progress.md) (determinate) |
| Tooltip | [Tooltip](./components/tooltip.md) (text-only) or [Popover](./components/popover.md) (rich content) |
| Menu | [Dropdown Menu](./components/dropdown-menu.md) (actions) or [Context Menu](#) (not in Basecoat) |
| Selection | [Select](./components/select.md) (custom) or [Native Select](./components/native-select.md) (native) or [Combobox](./components/combobox.md) (searchable) |

## Suggested Reading Order

1. Start with this file.
2. Read `references/installation.md` for setup.
3. Read `references/theming.md` if you need to customize colors, fonts, or switch style packs.
4. Read `references/accessibility.md` for cross-cutting a11y patterns.
5. Read the specific component file for the component you're building.
6. Read `references/javascript.md` if you need programmatic control.
7. Read `references/templates.md` if you're using Nunjucks or Jinja.

## File Counts

- 1 `SKILL.md` (main entry)
- 5 domain references (installation, theming, templates, javascript, accessibility)
- 1 `REFERENCE.md` (this file)
- 41 component files
- **Total: 48 files**
