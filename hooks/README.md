# Hooks

Hook scripts plus the settings snippet that wires each one. Not wired into the plugin yet.

Upstream hooks worth adopting (see `upstream/addyosmani-agent-skills/hooks/`):

- `sdd-cache-pre.sh` / `sdd-cache-post.sh`: cache documentation fetches with HTTP revalidation, for `source-driven-development`.
- `simplify-ignore.sh`: hide code marked `simplify-ignore-start/end` from refactors.
- `session-start.sh`: injects the routing meta-skill. Only for agents without native skill routing; not needed for Claude Code or Codex.

Candidates for our own: a pre-commit guard that blocks new test skips or lint suppressions (enforces `rules/testing.md`).
