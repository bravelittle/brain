# Dependencies

- **Prefer the standard library and existing dependencies.** Add a new one only when it saves real work, and say why in the PR.
- **Vet before adding**: actively maintained, widely used, compatible licence (MIT, Apache-2.0, BSD, ISC are fine; GPL or AGPL needs explicit approval), no open critical advisories.
- **Pin through the lockfile**; commit it. Install from it in CI (`npm ci`, `uv sync --frozen`, and so on).
- **Update regularly** via the automated update PRs; don't let majors drift more than one version behind.
- **Remove what you stop using** in the same PR.
