# Hooks

Hook scripts plus the settings snippet that wires each one. `hooks.json` and every `*.sh` here are copied into `dist/hooks/` and run by the plugin.

Ours:

- `session-start.sh`: injects `house-rules.md` (built from `AGENTS.md` and `rules/`) at session start, so the house rules apply in every repo that has the plugin, not only in this one.

Upstream hooks worth adopting later (see `upstream/addyosmani-agent-skills/hooks/`):

- `sdd-cache-pre.sh` / `sdd-cache-post.sh`: cache documentation fetches with HTTP revalidation, for `source-driven-development`.
- `simplify-ignore.sh`: hide code marked `simplify-ignore-start/end` from refactors.
- `session-start.sh`: injects the routing meta-skill. Only for agents without native skill routing; not needed for Claude Code or Codex.

Candidates for our own: a pre-commit guard that blocks new test skips or lint suppressions (enforces `rules/testing.md`).
