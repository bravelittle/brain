---
name: typescript-conventions
description: Applies the house conventions for TypeScript and JavaScript code. Use when writing, reviewing or setting up code in a repo with a package.json or tsconfig.json, including Node services, React or other frontend apps, and scripts.
---

# TypeScript Conventions

## Overview

House defaults for TypeScript and JavaScript repos. They sit under the repo's own `AGENTS.md`: when the repo already chose differently, follow the repo.

## When to Use

- Writing or changing `.ts`, `.tsx`, `.js` or `.mjs` files
- Setting up a new Node or frontend repo
- Reviewing a TypeScript diff

**When NOT to use:** the repo's `AGENTS.md` names a different toolchain; follow that instead.

## Process

1. **Discover the toolchain first.** Read `package.json` scripts, the lockfile (`pnpm-lock.yaml`, `package-lock.json`, `yarn.lock`, `bun.lockb`) and CI config. Use that package manager and those scripts.
2. **Defaults for new repos:**
    - TypeScript everywhere, `"strict": true`, plus `noUncheckedIndexedAccess`.
    - pnpm as package manager, Node LTS pinned in `.nvmrc` and `engines`.
    - ESM (`"type": "module"`).
    - ESLint (typescript-eslint, recommended-type-checked) and Prettier, or Biome for both.
    - Vitest for unit tests; Playwright for end-to-end.
    - Scripts named `dev`, `build`, `test`, `lint`, `format`, `typecheck`; CI runs `lint`, `typecheck`, `test`, `build`.
3. **Types:**
    - No `any`. Use `unknown` and narrow. No non-null `!` without a comment saying why it is safe.
    - Validate external data (HTTP bodies, env vars, files) at the boundary with a schema library such as Zod, and derive the type from the schema.
    - Prefer union types and `as const` objects over `enum`.
    - Exported functions declare their return types.
4. **Code:**
    - `const` by default; no `var`.
    - `async`/`await` over raw promise chains; never leave a promise floating.
    - Named exports over default exports.
    - Files `kebab-case.ts`; types and components `PascalCase`; values `camelCase`; constants `UPPER_SNAKE_CASE`.
    - Tests next to the code as `*.test.ts`.

## Common Rationalizations

| Rationalization | Reality |
| --- | --- |
| "`any` is quicker here" | It turns off the checker for everything that touches the value. Use `unknown` and narrow. |
| "The API always returns this shape" | Until it doesn't. Parse at the boundary so the failure is loud and local. |
| "I'll add `// @ts-ignore` just for now" | Suppressions are banned by `rules/testing.md`. Fix the type. |

## Red Flags

- `any`, `as` casts or `@ts-ignore` / `@ts-expect-error` added in the diff
- Unawaited promises, or `.catch(() => {})`
- `process.env.X` read outside a single config module
- A second package manager's lockfile appearing

## Verification

- [ ] `typecheck`, `lint` and `test` scripts pass locally
- [ ] No new `any`, unchecked casts or suppressions
- [ ] External input is schema-validated
