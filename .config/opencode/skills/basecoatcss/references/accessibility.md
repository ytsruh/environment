---
description: Accessibility patterns for Basecoat — ARIA roles, keyboard navigation, focus management, RTL support, reduced motion, and screen reader notes.
globs: "*.{html,css,js,njk,jinja}"
---

# Accessibility


Basecoat components follow accessibility best practices and use native HTML elements where possible. This document covers the cross-cutting patterns; per-component notes are in each component file.

## Contents

- [General principles](#general-principles)
- [ARIA roles reference](#aria-roles-reference)
- [Keyboard navigation reference](#keyboard-navigation-reference)
- [Focus management](#focus-management)
- [Labels and accessible names](#labels-and-accessible-names)
- [RTL (right-to-left) support](#rtl-right-to-left-support)
- [Reduced motion](#reduced-motion)
- [Screen reader notes](#screen-reader-notes)
- [Color contrast](#color-contrast)
- [Forms](#forms)
- [Common a11y mistakes to avoid](#common-a11y-mistakes-to-avoid)

## General principles

1. **Use native elements.** Basecoat relies on native `<button>`, `<input>`, `<select>`, `<details>`, `<dialog>`, `<table>`, etc. Don't replace them with `<div role="button">` unless the native element is genuinely impossible.
2. **Always provide an accessible name.** Icon-only buttons need `aria-label`. Form controls need `<label>` or `aria-label`. Decorative icons need `aria-hidden="true"`.
3. **Manage focus explicitly for non-modal popovers.** Native `<dialog>` handles focus trapping for you. Custom popovers (dropdown menu, popover, select, combobox) do not — manage focus yourself or follow the patterns in the component file.
4. **Set `lang` on `<html>`.** Required for screen readers to pick the correct pronunciation.
5. **Test with keyboard only.** Every interactive component must be reachable and operable with `Tab`, arrow keys, `Enter`, and `Escape`.

## ARIA roles reference

Basecoat components use the following ARIA roles. They are mostly set on the markup, so you do not need to add them yourself.

| Component | Roles used |
|---|---|
| Button | (native `<button>`) |
| Dropdown Menu | `menu`, `menuitem`, `menuitemcheckbox`, `menuitemradio`, `group`, `heading`, `separator` |
| Select / Combobox | `combobox`, `listbox`, `option`, `optiongroup` |
| Popover | `dialog` (when modal-like) or no role (when informational) |
| Dialog | (native `<dialog>` with `aria-labelledby`, `aria-describedby`) |
| Alert Dialog | (native `<dialog>` with `aria-labelledby`, `aria-describedby`, `role="alertdialog"` via ARIA) |
| Tabs | `tablist`, `tab`, `tabpanel` |
| Radio Group | `radiogroup`, `radio` |
| Switch | `switch` (native checkbox + role override) |
| Slider | `slider` (native `<input type="range">`) |
| Progress | `progressbar` (native `<progress>`) |
| Toast | `status` (default), `alert` (error) |
| Tooltip | `tooltip` (set automatically by the script) |
| Sidebar | `navigation`, `group` |
| Breadcrumb | `navigation` (with `aria-label="Breadcrumb"`) |
| Table | `table`, `rowgroup`, `row`, `columnheader`, `rowheader`, `cell` |
| Pagination | `navigation` (with `aria-label="Pagination"`) |
| Command | `dialog` (when in dialog), `combobox`, `listbox` |
| Field | (no role — `<div>` grouping `<label>` + control + helper text) |

## Keyboard navigation reference

| Component | Keys |
|---|---|
| Button | `Enter`, `Space` (native) |
| Dropdown Menu (closed) | `Enter`, `Space`, `↓` (open and focus first item) |
| Dropdown Menu (open) | `↑` / `↓` (move), `Home` / `End` (first/last), `Enter` / `Space` (activate), `Esc` (close) |
| Select (closed) | `Enter`, `Space`, `↓` (open) |
| Select (open) | `↑` / `↓` (move), `Home` / `End`, `Enter` (select + close), `Esc` (close) |
| Combobox (closed) | `Enter` (open if not typing), `↓` (open + focus first match) |
| Combobox (open) | `↑` / `↓` (move), `Enter` (select), `Esc` (close), type-to-filter |
| Popover | `Esc` (close). Trigger button follows normal button keys. |
| Dialog | `Esc` (close), `Tab` cycles focus inside dialog (native) |
| Tabs | `←` / `→` (move between tabs), `Home` / `End` (first/last), `Enter` / `Space` (activate) |
| Radio Group | `←` / `→` / `↑` / `↓` (move), `Space` (select) |
| Switch | `Space`, `Enter` (toggle) |
| Slider | `←` / `→` / `↑` / `↓` (small step), `Home` / `End` (min/max), `Page Up` / `Page Down` (large step) |
| Toast | (no keys by default — announce via `aria-live`) |
| Tooltip | (no keys — appears on focus/hover) |
| Pagination | `Enter` / `Space` on links (native) |
| Command | `↑` / `↓` (move), `Enter` (activate), `Esc` (close) |
| Sidebar | `Tab` to enter, `Esc` to close (mobile) |

## Focus management

### What Basecoat handles for you

- **Dialog** — Native `<dialog>` traps focus, returns focus to the trigger on close, makes the rest of the page inert. You do not need to do anything.
- **Tabs** — Roving tabindex; only the active tab is in the tab order. Arrow keys move between tabs.
- **Dropdown Menu / Popover / Select / Combobox** — Open via `Enter`/`Space`/`↓` on the trigger; focus moves to the first item; `Tab` is intercepted (or moves to the next focusable element, depending on the component); `Esc` closes and returns focus to the trigger.

### What you must handle

- **Custom focus restoration** — If you open a popover from a non-standard trigger (e.g., a table row), you may need to restore focus manually when the popover closes.
- **Skip links** — Add a "skip to main content" link as the first focusable element on the page.
- **Initial focus** — Avoid `autofocus` on modal triggers that are not yet visible. The native `<dialog>` handles this correctly via `showModal()`. For popovers, the script focuses the first item.

## Labels and accessible names

### Form controls

Always pair a form control with a `<label>` (the recommended pattern):

```html
<div class="field">
  <label class="label" for="email">Email</label>
  <input class="input" type="email" id="email" name="email" />
  <p class="text-sm text-muted-foreground">We'll never share your email.</p>
</div>
```

When a visible label is not appropriate, use `aria-label`:

```html
<input class="input" type="search" aria-label="Search" placeholder="Search..." />
```

For fieldsets of related controls (radio group, checkbox group), use `<fieldset>` and `<legend>`:

```html
<fieldset class="fieldset">
  <legend>Notification preferences</legend>
  <div role="group" aria-label="Notification preferences">
    <div role="menuitemcheckbox" aria-checked="true">...</div>
  </div>
</fieldset>
```

### Icon-only buttons

Always include `aria-label`:

```html
<button type="button" class="btn" data-variant="ghost" data-size="icon-sm" aria-label="Close">
  <svg class="lucide lucide-x" ...>...</svg>
</button>
```

### Decorative icons

Hide them from screen readers:

```html
<svg aria-hidden="true" class="lucide lucide-mail" ...>...</svg>
```

### Required fields

Mark with `aria-required` and a visual indicator:

```html
<label class="label" for="name">
  Name <span aria-hidden="true">*</span>
</label>
<input class="input" id="name" name="name" required aria-required="true" />
```

## RTL (right-to-left) support

All Basecoat components support RTL. To enable it, set `dir="rtl"` on the component root or any ancestor:

```html
<html lang="ar" dir="rtl">
  ...
</html>
```

Or per-component:

```html
<div dir="rtl" class="dialog">...</div>
```

### Logical properties

Basecoat uses CSS logical properties throughout, so margins, padding, borders, and positioning all flip automatically. For data attributes that take a side, prefer the logical values:

| Physical | Logical |
|---|---|
| `data-side="left"` | `data-side="inline-start"` |
| `data-side="right"` | `data-side="inline-end"` |
| `data-side="top"` | `data-side="block-start"` (or keep `top`) |
| `data-side="bottom"` | `data-side="block-end"` (or keep `bottom`) |
| `data-align="start"` | (same — `start` is logical) |
| `data-align="end"` | (same — `end` is logical) |

### Directional icons

When an icon implies direction (arrow, chevron, hand), flip it explicitly in RTL using `rtl:rotate-180` or a transform:

```html
<svg class="lucide lucide-arrow-right rtl:rotate-180" ...>...</svg>
```

## Reduced motion

Basecoat respects `prefers-reduced-motion: reduce`. Transitions and animations are reduced or removed when the user has this preference set.

If you add custom transitions, gate them behind a media query:

```css
@media (prefers-reduced-motion: no-preference) {
  .my-component {
    transition: transform 200ms ease;
  }
}
```

Spinners and progress bars that are inherently motion-based should keep animating — they communicate state, not decoration. Decorative motion (background gradients, hover transforms) should be reduced.

## Screen reader notes

### Live regions

- **Toasts** use `role="status"` (default) or `role="alert"` (for `error` category). They are announced automatically when added to the DOM.
- **Inline validation errors** should use `aria-live="polite"` or `aria-describedby` on the input pointing to the error message.

```html
<input class="input" id="email" aria-invalid="true" aria-describedby="email-error" />
<p id="email-error" class="text-sm text-destructive">Please enter a valid email.</p>
```

### Hidden content

- **Visually hidden but readable to screen readers** — use the `.sr-only` utility:

  ```html
  <label class="label sr-only" for="search">Search</label>
  <input class="input" id="search" type="search" />
  ```

- **Hidden from screen readers** — use `aria-hidden="true"` on purely decorative elements (icons, dividers, etc.).

### Tables

Use proper table semantics. Don't use tables for layout. For sortable tables, add `aria-sort` on the `<th>`:

```html
<th aria-sort="ascending">Name</th>
<th aria-sort="none">Email</th>
```

## Color contrast

Basecoat's default style packs target WCAG AA contrast for text and interactive elements. The `--muted-foreground` token is the lowest-contrast token and is reserved for non-essential text (placeholders, helper text). Do not use it for body copy.

If you override theme tokens, check contrast:

- Body text: minimum 4.5:1 against background
- Large text (18pt or 14pt bold): minimum 3:1
- Interactive element focus rings: minimum 3:1 against adjacent background

Tools: [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/), Stark, Polypane, axe DevTools.

## Forms

Use the `.field` component to wrap a label, control, and helper text or error message. It is documented in `components/field.md`. The structure provides consistent spacing, error state styling, and association between the label and the error message.

```html
<div class="field">
  <label class="label" for="email">Email</label>
  <input class="input" type="email" id="email" name="email" />
  <p class="text-sm text-muted-foreground">Helper text</p>
</div>
```

For errors, add `data-invalid` on the `.field` and `aria-invalid` on the input:

```html
<div class="field" data-invalid>
  <label class="label" for="email">Email</label>
  <input class="input" type="email" id="email" name="email" aria-invalid="true" aria-describedby="email-error" />
  <p id="email-error" class="text-sm text-destructive">Error message</p>
</div>
```

## Common a11y mistakes to avoid

1. **Using a `<div>` as a button.** Use `<button>` (or `<a>` for navigation). Basecoat styles both, but native semantics include focus, keyboard handling, and form participation.
2. **Missing `aria-label` on icon-only buttons.** Screen readers will announce "button" with no name.
3. **Replacing `<select>` with a custom dropdown** for accessibility. Native `<select>` is the most accessible option on mobile and is what users expect. Use Basecoat's `<select>` (`.select`) only when you need styling or rich option content; use `.native-select` when you want a styled native element.
4. **Forgetting `aria-expanded` on disclosure triggers.** Basecoat sets this automatically; do not remove it.
5. **Forgetting `aria-controls`** to associate a trigger with the element it opens. Basecoat sets this automatically when the trigger and popover are siblings; verify with dev tools.
6. **Wrapping everything in a `<form>`** to enable form submission. Forms should contain only related inputs.
7. **Disabling focus rings** via `outline: none` without providing a replacement. The `--ring` token powers focus rings; style them, don't remove them.
8. **Using `role="presentation"` on a table** to "fix" accessibility warnings. The fix is to use proper table semantics, not to mark a table as presentational.
9. **Color-only state indication.** Use icons, text, or shape alongside color. E.g., a red border alone is not accessible; pair with an error message and an icon.
10. **Modal scroll lock without focus trap.** Native `<dialog>` traps focus for you; do not implement a custom modal.
