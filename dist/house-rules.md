# Brain house rules

These rules come from the brain (github.com/bravelittle/brain) and apply in every repo. Paths such as rules/git.md name sections of this text. The current repo's own AGENTS.md or CLAUDE.md overrides them where they differ.


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

## Precedence

1. The current repo's own `AGENTS.md` (its stack, commands and deviations).
2. These brain rules.
3. Brain skills, then upstream skills.

## House rules

- `rules/git.md`: trunk-based, `<type>/<desc>` branches, Conventional Commits, PRs under ~400 lines, squash-merge, SemVer.
- `rules/code-style.md`: tools enforce formatting; match surrounding code; comments explain why.
- `rules/testing.md`, `rules/security.md`, `rules/dependencies.md`.
- `rules/repo-baseline.md`: what every repo must have. New repos start from `templates/repo/`.
- Language specifics live in skills named `<language>-conventions` and load when you work in that language.

---
rules/code-style.md:

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

---
rules/dependencies.md:

# Dependencies

- **Prefer the standard library and existing dependencies.** Add a new one only when it saves real work, and say why in the PR.
- **Vet before adding**: actively maintained, widely used, compatible licence (MIT, Apache-2.0, BSD, ISC are fine; GPL or AGPL needs explicit approval), no open critical advisories.
- **Pin through the lockfile**; commit it. Install from it in CI (`npm ci`, `uv sync --frozen`, and so on).
- **Update regularly** via the automated update PRs; don't let majors drift more than one version behind.
- **Remove what you stop using** in the same PR.

---
rules/git.md:

# Git and pull requests

- **Trunk-based.** `main` is always releasable and protected: no direct pushes, merges only through a PR with green CI.
- **Short-lived branches** off `main`, named `<type>/<short-description>`, e.g. `feat/invoice-export`, `fix/login-timeout`. Merge or delete within a few days.
- **Conventional Commits** for commit messages and PR titles: `<type>(<optional scope>): <summary>`, summary in imperative mood under 72 characters. Types: `feat`, `fix`, `docs`, `refactor`, `test`, `perf`, `build`, `ci`, `chore`. A breaking change adds `!` after the type and a `BREAKING CHANGE:` footer.
- **The body says why**, not what; the diff shows what.
- **Atomic commits**: one logical change each, tests passing at every commit.
- **Small PRs**: one concern, aim for under 400 changed lines excluding generated files and lockfiles. Split anything bigger.
- **PR description**: what changed, why, how it was verified, and anything the reviewer must decide. Link the issue if one exists.
- **Squash-merge** into `main`, so `main` reads as one Conventional Commit per PR.
- Never rewrite history others have pulled. Never force-push `main`.
- **Releases** use SemVer tags (`v1.4.0`), derived from the commit types; the changelog is generated from them.

Skill: `git-workflow-and-versioning`.

---
rules/repo-baseline.md:

# Repository baseline

Every repo that uses the brain has these. Start new repos from `templates/repo/`.

- `README.md` with: what it is, how to install, run, test and deploy, each as a copy-pasteable command.
- `AGENTS.md` with the repo's stack, its exact commands and any deviations from the brain (`CLAUDE.md` contains `@AGENTS.md`). The repo's file wins over the brain where they differ.
- `.editorconfig`, `.gitignore`, and a committed lockfile.
- **CI on every PR**: format check, lint, type check where the language has one, tests, build. All must pass to merge.
- **Branch protection on `main`**: PR required, CI required, no force-push.
- **Dependency updates automated** (Dependabot or Renovate) and a secret scanner enabled.
- `.env.example` listing every environment variable with a dummy value; real `.env` files are gitignored.
- A pull request template (`.github/pull_request_template.md`).
- Architecture decisions recorded as ADRs in `docs/adr/` (skill: `documentation-and-adrs`).

---
rules/security.md:

# Security

- No secrets, tokens or credentials in code, commits, logs or prompts. Use the project's secret store.
- Validate and encode all untrusted input: user input, files, network responses, and LLM output.
- Least privilege for tokens, service accounts and CI jobs.
- New dependencies follow `rules/dependencies.md`.
- Destructive operations (deletes, migrations, production changes) need explicit human approval.

Skills: `security-and-hardening`. Checklist: `upstream/addyosmani-agent-skills/references/security-checklist.md`.

---
rules/testing.md:

# Testing

- Every behaviour change ships with a test that fails without the change.
- Bug fixes start with a test that reproduces the bug.
- Never skip, delete, or loosen an existing test or assertion to make a build pass.
- Never add `@ts-ignore`, `eslint-disable`, `# noqa`, `//nolint` or similar to get to green without a comment explaining why and an issue to remove it.
- Run the focused test while working and the full suite before declaring done.

Skills: `test-driven-development`, `constraint-driven-development`, `debugging-and-error-recovery`.
