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
