# Security

- No secrets, tokens or credentials in code, commits, logs or prompts. Use the project's secret store.
- Validate and encode all untrusted input: user input, files, network responses, and LLM output.
- Least privilege for tokens, service accounts and CI jobs.
- New dependencies follow `rules/dependencies.md`.
- Destructive operations (deletes, migrations, production changes) need explicit human approval.

Skills: `security-and-hardening`. Checklist: `upstream/addyosmani-agent-skills/references/security-checklist.md`.
