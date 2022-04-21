#!/bin/sh
set -e -o pipefail

if ! command -v ktlint &> /dev/null ; then
    echo "ktlint not installed or available in the PATH" >&2
    exit 1
fi

args=""
for arg in "$@"; do
    if [[ $arg =~ ^\-.* ]]; then
        args="$args $arg"
    fi
done

# https://github.com/pinterest/ktlint pre-commit hook
git diff --name-only --cached --relative | grep '\.kt[s"]\?$' | xargs ktlint --relative $args
if [ $? -ne 0 ]; then exit 1; fi
