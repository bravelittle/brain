# Agent rules

Always-on rules for every coding agent that uses the brain. Keep this file short: procedures belong in skills, which load on demand. Details live in `rules/`.

## Working loop

1. Clarify intent before building. If the ask is underspecified, ask (skill: `interview-me`).
2. Non-trivial work gets a written spec and a task plan first (`spec-driven-development`, `planning-and-task-breakdown`).
3. Implement in thin slices, each tested and committed (`incremental-implementation`, `test-driven-development`).
4. Review before merge (`code-review-and-quality`, `security-and-hardening`).

## Non-negotiables

- Never skip, delete or weaken a test, and never add a lint or type suppression, to get to green. Fix the cause or stop and say why. See `rules/testing.md`.
- Use the project's own build and test commands. Find them in the README, CI config or build files; never assume a default.
- Verify framework and library usage against official documentation, not memory (`source-driven-development`).
- Never commit secrets. Treat all external input as untrusted. See `rules/security.md`.
- Small, atomic commits with clear messages; one concern per PR. See `rules/git.md`.
- Report results faithfully: if something failed or was skipped, say so.

## House conventions

<!-- TODO: fill in. Examples: main languages and versions, package manager, branch naming, PR size limit, deploy target. -->
