# Table


A styled HTML `<table>` for tabular data. Supports captions, headers, footers, and selectable rows with checkboxes.

## Overview

- **CSS-only:** yes
- **JS module:** none
- **Root class:** `.table` (on the `<table>`) and `.table-container` (optional wrapper for horizontal scrolling)

## Imports

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/table";
@import "basecoat-css/styles/vega";
```

## HTML structure

```html
<div class="table-container">
  <table class="table">
    <caption>A list of your recent invoices.</caption>
    <thead>
      <tr>
        <th>Invoice</th>
        <th>Status</th>
        <th>Method</th>
        <th>Amount</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="font-medium">INV001</td>
        <td>Paid</td>
        <td>Credit Card</td>
        <td class="text-end">$250.00</td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="3">Total</td>
        <td class="text-end">$2,500.00</td>
      </tr>
    </tfoot>
  </table>
</div>
```

- `<div class="table-container">` — optional wrapper for horizontal scrolling
- `<table class="table">` — the table
- `<caption>` — accessible name for the table
- `<thead>`, `<tbody>`, `<tfoot>` — semantic sections
- `<tr>`, `<th>`, `<td>` — rows, headers, cells
- `data-checkbox-table` — opt-in to selectable rows behavior
- `data-state="selected"` — mark a row as selected

## Examples

### Basic

```html
<div class="table-container">
  <table class="table">
    <caption>A list of your recent invoices.</caption>
    <thead>
      <tr>
        <th>Invoice</th>
        <th>Status</th>
        <th>Method</th>
        <th>Amount</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="font-medium">INV001</td>
        <td>Paid</td>
        <td>Credit Card</td>
        <td class="text-end">$250.00</td>
      </tr>
      <tr>
        <td class="font-medium">INV002</td>
        <td>Pending</td>
        <td>PayPal</td>
        <td class="text-end">$150.00</td>
      </tr>
    </tbody>
  </table>
</div>
```

### With footer

```html
<div class="table-container">
  <table class="table">
    <caption>A list of your recent invoices.</caption>
    <thead>
      <tr>
        <th class="w-[100px]">Invoice</th>
        <th>Status</th>
        <th>Method</th>
        <th class="text-end">Amount</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="font-medium">INV001</td>
        <td>Paid</td>
        <td>Credit Card</td>
        <td class="text-end">$250.00</td>
      </tr>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="3">Total</td>
        <td class="text-end">$2,500.00</td>
      </tr>
    </tfoot>
  </table>
</div>
```

### With actions

```html
<div class="table-container">
  <table class="table">
    <thead>
      <tr>
        <th>Product</th>
        <th>Price</th>
        <th class="text-end">Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="font-medium">Wireless Mouse</td>
        <td>$29.99</td>
        <td class="text-end">
          <div class="inline-flex gap-2">
            <button type="button" class="btn" data-variant="outline" data-size="sm">Edit</button>
            <button type="button" class="btn" data-variant="destructive" data-size="sm">Delete</button>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
</div>
```

### Selectable rows with checkboxes

Add `data-checkbox-table` to the `<table>` and use the [Checkbox](./checkbox.md) component for each row. Mark selected rows with `data-state="selected"`.

```html
<div class="table-container">
  <table class="table" data-checkbox-table>
    <thead>
      <tr>
        <th class="w-8"><input type="checkbox" id="select-all" class="input" aria-label="Select all" /></th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
      </tr>
    </thead>
    <tbody>
      <tr data-state="selected">
        <td><input type="checkbox" id="row-1" class="input" aria-label="Select Sarah Chen" checked /></td>
        <td class="font-medium">Sarah Chen</td>
        <td>sarah.chen@example.com</td>
        <td>Admin</td>
      </tr>
      <tr>
        <td><input type="checkbox" id="row-2" class="input" aria-label="Select Marcus Rodriguez" /></td>
        <td class="font-medium">Marcus Rodriguez</td>
        <td>marcus.rodriguez@example.com</td>
        <td>User</td>
      </tr>
    </tbody>
  </table>
</div>
```

For the "select all" behavior, you'll need to write JavaScript that toggles all row checkboxes based on the header checkbox state.

### RTL

```html
<div class="table-container" dir="rtl">
  <table class="table">
    <caption>قائمة الفواتير الأخيرة.</caption>
    <thead>
      <tr>
        <th>الفاتورة</th>
        <th>الحالة</th>
        <th class="text-end">المبلغ</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="font-medium">INV001</td>
        <td>مدفوعة</td>
        <td class="text-end">$250.00</td>
      </tr>
    </tbody>
  </table>
</div>
```

## Scrollable tables clip overlays

Do not place inline popovers, dropdown menus, selects, or tooltips inside `.table-container`. The table container uses horizontal overflow for wide tables, so absolutely positioned overlays can be clipped or create scrollbars. Keep overlay actions outside scrollable table regions, or omit `.table-container` when the table does not need horizontal scrolling.

## Accessibility

- Always use a native `<table>` with proper semantic structure (`<thead>`, `<tbody>`, `<tfoot>`, `<tr>`, `<th>`, `<td>`).
- Provide a `<caption>` to identify the table for screen readers.
- Use `<th scope="col">` for column headers and `<th scope="row">` for row headers. Basecoat's CSS assumes this convention.
- For sortable columns, add `aria-sort="ascending"`, `aria-sort="descending"`, or `aria-sort="none"` on the `<th>`.
- For selectable rows, add `aria-label` to each row checkbox to identify the row (since the checkbox itself is just a tick).
- For selected rows, use `data-state="selected"` (handled by CSS) and `aria-selected="true"` on the row.
- For tables that don't fit on small screens, consider making them scrollable with `.table-container` and providing a screen reader summary.
- Avoid tables for layout. Use them only for tabular data.

## Gotchas

- The `<table class="table">` is the styled table. The `<div class="table-container">` is the optional scroll wrapper.
- Use `text-end` instead of `text-right` for RTL-aware right-alignment.
- The default text alignment is left (inline-start). Use `text-end` for right-alignment (e.g., numbers, actions).
- For action cells with multiple buttons, use a flex container (`inline-flex gap-2`) to space them.
- Don't put popovers, dropdowns, selects, or tooltips inside `.table-container` — they will be clipped. Move them outside the table or omit `.table-container`.
- The `data-checkbox-table` attribute opts into selectable row styling. The checkbox state and `data-state="selected"` are still controlled by your JavaScript.
- For numeric columns, consider `tabular-nums` on the `<td>` to keep numbers aligned as values change.
- For very wide tables with many columns, consider responsive strategies (column hiding, horizontal scroll, or pivot tables).
