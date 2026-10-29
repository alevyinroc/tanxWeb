#!/usr/bin/env bash
# Builds the site into _site/ (the same way GitHub does), without starting a
# server. Useful for checking for errors before you commit.
set -euo pipefail
cd "$(dirname "$0")"

[ -d vendor/bundle ] || ./setup.sh

bundle exec jekyll build "$@"
echo "Build succeeded. Output is in _site/"
