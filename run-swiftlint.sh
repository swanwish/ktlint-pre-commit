#!/bin/sh
set -e -o pipefail

lint=swiftlint
if ! command -v $lint &> /dev/null ; then
  echo "$lint not installed or available in the PATH" >&2
  exit 1
fi

args=""
for arg in "$@"; do
    if [[ $arg =~ ^\-.* ]]; then
        args="$args $arg"
    fi
done

# https://github.com/realm/SwiftLint
git diff --name-only --cached --relative | grep '\.swift$' | xargs $lint $args
if [ $? -ne 0 ]; then exit 1; fi
