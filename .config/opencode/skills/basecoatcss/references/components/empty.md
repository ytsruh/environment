# Empty


An empty-state component for lists, tables, and search results. Use when there is no data to display, with optional media, a call to action, and a learn-more link.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.empty`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/empty";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<section class="empty">
  <header>
    <figure>
      <svg><!-- icon, image, or avatar group --></svg>
    </figure>
    <h3>Title</h3>
    <p>Description</p>
  </header>
  <footer>
    <div class="flex gap-2">
      <button class="btn">Primary Action</button>
      <button class="btn" data-variant="outline">Secondary Action</button>
    </div>
    <a href="#" class="btn" data-variant="link" data-size="sm">Learn more →</a>
  </footer>
</section>
```

- `<section class="empty">` — root
- `<header>` — groups media, title, and description
- `<figure>` — optional icon, avatar, image, or avatar group
- `<h2>` / `<h3>` / `<h4>` — title
- `<p>` — description
- `<section>` or `<footer>` — actions and supporting content

## Examples

### Basic

```html
<section class="empty">
  <header>
    <figure>
      <svg class="lucide lucide-folder-code" ...></svg>
    </figure>
    <h3>No Projects Yet</h3>
    <p>You haven't created any projects yet. Get started by creating your first project.</p>
  </header>
  <footer>
    <div class="flex gap-2">
      <button class="btn">Create Project</button>
      <button class="btn" data-variant="outline">Import Project</button>
    </div>
    <a href="#" class="btn text-muted-foreground" data-variant="link" data-size="sm">
      Learn More
      <svg class="lucide lucide-arrow-up-right" ...></svg>
    </a>
  </footer>
</section>
```

### Outlined (bordered)

```html
<section class="empty border border-dashed">
  <header>
    <figure>
      <svg class="lucide lucide-cloud" ...></svg>
    </figure>
    <h3>Cloud Storage Empty</h3>
    <p>Upload files to your cloud storage to access them anywhere.</p>
  </header>
  <footer>
    <button class="btn" data-variant="outline" data-size="sm">Upload Files</button>
  </footer>
</section>
```

### Background fill

```html
<section class="empty h-full bg-muted/30">
  <header>
    <figure>
      <svg class="lucide lucide-bell" ...></svg>
    </figure>
    <h3>No Notifications</h3>
    <p class="max-w-xs text-pretty">You're all caught up. New notifications will appear here.</p>
  </header>
  <footer>
    <button class="btn" data-variant="outline">
      <svg class="lucide lucide-refresh-ccw" ...></svg>
      Refresh
    </button>
  </footer>
</section>
```

### With avatar

```html
<section class="empty">
  <header>
    <figure class="size-12 rounded-full">
      <img class="grayscale" alt="@shadcn" src="https://github.com/shadcn.png" />
    </figure>
    <h3>User Offline</h3>
    <p>This user is currently offline. You can leave a message to notify them or try again later.</p>
  </header>
  <footer>
    <button class="btn" data-size="sm">Leave Message</button>
  </footer>
</section>
```

### With avatar group

```html
<section class="empty">
  <header>
    <figure class="-space-x-2 [&_img]:ring-background [&_img]:ring-2 [&_img]:grayscale [&_img]:size-12 [&_img]:rounded-full">
      <img alt="@shadcn" src="..." />
      <img alt="@maxleiter" src="..." />
      <img alt="@evilrabbit" src="..." />
    </figure>
    <h3>No Team Members</h3>
    <p>Invite your team to collaborate on this project.</p>
  </header>
  <footer>
    <button class="btn" data-size="sm">
      <svg class="lucide lucide-plus" ...></svg>
      <span>Invite Members</span>
    </button>
  </footer>
</section>
```

### With search input

```html
<section class="empty">
  <header>
    <h3>404 - Not Found</h3>
    <p>The page you're looking for doesn't exist. Try searching for what you need below.</p>
  </header>
  <footer>
    <div class="input-group sm:w-3/4">
      <input type="search" placeholder="Try searching for pages..." />
      <span data-align="start" aria-hidden="true"><svg class="lucide lucide-search" ...></svg></span>
      <span data-align="end"><kbd class="kbd">/</kbd></span>
    </div>
    <p>Need help? <a href="#">Contact support</a></p>
  </footer>
</section>
```

### RTL

```html
<section class="empty" dir="rtl">
  <header>
    <figure>
      <svg class="lucide lucide-folder-code" ...></svg>
    </figure>
    <h3>لا توجد مشاريع بعد</h3>
    <p>لم تقم بإنشاء أي مشاريع بعد. ابدأ بإنشاء مشروعك الأول.</p>
  </header>
  <footer>
    <div class="flex flex-row justify-center gap-2">
      <button class="btn">إنشاء مشروع</button>
      <button class="btn" data-variant="outline">استيراد مشروع</button>
    </div>
    <a href="#" class="btn text-muted-foreground" data-variant="link" data-size="sm">
      تعرف على المزيد
      <svg class="lucide lucide-arrow-up-right rtl:rotate-270" data-icon="inline-end" ...></svg>
    </a>
  </footer>
</section>
```

## Accessibility

- Use a heading element (`<h2>`, `<h3>`, `<h4>`) for the title. The level should match the surrounding document outline — `<h3>` is typical for empty states inside cards.
- The figure element can be an icon, image, or avatar group. Mark icons `aria-hidden="true"`. For images, use meaningful `alt` text.
- The empty state should be announced as content, not as a region. Don't add `role="region"` unless it represents a discrete section.
- For action buttons, follow [Button](./button.md) accessibility (icon-only buttons need `aria-label`).
- For RTL, flip directional icons with `rtl:rotate-180` or `rtl:rotate-270`.

## Gotchas

- Use `<section class="empty">` (not `<div>`) for the root — the section element is more semantic for a discrete empty state.
- The figure element is styled automatically when it contains only an icon (`figure:has(> svg:only-child)`).
- For action buttons inside `<footer>`, you can stack multiple buttons using flex utilities.
- For a learn-more link with a directional icon, use `data-icon="inline-end"` on the `<svg>` for icon-aware spacing.
- For a full-page empty state, use `h-full` on the root and consider `bg-muted/30` for a subtle background.
