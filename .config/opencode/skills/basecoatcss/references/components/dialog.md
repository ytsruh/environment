# Dialog


A modal dialog built on the native `<dialog>` element. Opens with `showModal()`, closes with `close()` or `<form method="dialog">`. Use for tasks that require user focus and block the rest of the page.

## Overview

- **CSS-only:** yes (uses native `HTMLDialogElement`)
- **JS module:** none
- **Root class:** `.dialog` (applied to a native `<dialog>`)
- **Native element:** `<dialog>`
- **Template macro:** `dialog()` for Nunjucks/Jinja — see `references/templates.md`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/dialog";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<button type="button" onclick="document.getElementById('my-dialog').showModal()" class="btn" data-variant="outline">Open</button>

<dialog id="my-dialog" class="dialog" aria-labelledby="my-dialog-title" aria-describedby="my-dialog-desc" onclick="if (event.target === this) this.close()">
  <div class="sm:max-w-sm">
    <header>
      <h2 id="my-dialog-title">Edit profile</h2>
      <p id="my-dialog-desc">Make changes to your profile here.</p>
    </header>
    <section>Body content.</section>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" onclick="this.closest('dialog').close()">Save</button>
    </footer>
    <button type="button" class="btn" data-variant="ghost" data-size="icon-sm" aria-label="Close dialog" onclick="this.closest('dialog').close()">
      <svg aria-hidden="true"><!-- X icon --></svg>
    </button>
  </div>
</dialog>
```

- Trigger button (optional) — typically a separate element that calls `showModal()`
- `<dialog class="dialog">` — the native modal
- `<div>` — content surface (width utilities go here for custom sizes)
- `<header>` — header with title and optional description
- `<h2 id="...">` — title (reference via `aria-labelledby`)
- `<p id="...">` — description (reference via `aria-describedby`)
- `<section>` — body content (add overflow utilities for scroll)
- `<footer>` — action area (stacks on small screens, aligns end on larger)
- `<button>` — close button (top-right corner by default)
- `<form method="dialog">` — alternative close pattern (any button inside submits the form and closes the dialog)

## Examples

### Basic

```html
<button type="button" onclick="document.getElementById('basic-dialog').showModal()" class="btn" data-variant="outline">Open Dialog</button>
<dialog id="basic-dialog" class="dialog" aria-labelledby="basic-dialog-title" aria-describedby="basic-dialog-desc" onclick="if (event.target === this) this.close()">
  <div class="sm:max-w-sm">
    <header>
      <h2 id="basic-dialog-title">Edit profile</h2>
      <p id="basic-dialog-desc">Make changes to your profile here. Click save when you're done.</p>
    </header>
    <section>
      <form class="grid gap-4">
        <div class="grid gap-3">
          <label class="label" for="basic-name">Name</label>
          <input class="input" type="text" value="Pedro Duarte" id="basic-name" autofocus />
        </div>
        <div class="grid gap-3">
          <label class="label" for="basic-username">Username</label>
          <input class="input" type="text" value="@peduarte" id="basic-username" />
        </div>
      </form>
    </section>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
      <button class="btn" onclick="this.closest('dialog').close()">Save changes</button>
    </footer>
  </div>
</dialog>
```

### Custom close button

```html
<dialog id="custom-close" class="dialog" aria-labelledby="custom-close-title" aria-describedby="custom-close-desc" onclick="if (event.target === this) this.close()">
  <div class="sm:max-w-md">
    <header>
      <h2 id="custom-close-title">Share link</h2>
      <p id="custom-close-desc">Anyone who has this link will be able to view this.</p>
    </header>
    <section class="flex items-center gap-2">
      <div class="grid flex-1 gap-2">
        <label class="label sr-only" for="custom-close-link">Link</label>
        <input class="input" id="custom-close-link" value="https://basecoatui.com/installation/" readonly />
      </div>
    </section>
    <footer class="sm:justify-start">
      <button class="btn" onclick="this.closest('dialog').close()">Close</button>
    </footer>
  </div>
</dialog>
```

### No close button

```html
<dialog id="no-close" class="dialog" aria-labelledby="no-close-title" aria-describedby="no-close-desc" onclick="if (event.target === this) this.close()">
  <div>
    <header>
      <h2 id="no-close-title">No Close Button</h2>
      <p id="no-close-desc">This dialog doesn't have a close button in the top-right corner.</p>
    </header>
  </div>
</dialog>
```

### Sticky footer

```html
<dialog id="sticky-footer" class="dialog" aria-labelledby="sticky-footer-title" aria-describedby="sticky-footer-desc" onclick="if (event.target === this) this.close()">
  <div>
    <header>
      <h2 id="sticky-footer-title">Sticky Footer</h2>
      <p id="sticky-footer-desc">This dialog has a sticky footer.</p>
    </header>
    <section class="-mx-4 max-h-[50vh] overflow-y-auto px-4 scrollbar">
      <p>Long content...</p>
    </section>
    <footer>
      <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Close</button>
    </footer>
    <button type="button" class="btn" data-variant="ghost" data-size="icon-sm" aria-label="Close dialog" onclick="this.closest('dialog').close()">
      <svg aria-hidden="true"><!-- X --></svg>
    </button>
  </div>
</dialog>
```

### Scrollable content

```html
<dialog id="scrollable" class="dialog" aria-labelledby="scrollable-title" aria-describedby="scrollable-desc" onclick="if (event.target === this) this.close()">
  <div>
    <header>
      <h2 id="scrollable-title">Scrollable Content</h2>
      <p id="scrollable-desc">This is a dialog with scrollable content.</p>
    </header>
    <section class="-mx-4 max-h-[50vh] overflow-y-auto px-4 scrollbar">
      <p>Long content...</p>
    </section>
    <button type="button" class="btn" data-variant="ghost" data-size="icon-sm" aria-label="Close dialog" onclick="this.closest('dialog').close()">
      <svg aria-hidden="true"><!-- X --></svg>
    </button>
  </div>
</dialog>
```

### Open programmatically

```js
document.getElementById("my-dialog").showModal();
document.getElementById("my-dialog").close();

// Close with a return value
document.getElementById("my-dialog").close("save");
const returnValue = document.getElementById("my-dialog").returnValue;
```

### Listen for close events

```js
document.getElementById("my-dialog").addEventListener("close", (e) => {
  console.log("closed with:", e.target.returnValue);
});
```

### Submit via form

```html
<dialog id="form-dialog" class="dialog" aria-labelledby="form-dialog-title" onclick="if (event.target === this) this.close()">
  <form method="dialog">
    <header>
      <h2 id="form-dialog-title">Confirm</h2>
    </header>
    <section>
      <p>Submitting the form will close the dialog.</p>
    </section>
    <footer>
      <button type="submit" class="btn">Submit</button>
      <button type="button" class="btn" data-variant="outline" onclick="this.closest('dialog').close()">Cancel</button>
    </footer>
  </form>
</dialog>
```

### RTL

```html
<div dir="rtl">
  <button type="button" onclick="document.getElementById('dialog-rtl').showModal()" class="btn" data-variant="outline">فتح الحوار</button>
  <dialog id="dialog-rtl" class="dialog" aria-labelledby="dialog-rtl-title" aria-describedby="dialog-rtl-desc" onclick="if (event.target === this) this.close()">
    <div class="sm:max-w-sm">
      <header>
        <h2 id="dialog-rtl-title">تعديل الملف الشخصي</h2>
        <p id="dialog-rtl-desc">قم بإجراء تغييرات على ملفك الشخصي هنا.</p>
      </header>
      <section>
        <form class="grid gap-4">
          <div class="grid gap-3">
            <label class="label" for="dialog-rtl-name">الاسم</label>
            <input class="input" id="dialog-rtl-name" name="name" value="Pedro Duarte" />
          </div>
        </form>
      </section>
      <footer>
        <button class="btn" data-variant="outline" onclick="this.closest('dialog').close()">إلغاء</button>
        <button class="btn" onclick="this.closest('dialog').close()">حفظ التغييرات</button>
      </footer>
    </div>
  </dialog>
</div>
```

## Accessibility

- Always set `aria-labelledby` (pointing to the title) and `aria-describedby` (pointing to the description) when present.
- The native `<dialog>` traps focus, returns focus to the trigger on close, and makes the rest of the page inert.
- `Esc` closes the dialog (native behavior).
- Backdrop-click close is added via the `onclick="if (event.target === this) this.close()"` attribute on the dialog. Remove this if you want to force an explicit close action (see [Alert Dialog](./alert-dialog.md)).
- For icon-only close buttons, use `aria-label="Close dialog"`.
- For destructive confirmations, use [Alert Dialog](./alert-dialog.md) instead, which intentionally omits the close button.

## Gotchas

- The dialog must be a native `<dialog>` element. Do not use `<div role="dialog">` — the native element handles focus, inert, and `Esc` automatically.
- Add `onclick="if (event.target === this) this.close()"` to the dialog for backdrop-click close. The `event.target === this` check ensures clicks inside the dialog content don't trigger close.
- Width utilities (`sm:max-w-sm`, `md:max-w-md`, etc.) go on the inner `<div>`, not the `<dialog>` itself.
- For form submission, use `<form method="dialog">` — any submit button inside will close the dialog.
- The native `<dialog>` cannot be portaled. It renders where it's declared in the DOM.
- `showModal()` (modal) vs `show()` (non-modal) — use `showModal()` for true dialogs. `show()` is for non-modal notifications.
- For an alert dialog (where the user must make an explicit choice), use `<dialog class="alert-dialog">` instead and omit the close button and backdrop-click handler.
