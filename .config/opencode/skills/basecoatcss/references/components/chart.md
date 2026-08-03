# Chart


A helper for integrating [Chart.js](https://www.chartjs.org/) with Basecoat's design tokens. **Beta API** — names and behavior may change before the stable 1.0 release.

## Overview

- **CSS-only:** no (requires Chart.js + the chart helper)
- **JS module:** `basecoat-css/chart` (load Chart.js separately)
- **Root element:** a native `<canvas>` (Basecoat adds a wrapper for sizing)
- **Beta status:** API may change before 1.0

## Imports

### CSS

```css
@import "tailwindcss";
@import "basecoat-css";
```

Or tree-shakeable:

```css
@import "tailwindcss";
@import "basecoat-css/base";
@import "basecoat-css/components/chart";
@import "basecoat-css/styles/vega";
```

### JavaScript

Chart is **not** included in `basecoat-css/all`. Load Chart.js and the chart helper separately:

```html
<script src="https://cdn.jsdelivr.net/npm/chart.js@4/dist/chart.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/basecoat.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/basecoat-css@1.0.2/dist/js/chart.min.js" defer></script>
```

Or:

```js
import "chart.js/auto";
import "basecoat-css/chart";
```

The `basecoat-css/chart` module must load **after** Chart.js.

## HTML structure

```html
<canvas id="visitors-chart" aria-label="Monthly visitors"></canvas>
```

`basecoat.chart()` targets the `<canvas>` directly and creates Basecoat's internal `.chart` container for Chart.js sizing. You do not need to add a wrapper or class in your HTML.

Charts default to `aspect-video`. Use a height, `min-h-*`, or `aspect-*` utility on a parent element when you need a different measuring box.

## JavaScript API

```js
window.basecoat.chart(selector, config);
```

Returns the Chart.js instance for single targets and an array of instances for multi-target selectors.

### Config options

| Option | Type | Default | Description |
|---|---|---|---|
| `type` | `string` | `"bar"` | Chart.js chart type. |
| `labelKey` | `string` | `"label"` | Row key used for labels. |
| `data` | `array \| object` | `[]` | Array of row objects, or raw Chart.js data with `datasets`. |
| `series` | `object` | `{}` | Series config mapped from row keys. |
| `legend` | `boolean` | `false` | Generates a Basecoat legend after the canvas. |
| `tooltip` | `boolean` | `true` | Uses the Basecoat external tooltip. |
| `options` | `object` | `{}` | Raw Chart.js options. |
| `plugins` | `array` | `[]` | Raw Chart.js plugins. |
| `chartData` | `object` | `undefined` | Complete Chart.js data object. Overrides the data mapper. |

### Series options

| Option | Description |
|---|---|
| `label` | Display label for legends and tooltips. |
| `color` | Base color for the series stroke, fill, legend marker, and tooltip marker. |
| `surface` | Derives a fill from `color`. Use `true` for a translucent fill, `"gradient"` for an upstream-style vertical fade, or `{ from, to }` for custom opacity stops. |
| `dataset` | Raw Chart.js dataset options. |

## Examples

### Bar chart with multiple series

```html
<canvas id="visitors-chart" aria-label="Monthly visitors by device"></canvas>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    window.basecoat.chart("#visitors-chart", {
      type: "bar",
      labelKey: "month",
      data: [
        { month: "Jan", desktop: 186, mobile: 80 },
        { month: "Feb", desktop: 305, mobile: 200 },
        { month: "Mar", desktop: 237, mobile: 120 }
      ],
      series: {
        desktop: { label: "Desktop", color: "var(--chart-1)" },
        mobile: { label: "Mobile", color: "var(--chart-2)" }
      }
    });
  });
</script>
```

### Line chart with gradient fill

```js
window.basecoat.chart("#revenue-chart", {
  type: "line",
  labelKey: "month",
  data,
  series: {
    recurring: {
      label: "Recurring",
      color: "var(--chart-1)",
      surface: "gradient",
      dataset: { fill: true, tension: 0.35 }
    },
    new: {
      label: "New",
      color: "var(--chart-2)",
      dataset: { borderDash: [4, 4] }
    }
  }
});
```

### With legend

```js
window.basecoat.chart("#visitors-chart", {
  type: "bar",
  labelKey: "month",
  data,
  series,
  legend: true
});
```

The generated legend is display-only by default. Use a Chart.js plugin or custom legend markup if you need click-to-toggle behavior.

### With custom Chart.js options

```js
window.basecoat.chart("#visitors-chart", {
  type: "bar",
  labelKey: "month",
  data,
  series,
  options: {
    indexAxis: "x",
    scales: { y: { beginAtZero: true } },
    plugins: { tooltip: { mode: "index" } }
  },
  plugins: [myChartJsPlugin]
});
```

### With raw Chart.js data

```js
window.basecoat.chart("#custom-chart", {
  type: "scatter",
  chartData: {
    datasets: [{
      label: "Samples",
      data: [{ x: 1, y: 2 }, { x: 2, y: 5 }]
    }]
  },
  options: {
    scales: { x: { type: "linear" } }
  }
});
```

## Accessibility

- Always provide an accessible name on the `<canvas>` via `aria-label` or `aria-labelledby`.
- For complex charts, provide a text summary in a visually hidden element or nearby paragraph.
- Chart.js's default canvas rendering is not accessible to screen readers. Consider providing an alternative data table for screen reader users.
- The Basecoat external tooltip is keyboard-friendly when configured via Chart.js options.

## Gotchas

- The chart API is **beta** and may change before the stable 1.0 release.
- Chart.js must be loaded **before** the Basecoat chart helper.
- Use Basecoat CSS variables for series colors to match the theme. Available variables: `var(--chart-1)` through `var(--chart-5)`.
- The default chart size is `aspect-video`. Override on a parent element with `min-h-*` or `aspect-*` for different aspect ratios.
- For dynamic data, call `chart.update()` on the returned Chart.js instance, or call `window.basecoat.chart()` again to recreate.
