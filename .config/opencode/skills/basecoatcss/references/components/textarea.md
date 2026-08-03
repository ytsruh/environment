# Textarea


A native `<textarea>` element styled by Basecoat. Supports multi-line text input for comments, descriptions, and other free-form content.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.textarea`
- **Native element:** `<textarea>`

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/textarea";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<textarea class="textarea" placeholder="Type your message here"></textarea>
```

## Examples

### Basic

```html
<textarea class="textarea" placeholder="Type your message here"></textarea>
```

### With field (label + description)

```html
<div role="group" class="field">
  <label for="message">Message</label>
  <textarea id="message" placeholder="Type your message here"></textarea>
  <p>Write a short message.</p>
</div>
```

### Disabled

```html
<textarea class="textarea" placeholder="Type your message here" disabled></textarea>
```

### Invalid

```html
<div role="group" class="field w-full max-w-xs">
  <label for="invalid-message">Message</label>
  <textarea class="textarea" id="invalid-message" placeholder="Type your message here" aria-invalid="true"></textarea>
  <p>Message is required.</p>
</div>
```

### With button

```html
<div class="grid w-full max-w-xs gap-3">
  <textarea class="textarea" placeholder="Type your message here"></textarea>
  <button type="submit" class="btn">Submit</button>
</div>
```

### In an input group (code editor with actions)

```html
<div class="input-group min-h-[200px]" data-orientation="vertical">
  <textarea placeholder="console.log('Hello, world!');"></textarea>
  <footer data-align="end" class="border-t">
    <span>Line 1, Column 1</span>
    <button type="button" class="btn ml-auto" data-size="sm">
      Run
      <svg class="lucide lucide-corner-down-left" ...></svg>
    </button>
  </footer>
  <header data-align="start" class="border-b">
    <svg class="text-muted-foreground lucide lucide-file-code" ...></svg>
    <span>script.js</span>
  </header>
</div>
```

### Autosize (using `field-sizing-content`)

```html
<textarea class="textarea field-sizing-content min-h-16 resize-none" placeholder="Type your message..."></textarea>
```

`field-sizing-content` is a modern CSS property that makes the textarea grow with its content. Browser support is limited to Chrome 123+ and Safari 17.4+.

### Form

```html
<form class="w-full max-w-sm space-y-6">
  <div role="group" class="field">
    <label for="bio">Bio</label>
    <textarea id="bio" placeholder="Tell us a bit about yourself"></textarea>
    <p>You can @mention other users and organizations.</p>
  </div>
  <button type="submit" class="btn">Submit</button>
</form>
```

### RTL

```html
<div role="group" class="field w-full max-w-xs" dir="rtl">
  <label for="message-rtl">التعليقات</label>
  <textarea id="message-rtl" placeholder="تعليقاتك تساعدنا على التحسين..." rows="4"></textarea>
  <p>شاركنا أفكارك حول الخدمة.</p>
</div>
```

## Accessibility

- Always pair with a `<label>` (using `for` matching the `id`).
- For invalid state, add `aria-invalid="true"` and connect the error with `aria-describedby`.
- For required fields, use `required` and `aria-required="true"`. Add a visual indicator (`*`) to the label.
- For character limit announcements, use `aria-describedby` pointing to a description that updates as the user types.
- Native `<textarea>` has full keyboard support (arrow keys, `Home`/`End`, `Cmd+A` to select all).
- The `rows` attribute sets the visible height. Set it to a sensible default (e.g., 4) and let CSS handle the rest.

## Gotchas

- The styling is on the `class="textarea"` attribute. You must add `class="textarea"` to the `<textarea>`.
- Textareas inside a `class="field"` container also receive the same styling automatically. You don't need to add `class="textarea"` when the textarea is inside a `.field`.
- The default `rows` is implementation-defined. Set it explicitly (`rows="4"`) for a consistent initial height.
- The `cols` attribute is also implementation-defined. Don't rely on it for layout — use CSS.
- For character count, use the `maxlength` attribute for a hard limit. For a soft limit with feedback, track the value in JavaScript and display the count.
- For autosize, the native `field-sizing-content` CSS property is the modern approach. As a fallback, use a small JavaScript solution that resizes the textarea on `input`.
- Use `resize-none` only when autosize is implemented. Otherwise, users need to be able to resize manually.
- For very long content, consider an alternative like a [Rich Text Editor](#) (not part of Basecoat). Plain `<textarea>` is for plain text only.
