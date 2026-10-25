#!/usr/bin/env bash
# SessionStart hook: puts the brain's house rules into every session where the plugin is installed.
# Emits the standard SessionStart JSON envelope; falls back to plain text, which Claude Code also
# adds to the session context, when neither python3 nor jq is available.
set -euo pipefail

RULES="$(dirname "$0")/../house-rules.md"
[ -f "$RULES" ] || exit 0

if command -v python3 >/dev/null 2>&1; then
  python3 -c 'import json,sys; print(json.dumps({"hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": open(sys.argv[1]).read()}}))' "$RULES"
elif command -v jq >/dev/null 2>&1; then
  jq -cn --rawfile ctx "$RULES" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
else
  cat "$RULES"
fi
