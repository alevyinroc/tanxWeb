#!/usr/bin/env bash
# Builds the site and runs a local preview at http://localhost:4000/
# Pages rebuild automatically when you save a file. Press Ctrl+C to stop.
# (Changes to _config.yml need a restart.)
set -euo pipefail
cd "$(dirname "$0")"

[ -d vendor/bundle ] || ./setup.sh

exec bundle exec jekyll serve --livereload "$@"
