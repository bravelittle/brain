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
