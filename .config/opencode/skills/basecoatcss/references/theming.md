---
description: Theming Basecoat — style packs, CSS variables, TweakCN integration, fonts, icons, project overrides, and writing a custom style pack from scratch.
globs: "*.{css,html}"
---

# Theming


Basecoat customization has three layers:

1. Choose a style pack.
2. Override theme tokens (colors, fonts, radius).
3. Add small project-level CSS overrides when tokens are not enough.

For a full visual rewrite, import the styleless Basecoat base and write your own style pack.

## Contents

- [Style packs](#style-packs)
- [Themes (CSS variables)](#themes-css-variables)
- [Fonts](#fonts)
- [Icons](#icons)
- [Project overrides](#project-overrides)
- [Custom style packs](#custom-style-packs)
- [Compatibility](#compatibility)

## Style packs

Basecoat ships the same style families used by the current shadcn/ui registry:

| Style | Mood |
|---|---|
| `vega` | Default. Neutral, balanced, slightly cool. The default for new projects. |
| `nova` | Crisp, modern, slightly higher contrast. |
| `maia` | Warm, earthy tones. |
| `lyra` | Soft pastels, lower contrast. |
| `mira` | Soft, rounded, friendly. |
| `luma` | Light, airy, minimal. |
| `sera` | Editorial, refined. |
| `rhea` | Bold, geometric, high-contrast. |

### Choosing a style

Pick one complete style bundle in your app CSS:

```css
@import "tailwindcss";
@import "basecoat-css/vega";
```

Swap the import to switch styles:

```css
@import "tailwindcss";
@import "basecoat-css/sera";
```

Each style bundle is **standalone**. Do not import Vega first and then load another style on top of it. Each bundle already contains a complete design system (colors, radius, shadows, focus rings, spacing, state treatment). Loading a second bundle will fight the first.

Keep the selected Basecoat style **after** Tailwind or any other stylesheet that emits a reset/base layer.

### Style pack installation paths

- **CDN:** `https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/basecoat-{style}.cdn.min.css`
- **npm:** `@import "basecoat-css/{style}";`
- **Individual:** `basecoat-css/styles/{style}.css` (use with `basecoat-css/base.css`)

## Themes (CSS variables)

Basecoat uses shadcn/ui-compatible CSS variables. You can use a theme from [TweakCN](https://tweakcn.com) or another shadcn/ui theme generator by importing the variables **after** Basecoat:

```css
@import "tailwindcss";
@import "basecoat-css/sera";
@import "./theme.css";
```

`theme.css` should define token values for `:root` (light mode) and `.dark` (dark mode) such as:

```css
:root {
  --background: oklch(1 0 0);
  --foreground: oklch(0.145 0 0);
  --primary: oklch(0.205 0 0);
  --primary-foreground: oklch(0.985 0 0);
  --secondary: oklch(0.97 0 0);
  --secondary-foreground: oklch(0.205 0 0);
  --muted: oklch(0.97 0 0);
  --muted-foreground: oklch(0.556 0 0);
  --accent: oklch(0.97 0 0);
  --accent-foreground: oklch(0.205 0 0);
  --destructive: oklch(0.577 0.245 27.325);
  --destructive-foreground: oklch(0.985 0 0);
  --border: oklch(0.922 0 0);
  --input: oklch(0.922 0 0);
  --ring: oklch(0.708 0 0);
  --radius: 0.625rem;
}

.dark {
  --background: oklch(0.145 0 0);
  --foreground: oklch(0.985 0 0);
  --primary: oklch(0.985 0 0);
  --primary-foreground: oklch(0.205 0 0);
  --secondary: oklch(0.269 0 0);
  --secondary-foreground: oklch(0.985 0 0);
  --muted: oklch(0.269 0 0);
  --muted-foreground: oklch(0.708 0 0);
  --accent: oklch(0.269 0 0);
  --accent-foreground: oklch(0.985 0 0);
  --destructive: oklch(0.396 0.141 25.723);
  --destructive-foreground: oklch(0.985 0 0);
  --border: oklch(0.269 0 0);
  --input: oklch(0.269 0 0);
  --ring: oklch(0.439 0 0);
}
```

### Token reference

| Token | Used by |
|---|---|
| `--background` | Page / card background |
| `--foreground` | Default text color |
| `--primary` | Primary action color (default button) |
| `--primary-foreground` | Text on primary |
| `--secondary` | Secondary action color |
| `--secondary-foreground` | Text on secondary |
| `--muted` | Muted surfaces, secondary buttons |
| `--muted-foreground` | Text on muted, placeholders, helper text |
| `--accent` | Hover/focus accent |
| `--accent-foreground` | Text on accent |
| `--destructive` | Destructive action (delete, remove) |
| `--destructive-foreground` | Text on destructive |
| `--border` | Default border color |
| `--input` | Form control border color |
| `--ring` | Focus ring color |
| `--radius` | Base border-radius (components compute variants from this) |
| `--font-sans` | Body font family |
| `--font-heading` | Heading font family |
| `--font-mono` | Monospace font family |

### TweakCN

The fastest way to generate a theme is to use TweakCN, select a base style, tweak the colors, and copy the output into your project. The generated CSS will work with Basecoat out of the box because the token names match.

## Fonts

Basecoat does not ship web font files by default. Its font tokens prefer [Geist Sans](https://fonts.google.com/specimen/Geist) and [Geist Mono](https://fonts.google.com/specimen/Geist+Mono) when those fonts are available, then fall back to the full Tailwind default sans and mono stacks.

### Install Geist via Fontsource

```bash
npm install @fontsource/geist-sans @fontsource/geist-mono
```

Then import the font files. Basecoat's default font tokens already reference Geist with full system fallbacks:

```css
@import "tailwindcss";
@import "basecoat-css/sera";
@import "@fontsource/geist-sans/400.css";
@import "@fontsource/geist-sans/500.css";
@import "@fontsource/geist-sans/600.css";
@import "@fontsource/geist-sans/700.css";
@import "@fontsource/geist-mono/400.css";
@import "@fontsource/geist-mono/500.css";
@import "@fontsource/geist-mono/600.css";
@import "@fontsource/geist-mono/700.css";
```

### Override font tokens

If you use different fonts, override the font tokens **after** Basecoat:

```css
@import "tailwindcss";
@import "basecoat-css/sera";

:root {
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  --font-heading: "Inter", ui-sans-serif, system-ui, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  --font-mono: "IBM Plex Mono", ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
}
```

Keep font overrides in a small CSS file imported after Basecoat. Fonts are project-level customization, not a Basecoat default.

## Icons

Basecoat examples use [Lucide icons](https://lucide.dev), but Basecoat does not require an icon package. Choose whichever option fits your stack:

- **Inline SVG** — Copy SVGs from [lucide.dev/icons](https://lucide.dev/icons) and paste them into your HTML. Simplest for plain HTML, Jinja, Nunjucks, Rails, Django, Laravel, etc.
- **`lucide` (JS)** — Install [`lucide`](https://lucide.dev/guide/installation) and render icons from JavaScript. Use when you have a build step and want to swap icons dynamically.
- **Framework-specific** — Use a framework-specific Lucide package if your app already uses a framework.

### Icon-aware spacing

When a text button has an icon, use `data-icon="inline-start"` or `data-icon="inline-end"` on the inline `<svg>` to match the upstream icon-aware spacing:

```html
<button type="button" class="btn" data-variant="outline" data-size="sm">
  <svg data-icon="inline-start" class="lucide lucide-git-branch" ...>...</svg>
  New Branch
</button>
```

Use icon size variants (`data-size="icon"`, `icon-xs`, `icon-sm`, `icon-lg`) **only for icon-only buttons**. See `components/button.md` for the full icon-only pattern.

## Project overrides

For small visual tweaks, add utilities or project CSS after Basecoat:

```css
@import "tailwindcss";
@import "basecoat-css/sera";
@import "./app.css";
```

```html
<button class="btn font-normal" data-variant="outline">Click me</button>
```

```css
/* app.css */
.card--compact {
  padding: 0.75rem;
}
```

Prefer theme tokens for broad changes and one-off utilities for local changes. Avoid copying generated Basecoat bundles into your app unless you intend to maintain a fork.

## Custom style packs

If you want a full custom style, import the styleless Basecoat base and write your own style file:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "./styles/acme.css";
```

`basecoat-css/base` includes:

- Base tokens
- Semantic utilities
- Component structure (the `.btn`, `.card`, `.dialog` rules, etc.)

It does **not** include a visual style pack (Vega, Nova, etc.). Your style file owns component visuals:

- Colors
- Radius
- Shadows
- Focus rings
- Spacing
- Variants
- State treatment

### Starting point

The practical way to start is to copy one existing style pack and edit it:

```css
@import "basecoat-css/base";
@import "./styles/acme.css";
/* ./styles/acme.css can start as a copy of basecoat-css/styles/nova. */
```

The source style files live in `node_modules/basecoat-css/dist/styles/`.

### What not to do

Do not import a complete style bundle before your custom style. For example, avoid:

```css
/* Wrong */
@import "tailwindcss";
@import "basecoat-css/nova";
@import "./styles/acme.css";  /* this loads Nova visuals and forces your file to undo them */
```

This loads Nova visuals and forces your file to undo them. Use `basecoat-css/base` instead.

## Compatibility

Basecoat 1.0 prefers `data-variant` and `data-size` over legacy variant classes (e.g., `btn-outline`, `btn-sm`). If you need old pre-1.0 aliases while migrating, import the compatibility layer after Basecoat:

```css
@import "tailwindcss";
@import "basecoat-css/vega";
@import "basecoat-css/compat";
```

The compatibility layer is for migration only. New code should use the documented 1.0 API.
