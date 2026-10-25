# brain

One central place for the coding procedures and rules our AI agents follow. The brain stores them once and publishes them as rules, skills, commands, subagents and hooks for Claude Code, Cursor, Codex and Gemini CLI.

It starts from [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) (MIT), vendored and pinned, with our own layer on top.

## How it is organised

| Path | What goes there | Loaded |
| --- | --- | --- |
| `AGENTS.md` | Short, always-on rules every agent reads (`CLAUDE.md` imports it) | Every turn |
| `rules/` | One-page policies by topic: git, code style, testing, security, dependencies, repo baseline | Every session (via hook) |
| `skills/` | Our own skills (`<name>/SKILL.md`). Same name as an upstream skill = replaces it | On demand |
| `agents/` | Our own subagent personas (override upstream by file name) | On demand |
| `commands/` | Our own slash-command harnesses | When invoked |
| `hooks/` | Hook scripts and `hooks.json`; `session-start.sh` injects the house rules into every session | On events |
| `templates/repo/` | Starter files for every new repo (`AGENTS.md`, PR template, `.editorconfig`) | When creating a repo |
| `references/` | Checklists that skills link to | Via skills |
| `evals/` | Tests for our own skills | CI / on demand |
| `upstream/addyosmani-agent-skills/` | Vendored upstream, pinned to a release. **Never edit.** | Build input |
| `catalog.tsv` | Our verdict on every upstream skill (core, adapt, optional, web, drop) | Build input |
| `dist/` | Generated merge of upstream and our layer. **Never edit.** | What agents install |
| `CATALOG.md` | Generated index of every skill in `dist/` | Read by humans |
| `adapters/` | Per-agent install notes; `adapters/claude/plugin.json` is the plugin manifest template | Build input / docs |
| `.claude-plugin/marketplace.json` | Lets Claude Code install `dist/` as the `brain` plugin | Install |

## Everyday workflow

```bash
scripts/build.sh                 # rebuild dist/ and CATALOG.md after any change
scripts/sync-upstream.sh 0.6.14  # take a newer upstream release, then rebuild
```

Commit `dist/` and `CATALOG.md` with your change, so agents installing from GitHub get the built output.

To change how an upstream skill behaves, copy it to `skills/<same-name>/`, edit the copy, and rebuild. To remove one, mark it `drop` in `catalog.tsv`.

## Install in Claude Code

```
/plugin install brain --marketplace bravelittle/brain
```

On Claude Code older than 2.1.275, run `/plugin marketplace add bravelittle/brain` and then `/plugin install brain@brain`. The repo is private, so the machine needs GitHub access to it.

Commands then appear as `/brain:spec`, `/brain:plan`, `/brain:build`, `/brain:test`, `/brain:review`, `/brain:ship` and more. The plugin's session-start hook loads `AGENTS.md` and `rules/` into every session, so the house rules apply in any repo with the plugin installed. Each repo adds its own `AGENTS.md` from `templates/repo/` for its stack and commands; that file wins where it differs. Other agents: see `adapters/`.

## Adding a new repo

1. Copy `templates/repo/` into it and fill in `AGENTS.md`.
2. Meet `rules/repo-baseline.md` (CI, branch protection, dependency updates).
3. Install the plugin. Language rules load on their own from the `<language>-conventions` skills; add a new one in `skills/` when a repo brings a new language.

## Licence

Our own files are MIT. Vendored files keep their original MIT licence and copyright (see `upstream/addyosmani-agent-skills/LICENSE`, copied to `dist/LICENSE-agent-skills`).
