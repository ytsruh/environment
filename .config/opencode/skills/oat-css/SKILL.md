---
name: oat-ui-development
description: Use this skill when building or styling web interfaces using Oat UI. It covers semantic HTML patterns, minimalist layouts, and zero-framework UI components.
---

# Oat UI Development Skill

## Context
Oat is a lightweight (~8KB) UI library that styles **semantic HTML elements** automatically. It avoids class-heavy workflows and focuses on "writing HTML like it's 1999" but making it look modern.

## Core Principles
- **Semantic First:** Use `<section>`, `<article>`, `<aside>`, and `<nav>` for layout.
- **No Utility Classes:** Do not use Tailwind-style classes. Trust Oat's contextual styling.
- **Web Components:** Use Oat's custom elements (e.g., `<oat-tabs>`) for interactive bits.
- **Theming:** Use CSS variables (e.g., `--accent`) for customization.

## Key Workflows

### 1. Basic Setup
Always ensure the `oat.min.css` and `oat.min.js` are included in the `<head>`.
```html
<link rel="stylesheet" href="[https://cdn.jsdelivr.net/npm/@knadh/oat/oat.min.css](https://cdn.jsdelivr.net/npm/@knadh/oat/oat.min.css)">
<script src="[https://cdn.jsdelivr.net/npm/@knadh/oat/oat.min.js](https://cdn.jsdelivr.net/npm/@knadh/oat/oat.min.js)"></script>
```

### 2. Layout Patterns
Instead of div.container, use structural tags:
- Use <main> as the primary wrapper.
- Use <header> and <footer> inside <article> or <body>.
- Use <fieldset> for grouping form inputs.

### 3. Interactive Components
When the user asks for tabs, modals, or dropdowns, use the native Oat Web Components:
- Tabs: <oat-tabs> with nested div[label].
- Modals: Use the <dialog> element (styled by Oat).
- Forms: Just use standard <form>, <label>, and <input>. Oat handles the spacing and typography.

### 4. Dark Mode & Theming
Oat supports system-level dark mode and manual overrides.
- To force a theme: Add data-theme="dark" or data-theme="light" to the <body>.
- To change colors: Redefine variables like --bg, --fg, and --accent in a <style> block.

### Constraints & "Do Not's"
DO NOT add unnecessary div wrappers.
DO NOT use class="btn"—Oat styles <button> and input[type="submit"] automatically.
DO NOT bring in external CSS frameworks (Bootstrap, Tailwind) as they will conflict with Oat’s global tag styling.
