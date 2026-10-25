# Own skills

One folder per skill: `skills/<name>/SKILL.md`, following the [Agent Skills spec](https://agentskills.io) and the upstream anatomy (`upstream/addyosmani-agent-skills/docs/skill-anatomy.md`): frontmatter with `name` and `description` only, then Overview, When to Use, Process, Common Rationalizations, Red Flags, Verification.

- **New skill:** pick a name no upstream skill uses, add a row to `catalog.tsv`, run `scripts/build.sh`.
- **Override:** copy `upstream/addyosmani-agent-skills/skills/<name>/` here under the same name and edit. The build uses this copy instead. Keep the upstream MIT notice in mind: note in the file that it is derived from agent-skills.
