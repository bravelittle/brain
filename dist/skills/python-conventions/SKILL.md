---
name: python-conventions
description: Applies the house conventions for Python code. Use when writing, reviewing or setting up code in a repo with a pyproject.toml, requirements file or .py sources, including services, data scripts and CLIs.
---

# Python Conventions

## Overview

House defaults for Python repos. They sit under the repo's own `AGENTS.md`: when the repo already chose differently, follow the repo.

## When to Use

- Writing or changing `.py` files
- Setting up a new Python repo
- Reviewing a Python diff

**When NOT to use:** the repo's `AGENTS.md` names a different toolchain; follow that instead.

## Process

1. **Discover the toolchain first.** Read `pyproject.toml`, the lockfile (`uv.lock`, `poetry.lock`, `requirements*.txt`) and CI config. Use that tool and those commands.
2. **Defaults for new repos:**
    - uv for environments, dependencies and running (`uv sync`, `uv run`); Python version pinned in `.python-version` and `requires-python`.
    - All configuration in `pyproject.toml`; `src/` layout.
    - Ruff for linting and formatting; mypy (or pyright) in strict mode.
    - pytest for tests, in `tests/`.
    - CI runs `ruff format --check`, `ruff check`, `mypy`, `pytest`.
3. **Types:**
    - Type hints on every function signature; no bare `Any` without a comment saying why.
    - Validate external data (HTTP bodies, env vars, files) at the boundary with Pydantic or dataclasses plus explicit checks.
4. **Code:**
    - `snake_case` for functions, variables and modules; `PascalCase` for classes; `UPPER_SNAKE_CASE` for constants.
    - `pathlib` over `os.path`; f-strings over `%` or `.format`.
    - Catch specific exceptions only; never bare `except:` or `except Exception: pass`.
    - `logging` with a module logger, not `print`, in library and service code.
    - No mutable default arguments.

## Common Rationalizations

| Rationalization | Reality |
| --- | --- |
| "It's just a script, types don't matter" | Scripts become services. Hints cost seconds and catch the bug before it runs. |
| "`except Exception` keeps it from crashing" | It hides the failure. Catch what you can handle; let the rest surface. |
| "I'll `pip install` it globally" | Unpinned, unreproducible. Add it through the project's tool so the lockfile records it. |

## Red Flags

- `# type: ignore` or `# noqa` added in the diff
- Bare `except`, or exceptions swallowed silently
- `print` debugging left in
- Dependencies added without updating the lockfile

## Verification

- [ ] Format check, lint, type check and tests pass locally
- [ ] No new suppressions
- [ ] External input is validated
