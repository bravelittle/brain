# Security

- No secrets, tokens or credentials in code, commits, logs or prompts. Use the project's secret store.
- Validate and encode all untrusted input: user input, files, network responses, and LLM output.
- New dependencies need a reason, a maintained upstream and a clean audit.
- Destructive operations (deletes, migrations, production changes) need explicit human approval.

Skills: `security-and-hardening`. Checklist: `upstream/addyosmani-agent-skills/references/security-checklist.md`.
