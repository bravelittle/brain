# Testing

- Every behaviour change ships with a test that fails without the change.
- Bug fixes start with a test that reproduces the bug.
- Never skip, delete, or loosen an existing test or assertion to make a build pass.
- Never add `@ts-ignore`, `eslint-disable`, `# noqa`, `//nolint` or similar to get to green without a comment explaining why and an issue to remove it.
- Run the focused test while working and the full suite before declaring done.

Skills: `test-driven-development`, `constraint-driven-development`, `debugging-and-error-recovery`.
