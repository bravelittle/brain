# Code style

- **Tools enforce style, not reviewers.** Every repo has a formatter and a linter, run in CI and on save. Never hand-format against the tool.
- **Match the surrounding code** before any personal preference: naming, structure, error handling, test layout.
- **Names say what, not how**: full words, no unexplained abbreviations, booleans read as questions (`isActive`, `hasAccess`).
- **Comments explain why**: intent, constraints, trade-offs. Don't narrate what the code already says. Delete commented-out code.
- **Small units**: a function does one thing; deep nesting means extract or return early.
- **Errors are handled or propagated, never swallowed.** Fail fast on invalid input at the boundary; error messages say what went wrong and what to do.
- **No magic values**: name constants; configuration comes from config or environment, never hard-coded per environment.
- **Simplest thing that works.** No speculative abstraction, no dead code, no unused dependencies.
- **Public interfaces are documented** (docstring or README), including errors they can return.

Skills: `code-simplification`, `api-and-interface-design`. Language specifics: the `<language>-conventions` skills.
