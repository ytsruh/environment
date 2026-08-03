# Card


A container for related content with a header, body, and optional footer. Cards are versatile building blocks for dashboards, listings, settings, and more.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.card`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/card";
@import "basecoat-css/styles/vega";
```

## Sizes

| Size | Markup | Description |
|---|---|---|
| Default | `<div class="card">` | Standard spacing. |
| Small | `<div class="card" data-size="sm">` | Compact spacing. |

## Data attributes

| Attribute | Values | Description |
|---|---|---|
| `data-size` | `"sm"` | Smaller size variant. |

## HTML structure

```html
<div class="card">
  <header>
    <h2>Title</h2>
    <p>Description</p>
    <div class="card-action">Action</div>
  </header>
  <section>Body content.</section>
  <footer>Footer content.</footer>
</div>
```

- `<div class="card">` — root container
- `<header>` — optional card header
- `<h2>` / `<h3>` — card title
- `<p>` — card description
- `<div class="card-action">` or `<menu class="card-action">` — top-right action / metadata
- `<section>` — main body
- `<footer>` — footer actions or secondary content

## Examples

### Basic

```html
<div class="card">
  <header>
    <h2>Login to your account</h2>
    <p>Enter your email below to login to your account</p>
    <div class="card-action">
      <button type="button" class="btn" data-variant="link">Sign Up</button>
    </div>
  </header>
  <section>
    <form class="grid gap-6">
      <div class="grid gap-2">
        <label class="label" for="email">Email</label>
        <input class="input" type="email" id="email" required />
      </div>
      <div class="grid gap-2">
        <label class="label" for="password">Password</label>
        <input class="input" type="password" id="password" required />
      </div>
    </form>
  </section>
  <footer class="flex-col gap-2">
    <button type="button" class="btn w-full">Login</button>
    <button type="button" class="btn w-full" data-variant="outline">Login with Google</button>
  </footer>
</div>
```

### Small size

```html
<div class="card" data-size="sm">
  <header>
    <h2>Small Card</h2>
    <p>This card uses the small size variant.</p>
    <div class="card-action">
      <button type="button" class="btn" data-size="sm" data-variant="outline">Action</button>
    </div>
  </header>
  <section><p>The card component supports a size attribute that can be set to <code>sm</code>.</p></section>
</div>
```

### With image

Add an `<img>` directly before the header. The image spans the top of the card.

```html
<div class="card">
  <img alt="Event cover" class="aspect-video w-full object-cover" src="..." />
  <header>
    <h2>Design systems meetup</h2>
    <p>A practical talk on component APIs, accessibility, and shipping faster.</p>
    <div class="card-action">
      <span class="badge" data-variant="secondary">Featured</span>
    </div>
  </header>
  <footer>
    <button type="button" class="btn w-full">View Event</button>
  </footer>
</div>
```

### Card with multiple actions in the header

Use a `<menu>` element when there are multiple commands (a list of actions):

```html
<div class="card">
  <header>
    <h2>Title</h2>
    <menu class="card-action">
      <button type="button" class="btn" data-size="sm" data-variant="outline">Edit</button>
      <button type="button" class="btn" data-size="sm" data-variant="destructive">Delete</button>
    </menu>
  </header>
  <section>Body content.</section>
</div>
```

### RTL

```html
<div class="card" dir="rtl">
  <header>
    <h2>تسجيل الدخول إلى حسابك</h2>
    <p>أدخل بريدك الإلكتروني أدناه لتسجيل الدخول إلى حسابك</p>
    <div class="card-action">
      <button type="button" class="btn" data-variant="link">إنشاء حساب</button>
    </div>
  </header>
  <section>
    <form class="grid gap-6">
      <div class="grid gap-2">
        <label class="label" for="email-rtl">البريد الإلكتروني</label>
        <input class="input" type="email" id="email-rtl" required />
      </div>
    </form>
  </section>
  <footer class="flex-col gap-2">
    <button type="button" class="btn w-full">تسجيل الدخول</button>
  </footer>
</div>
```

## Accessibility

- Use a heading element (`<h2>`, `<h3>`) inside `<header>` that matches the card's role in the document outline.
- For a card that links to a page, wrap the entire card or use a "card link" pattern with a stretched link. Don't put a `<button>` inside an `<a>`.
- For cards with action buttons, each button needs an accessible name. Icon-only buttons need `aria-label`.
- Cards are not interactive by default. Add `role="article"`, `role="region"`, or a custom role only if the card represents a discrete entity in your UI.
- The `card-action` slot is styled to align content to the inline end. Mark decorative content `aria-hidden="true"` if needed.

## Gotchas

- The image slot is a direct child `<img>` element. Don't wrap it in a `<figure>` (the card handles the styling).
- `card-action` is not a generic utility — it positions content at the top-right of the header. Use `<div class="card-action">` or `<menu class="card-action">`.
- The default heading is `<h2>`. Adjust to match your document outline.
- For a card that should not be padded, override the inner padding with utility classes (e.g., `p-0`).
- For card grids, wrap multiple cards in a grid layout container.
