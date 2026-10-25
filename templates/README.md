# Templates

`repo/` holds the files every new repo starts with (see `rules/repo-baseline.md`). Copy them in, then fill in the `AGENTS.md` placeholders:

```bash
cp -R templates/repo/. /path/to/new-repo/
```

Add a language's `.gitignore` from [github/gitignore](https://github.com/github/gitignore), and the CI workflow for the stack.
