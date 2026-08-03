# Item


A versatile content row. Use for display content, action rows, navigation rows, and grouped lists. Item is to display what [Field](./field.md) is to forms.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.item`
- **Native element:** `<article>` (default), `<a>` (for navigation)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/item";
@import "basecoat-css/components/button";
@import "basecoat-css/styles/vega";
```

Item composes Button styles when actions are rendered as buttons.

## Variants

| Variant | Markup | Description |
|---|---|---|
| Default | `<article class="item">` | Transparent background, no border. |
| Outline | `<article class="item" data-variant="outline">` | Visible border. |
| Muted | `<article class="item" data-variant="muted">` | Muted background. |

## Sizes

| Size | Markup | Description |
|---|---|---|
| Default | `<article class="item">` | Standard. |
| Small | `<article class="item" data-size="sm">` | Compact. |
| Extra small | `<article class="item" data-size="xs">` | Most compact. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-variant` | `"outline"`, `"muted"` | Visual variant. |
| `data-size` | `"sm"`, `"xs"` | Size. |

## HTML structure

```html
<article class="item" data-variant="outline">
  <figure><!-- optional icon, avatar, or image --></figure>
  <section>
    <h3>Title</h3>
    <p>Description</p>
  </section>
  <aside>
    <button class="btn" data-variant="outline" data-size="sm">Action</button>
  </aside>
</article>
```

- `<article class="item">` or `<a class="item">` — root
- `<figure>` — optional media (icon, avatar, or image)
- `<section>` — primary content (headings and paragraphs are styled automatically)
- `<h2>`, `<h3>`, `<h4>` — title
- `<p>` — description
- `<aside>` — actions or trailing metadata
- `<header>`, `<footer>` — full-width item regions
- `<div class="item-group" role="list">` — groups related items

## Item vs Field

- Use `.field` for form controls and validation.
- Use `.item` for display content, actions, and navigation rows.

## Examples

### Basic

```html
<article class="item" data-variant="outline">
  <section>
    <h3>Basic Item</h3>
    <p>A simple item with title and description.</p>
  </section>
  <aside>
    <button class="btn" data-variant="outline" data-size="sm">Action</button>
  </aside>
</article>
```

### Variants

```html
<article class="item">
  <figure><svg class="lucide lucide-inbox" ...></svg></figure>
  <section>
    <h3>Default Variant</h3>
    <p>Transparent background with no border.</p>
  </section>
</article>

<article class="item" data-variant="outline">
  <figure><svg class="lucide lucide-inbox" ...></svg></figure>
  <section>
    <h3>Outline Variant</h3>
    <p>Outlined style with a visible border.</p>
  </section>
</article>

<article class="item" data-variant="muted">
  <figure><svg class="lucide lucide-inbox" ...></svg></figure>
  <section>
    <h3>Muted Variant</h3>
    <p>Muted background for secondary content.</p>
  </section>
</article>
```

### Sizes

```html
<article class="item" data-variant="outline">
  <figure><svg class="lucide lucide-inbox" ...></svg></figure>
  <section><h3>Default Size</h3><p>Standard size for most use cases.</p></section>
</article>

<article class="item" data-variant="outline" data-size="sm">
  <figure><svg class="lucide lucide-inbox" ...></svg></figure>
  <section><h3>Small Size</h3><p>Compact size for dense layouts.</p></section>
</article>

<article class="item" data-variant="outline" data-size="xs">
  <figure><svg class="lucide lucide-inbox" ...></svg></figure>
  <section><h3>Extra Small Size</h3><p>The most compact size available.</p></section>
</article>
```

### With icon and action

```html
<article class="item" data-variant="outline">
  <figure><svg class="lucide lucide-shield-alert" ...></svg></figure>
  <section>
    <h3>Security Alert</h3>
    <p>New login detected from unknown device.</p>
  </section>
  <aside><button class="btn" data-variant="outline" data-size="sm">Review</button></aside>
</article>
```

### With avatar

```html
<article class="item" data-variant="outline">
  <figure>
    <span class="avatar" data-size="lg"><img src="https://github.com/evilrabbit.png" alt="Evil Rabbit" /></span>
  </figure>
  <section>
    <h3>Evil Rabbit</h3>
    <p>Last seen 5 months ago</p>
  </section>
  <aside>
    <button class="btn rounded-full" data-variant="outline" data-size="icon-sm" aria-label="Invite Evil Rabbit">
      <svg class="lucide lucide-plus" ...></svg>
    </button>
  </aside>
</article>
```

### With avatar group

```html
<article class="item" data-variant="outline">
  <figure>
    <span class="avatar-group">
      <span class="avatar hidden sm:flex"><img class="grayscale" src="..." alt="@shadcn" /></span>
      <span class="avatar hidden sm:flex"><img class="grayscale" src="..." alt="@maxleiter" /></span>
      <span class="avatar"><img class="grayscale" src="..." alt="@evilrabbit" /></span>
    </span>
  </figure>
  <section>
    <h3>No Team Members</h3>
    <p>Invite your team to collaborate on this project.</p>
  </section>
  <aside><button class="btn" data-variant="outline" data-size="sm">Invite</button></aside>
</article>
```

### As a link

```html
<a href="#" class="item" data-variant="outline" data-size="sm">
  <figure><svg class="lucide lucide-badge-check size-5" ...></svg></figure>
  <section><h3>Your profile has been verified.</h3></section>
  <aside><svg class="lucide lucide-chevron-right size-4" ...></svg></aside>
</a>
```

### With image header

```html
<div class="item-group grid grid-cols-1 gap-4 sm:grid-cols-3" role="list">
  <article class="item" data-variant="outline" role="listitem">
    <header><img class="aspect-square w-full rounded-sm object-cover grayscale" src="..." alt="v0-1.5-sm" /></header>
    <section><h3>v0-1.5-sm</h3><p>Everyday tasks and UI generation.</p></section>
  </article>
  <!-- more items... -->
</div>
```

### Grouped list

```html
<div class="item-group" role="list">
  <article class="item" role="listitem">
    <figure><span class="avatar"><img class="grayscale" src="..." alt="@shadcn" /></span></figure>
    <section><h3>shadcn</h3><p>shadcn@vercel.com</p></section>
    <aside>
      <button class="btn rounded-full" data-variant="ghost" data-size="icon" aria-label="Add shadcn">
        <svg class="lucide lucide-plus" ...></svg>
      </button>
    </aside>
  </article>
  <!-- more items... -->
</div>
```

### Inside a dropdown menu

```html
<div class="dropdown-menu">
  <button type="button" id="item-trigger" aria-haspopup="menu" aria-controls="item-menu" aria-expanded="false" class="btn" data-variant="outline">
    Select
    <svg class="lucide lucide-chevron-down" data-icon="inline-end" ...></svg>
  </button>
  <div data-popover aria-hidden="true" class="w-48">
    <div role="menu" id="item-menu" aria-labelledby="item-trigger">
      <button type="button" role="menuitem">
        <span class="item border-0 p-0 shadow-none" data-size="xs">
          <figure>
            <span class="avatar" data-size="sm">
              <img class="grayscale" src="..." alt="@shadcn" />
            </span>
          </figure>
          <section class="gap-0">
            <h3>shadcn</h3>
            <p class="leading-none" aria-label="shadcn@vercel.com">shadcn<span aria-hidden="true">@</span>vercel.com</p>
          </section>
        </span>
      </button>
    </div>
  </div>
</div>
```

### RTL

```html
<div dir="rtl" class="flex flex-col gap-6">
  <article class="item" data-variant="outline">
    <section>
      <h3>عنصر أساسي</h3>
      <p>عنصر بسيط يحتوي على عنوان ووصف.</p>
    </section>
    <aside>
      <button class="btn" data-variant="outline" data-size="sm">إجراء</button>
    </aside>
  </article>
</div>
```

## Accessibility

- Use `<article>` for non-interactive items and `<a>` for navigation items. Don't use `<div>`.
- When using `<a class="item">`, the link's text content (usually the title) is the accessible name. Don't add an `aria-label` unless you need to override the visible text.
- For grouped items, use `class="item-group" role="list"` and add `role="listitem"` to non-`<li>` children.
- Decorative icons should be `aria-hidden="true"`.
- For items with multiple actions, the action buttons need accessible names. Icon-only buttons need `aria-label`.
- For items inside a dropdown menu, wrap the item in a `<button role="menuitem">` so it's keyboard-focusable.

## Gotchas

- The default root is `<article>`. Use `<a class="item">` for navigation items.
- `data-variant` accepts `"outline"` or `"muted"`. The default is transparent (no border).
- For items inside a dropdown menu, use `class="item border-0 p-0 shadow-none"` to remove the default item styling (since the menu item provides the visual treatment).
- For images, use `figure` for the image and `header` for a full-width image at the top.
- The `item-group` class is for spacing and layout, not for accessibility. Add `role="list"` to the group and `role="listitem"` to children if they're not native `<li>`.
- For very small items (e.g., in a menu), use `data-size="xs"` and remove the figure/description to keep only the title.
