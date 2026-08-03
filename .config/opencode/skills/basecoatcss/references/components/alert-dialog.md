# Alert Dialog


A modal dialog that interrupts the user with important content and expects a response. Built on the native `<dialog>` element. Unlike [Dialog](./dialog.md), an alert dialog should not have a close button or backdrop-click close — the user must make an explicit choice.

## Overview

- **CSS-only:** yes (uses native `HTMLDialogElement`)
- **JS module:** none
- **Root class:** `.alert-dialog` (applied to a native `<dialog>`)
- **Native element:** `<dialog>`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/dialog";  /* Alert Dialog uses Dialog CSS */
@import "basecoat-css/styles/vega";
```

## Variants

| Size | Markup | Description |
|---|---|---|
| Default | `<dialog class="alert-dialog">` | Standard width. |
| Small | `<dialog class="alert-dialog" data-size="sm">` | Compact width with a two-column footer. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-size` | `"sm"` | Small variant. |

## HTML structure

```html
<button type="button" onclick="document.getElementById('confirm').showModal()" class="btn">Show</button>

<dialog id="confirm" class="alert-dialog" aria-labelledby="confirm-title" aria-describedby="confirm-desc">
  <div>
    <header>
      <figure><!-- optional icon --></figure>
      <h2 id="confirm-title">Are you absolutely sure?</h2>
      <p id="confirm-desc">This action cannot be undone.</p>
    </header>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" data-variant="destructive" onclick="this.closest('dialog').close()">Delete</button>
    </footer>
  </div>
</dialog>
```

- Trigger button (optional) — typically a separate element that calls `showModal()`
- `<dialog class="alert-dialog">` — the native modal
- `<div>` — content surface
- `<header>` — header with optional `<figure>` icon, title, description
- `<figure>` — media area for icon or image
- `<h2>` — title (reference via `aria-labelledby`)
- `<p>` — description (reference via `aria-describedby`)
- `<footer>` — actions; include a cancel and a primary action

## Examples

### Basic

```html
<button type="button" onclick="document.getElementById('alert-basic').showModal()" class="btn" data-variant="outline">Show Dialog</button>
<dialog id="alert-basic" class="alert-dialog" aria-labelledby="alert-basic-title" aria-describedby="alert-basic-desc">
  <div>
    <header>
      <h2 id="alert-basic-title">Are you absolutely sure?</h2>
      <p id="alert-basic-desc">This action cannot be undone. This will permanently delete your account.</p>
    </header>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" onclick="this.closest('dialog').close()">Continue</button>
    </footer>
  </div>
</dialog>
```

### With icon

```html
<dialog id="alert-media" class="alert-dialog" aria-labelledby="alert-media-title" aria-describedby="alert-media-desc">
  <div>
    <header>
      <figure><svg class="lucide lucide-circle-fading-plus" ...></svg></figure>
      <h2 id="alert-media-title">Share this project?</h2>
      <p id="alert-media-desc">Anyone with the link will be able to view and edit this project.</p>
    </header>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" onclick="this.closest('dialog').close()">Share</button>
    </footer>
  </div>
</dialog>
```

### Destructive

```html
<dialog id="alert-destructive" class="alert-dialog" aria-labelledby="alert-destructive-title" aria-describedby="alert-destructive-desc">
  <div>
    <header>
      <figure><svg class="lucide lucide-trash-2" ...></svg></figure>
      <h2 id="alert-destructive-title">Delete this chat?</h2>
      <p id="alert-destructive-desc">This action cannot be undone. This will permanently delete the chat.</p>
    </header>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" data-variant="destructive" onclick="this.closest('dialog').close()">Delete</button>
    </footer>
  </div>
</dialog>
```

### Small size

```html
<dialog id="alert-small" class="alert-dialog" data-size="sm" aria-labelledby="alert-small-title" aria-describedby="alert-small-desc">
  <div>
    <header>
      <figure><svg class="lucide lucide-users" ...></svg></figure>
      <h2 id="alert-small-title">Invite team members?</h2>
      <p id="alert-small-desc">Send an invitation link to your selected teammates.</p>
    </header>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" onclick="this.closest('dialog').close()">Invite</button>
    </footer>
  </div>
</dialog>
```

### RTL

```html
<div dir="rtl">
  <dialog id="alert-rtl" class="alert-dialog" aria-labelledby="alert-rtl-title" aria-describedby="alert-rtl-desc">
    <!-- ... -->
  </dialog>
</div>
```

## Accessibility

- Always set `aria-labelledby` (pointing to the title) and `aria-describedby` (pointing to the description).
- The native `<dialog>` traps focus, returns focus to the trigger on close, and makes the rest of the page inert.
- `Esc` closes the dialog (native behavior). For an alert dialog, you typically still want `Esc` to close it because users expect `Esc` to cancel.
- Do not include a close button (X) or backdrop-click close — the user must make an explicit choice. This is the key difference from [Dialog](./dialog.md).
- For a destructive action, prefer a destructive button variant on the primary action.

## Gotchas

- Alert Dialog uses the same CSS as [Dialog](./dialog.md) — import `dialog.css`, not a separate `alert-dialog.css`.
- Omit the `onclick="if (event.target === this) this.close()"` handler that you'd add to a regular Dialog. Backdrop close defeats the purpose of an alert dialog.
- Use `data-variant="destructive"` on the primary button when the action is destructive.
- For non-modal confirmations, use [Dropdown Menu](./dropdown-menu.md) or [Popover](./popover.md) with action buttons instead.
