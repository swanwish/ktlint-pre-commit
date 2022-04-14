#!/bin/sh
set -e -o pipefail

if ! command -v ktlint &> /dev/null ; then
    echo "ktlint not installed or available in the PATH" >&2
    exit 1
fi

# https://github.com/pinterest/ktlint pre-commit hook
git diff --name-only --cached --relative | grep '\.kt[s"]\?$' | xargs ktlint --relative --color
if [ $? -ne 0 ]; then exit 1; fi
