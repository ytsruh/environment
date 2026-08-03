---
name: templ
description: Compile-time HTML templating for Go using templ. Enforces type-safe components, layout composition, fragment rendering, and production-ready best practices for HTTP, SSE, and component-driven UI architectures.
---

# SKILL.md — templ (https://templ.guide)

This SKILL document defines how Claude CLI and OpenCode CLI should reason about, generate, refactor, and review code that uses **templ** (https://templ.guide) for Go-based HTML templating.

The purpose is to ensure consistent, idiomatic, production-ready usage of templ across projects.
---
# 1. Core Mental Model

## 1.1 What templ Is
- templ is a compile-time HTML templating language for Go.
- templ files (`*.templ`) compile into Go code.
- Components are first-class Go functions.
- Rendering is type-safe.
- No runtime template parsing.

CLI tools MUST:
- Prefer compile-time safety over reflection-based approaches.
- Avoid html/template unless explicitly required.
- Treat templ components as pure view-layer functions.
---
# 2. File Structure Conventions
Recommended structure:
```
/internal/ui/
    layout.templ
    page_home.templ
    components/
        button.templ
        card.templ
        table.templ
```

Rules:
- One logical component per file.
- Name components in PascalCase.
- Keep business logic OUT of templ files.
- Use Go services for logic, templ only for rendering.
---
# 3. Basic Component Patterns

## 3.1 Simple Component
```templ
package ui

templ Hello(name string) {
    <div>
        Hello { name }
    </div>
}
```

Generated usage:
```go
ui.Hello("World").Render(ctx, w)
```

Rules for CLI tools:
- Always generate strongly typed parameters.
- Never pass `interface{}`.
- Avoid maps for props unless dynamic content is unavoidable.
---
# 4. Layout Pattern (Composition)

## 4.1 Layout Component
```templ
templ Layout(title string, body templ.Component) {
    <html>
        <head>
            <title>{ title }</title>
        </head>
        <body>
            { body }
        </body>
    </html>
}
```

## 4.2 Page Using Layout
```templ
templ HomePage() {
    @Layout("Home",
        templ.ComponentFunc(func(ctx context.Context, w io.Writer) error {
            return templ.Render(ctx, w,
                <div>Welcome</div>,
            )
        }),
    )
}
```

CLI MUST:
- Prefer nested components over inline ComponentFunc where possible.
- Encourage small reusable blocks.
- Avoid deeply nested inline lambdas.
---
# 5. Conditional Rendering
```templ
templ UserBadge(user *User) {
    if user != nil {
        <span>{ user.Name }</span>
    } else {
        <span>Guest</span>
    }
}
```

Best practices:
- Keep conditionals simple.
- Avoid multi-branch complex logic.
- Precompute complex logic in Go before passing to templ.
---
# 6. Loops
```templ
templ UserList(users []User) {
    <ul>
        for _, u := range users {
            <li>{ u.Name }</li>
        }
    </ul>
}
```

Rules:
- Use slices, not channels.
- Do not perform DB access inside loops.
- Ensure data is fully prepared before rendering.
---
# 7. Attributes & Safety
templ automatically escapes values.

Correct:
```templ
<a href={ url }>Link</a>
```

Unsafe raw HTML (only when trusted):
```templ
{ templ.Raw(htmlContent) }
```

CLI MUST:
- Default to escaped rendering.
- Only use `templ.Raw` when explicitly justified.
---
# 8. Forms Pattern
```templ
templ LoginForm(action string) {
    <form method="POST" action={ action }>
        <input type="text" name="email" />
        <input type="password" name="password" />
        <button type="submit">Login</button>
    </form>
}
```

Rules:
- Always pass action as string.
- Do not hardcode URLs.
- Prefer CSRF token component injection.
---
# 9. Fragment Rendering (SSE / HTMX / Partial Updates)
templ supports rendering fragments.
```go
component := ui.UserList(users)
component.Render(ctx, w)
```

Best practice:
- Build small fragment components.
- Do not re-render full layouts for partial updates.
---
# 10. Error Handling
Rendering returns error:
```go
if err := ui.HomePage().Render(ctx, w); err != nil {
    http.Error(w, err.Error(), 500)
}
```

CLI MUST:
- Always check Render error.
- Never ignore returned error.
---
# 11. Testing Components
Example test:

```go
buf := &bytes.Buffer{}
err := ui.Hello("Test").Render(context.Background(), buf)
require.NoError(t, err)
require.Contains(t, buf.String(), "Test")
```

Rules:
- Test rendered HTML via string assertions.
- Avoid brittle full-document comparisons.
---
# 12. Performance Guidelines
- No reflection.
- No runtime parsing.
- Avoid large in-memory HTML assembly when streaming is possible.
- Prefer streaming to io.Writer.

CLI MUST:
- Generate streaming-friendly handlers.
- Avoid building huge strings.
---
# 13. HTTP Integration Pattern
Recommended handler:
```go
func HomeHandler(w http.ResponseWriter, r *http.Request) {
    ctx := r.Context()

    if err := ui.HomePage().Render(ctx, w); err != nil {
        http.Error(w, err.Error(), http.StatusInternalServerError)
    }
}
```
Rules:
- Always use request context.
- Do not create background contexts.
- Do not write to ResponseWriter after error.
---
# 14. Anti‑Patterns
CLI tools must avoid generating:
- Business logic inside templ blocks.
- DB queries inside templ.
- Global mutable state.
- Giant monolithic components.
- Inline CSS/JS duplication.
---
# 15. Code Generation Rules for Claude / OpenCode
When asked to generate templ code:
1. Use typed parameters.
2. Separate layout from content.
3. Provide minimal but production-ready example.
4. Include handler example when relevant.
5. Never mix html/template with templ unless required.
6. Prefer composition over condition explosion.
7. Keep components small and reusable.
---
# 16. Migration Guidance
When converting from html/template:
- Replace template parsing with compiled templ.
- Convert template blocks into components.
- Replace template data maps with typed structs.
---
# 17. Security Principles
- Escaping by default.
- Explicit raw rendering only.
- No inline JS injection.
- Validate inputs before rendering.
---
# 18. Naming Conventions
- Component: PascalCase
- File: snake_case.templ
- Package: ui or view
---
# 19. Versioning
CLI tools should:
- Assume latest stable templ version.
- Avoid deprecated APIs.
- Generate go:generate hint when appropriate:

```go
//go:generate templ generate
```
---
