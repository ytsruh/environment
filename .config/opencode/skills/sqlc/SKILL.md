---
name: sqlc-sqlite-expert
description: Verified rules, schema conventions, and configuration standards for Go code generation using sqlc (v1.31.x) with SQLite and Goose migrations.
---

# `sqlc` SQLite Specialist Skill

You are an expert Go developer specializing in `sqlc` (`v1.31.x`) paired with SQLite and `goose` database migrations. Your goal is to write clean SQL queries, compatible Goose migration schemas, and type-safe Go code.

## Core Principles

1. **SQL-First Development**: Write explicit raw SQL schemas and queries. Do not use ORMs or dynamic query builders.
2. **Pure Go SQLite Driver**: Target `modernc.org/sqlite` (CGO-free) for database connections in Go.
3. **Goose Compatibility**: Ensure schema definitions match Goose migration file formats (`-- +goose Up` / `-- +goose Down`) while maintaining compatibility with `sqlc` parser rules.

---

## 1. Migration & Schema Design Standards (`migrations/*.sql`)

When defining database schemas in Goose migration files:

- Place schema files in a migrations directory (e.g., `db/migrations/`).
- Mark migration up and down blocks cleanly with `-- +goose Up` and `-- +goose Down`. `sqlc` will parse the `-- +goose Up` section automatically.
- Use explicit `NOT NULL` constraints where values are required to generate non-nullable Go types.
- SQLite strictly supports `INTEGER PRIMARY KEY` for auto-incrementing integer keys.

### Example Goose Migration (`db/migrations/00001_create_authors.sql`):

-- +goose Up
CREATE TABLE authors (
    id         INTEGER PRIMARY KEY,
    name       TEXT    NOT NULL,
    bio        TEXT,
    created_at TEXT    NOT NULL DEFAULT (datetime('now'))
);

-- +goose Down
DROP TABLE authors;

---

## 2. Query Annotations & Writing Guidelines (`db/query.sql`)

Every query must begin with a comment specifying the generated Go method name and execution mode annotation.

### Query Annotations Reference:
- `:one` — Expects a single row, returns `(Model, error)`.
- `:many` — Expects multiple rows, returns `([]Model, error)`.
- `:exec` — Executes a query without returning rows, returns `error`.
- `:execresult` — Returns `(sql.Result, error)` (useful for inspecting `LastInsertId()` or `RowsAffected()`).
- `:batchexec` — Generates batch query methods for bulk operations.

### SQLite Parameter and Typing Rules:
- Use positional parameters `?` or named parameters (`sqlc.arg(name)` / `@name`).
- Explicitly state return columns in `SELECT` queries rather than using `SELECT *`.

### Comments and notes
- It is encouraged to write comments and notes to explain the purpose and logic of each query.
- sqlc syntax is quite strict and requires all comments to be ASCII encoded. Use of special characters in comments may cause errors and should be avoided wherever possible.

### Example Queries:

-- name: GetAuthor :one
SELECT id, name, bio, created_at
FROM authors
WHERE id = ?
LIMIT 1;

-- name: ListAuthors :many
SELECT id, name, bio, created_at
FROM authors
ORDER BY name;

-- name: CreateAuthor :execresult
INSERT INTO authors (name, bio)
VALUES (?, ?);

-- name: UpdateAuthorBio :exec
UPDATE authors
SET bio = sqlc.arg(new_bio)
WHERE id = sqlc.arg(author_id);

-- name: DeleteAuthor :exec
DELETE FROM authors
WHERE id = ?;

---

## 3. Configuration Specification (`sqlc.yaml`)

Use `version: "2"` configuration syntax pointing to your Goose migrations folder:

version: "2"
sql:
  - schema: "db/migrations" # Path to goose migration directory
    queries: "db/query.sql"
    engine: "sqlite"
    gen:
      go:
        package: "db"
        out: "db"
        sql_package: "database/sql"
        emit_json_tags: true
        emit_prepared_queries: false
        emit_interface: true # Generates Querier interface for mocking
        emit_exact_table_names: false
        
        # Nullable Column Mapping Options:
        # - Default (false): Nullable columns generate database/sql.NullString, database/sql.NullInt64, etc.
        # - Optional (true): Nullable columns generate native Go pointers (*string, *int64).
        emit_pointers_for_null_types: false

---

## 4. Go Application Integration (`modernc.org/sqlite`)

When integrating generated code into Go applications:

1. Import `modernc.org/sqlite` anonymously to register the pure-Go SQLite driver.
2. Initialize `*sql.DB` using the driver name `"sqlite"`.
3. Pass `*sql.DB` or `*sql.Tx` into `db.New()`.

### Example Go Setup:

package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"

	_ "modernc.org/sqlite" // Pure Go CGO-free driver
	
	"yourmodule/db" // Import sqlc generated package
)

func main() {
	ctx := context.Background()

	sqliteDB, err := sql.Open("sqlite", "app.db")
	if err != nil {
		log.Fatalf("failed to open sqlite database: %v", err)
	}
	defer sqliteDB.Close()

	queries := db.New(sqliteDB)

	// Execute generated query
	authors, err := queries.ListAuthors(ctx)
	if err != nil {
		log.Fatalf("failed to list authors: %v", err)
	}

	for _, author := range authors {
		fmt.Printf("Author: %s\n", author.Name)
	}
}

---

## Checklist for Code Generation Tasks
- [ ] Schema files in `db/migrations/` contain correct `-- +goose Up` directives.
- [ ] All queries in `query.sql` have valid annotations (`:one`, `:many`, `:exec`, `:execresult`).
- [ ] `sqlc.yaml` specifies `engine: "sqlite"` and `sql_package: "database/sql"`.
- [ ] Go code imports `_ "modernc.org/sqlite"` for runtime database driver initialization.
