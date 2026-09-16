#!/usr/bin/env bash
# Commit and push the whole repo to origin/main, one dataset pack per push
# so no single push exceeds GitHub's size limits. Safe to re-run: packs that
# are already committed are skipped.
set -euo pipefail
cd "$(dirname "$0")"

BRANCH=main
REMOTE=origin

for pack in dataset/pack_*/; do
    pack=${pack%/}
    if [ -z "$(git status --porcelain -- "$pack")" ]; then
        echo "skip  $pack (already committed)"
        continue
    fi
    echo "push  $pack"
    git add -- "$pack"
    git commit -q -m "Add $(basename "$pack")"
    git push "$REMOTE" "$BRANCH"
done

# Everything else: README, index.csv, this script, etc.
git add -A
if ! git diff --cached --quiet; then
    git commit -q -m "Update dataset metadata"
    git push "$REMOTE" "$BRANCH"
fi

echo "done"
