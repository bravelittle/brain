#!/usr/bin/env bash
# Pull a newer release of addyosmani/agent-skills into upstream/, then rebuild.
# Usage: scripts/sync-upstream.sh <tag>   e.g. scripts/sync-upstream.sh 0.6.14
set -euo pipefail
TAG="${1:?usage: sync-upstream.sh <tag>}"
cd "$(dirname "$0")/.."
git subtree pull --prefix upstream/addyosmani-agent-skills \
  https://github.com/addyosmani/agent-skills "$TAG" --squash \
  -m "Update addyosmani/agent-skills to $TAG"
scripts/build.sh
echo "Review new or renamed skills, rate them in catalog.tsv, and commit dist/ and CATALOG.md."
