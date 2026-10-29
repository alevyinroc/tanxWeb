#!/usr/bin/env bash
# One-time setup on Mac/Linux: installs the Ruby gems this site needs into
# vendor/bundle (no sudo needed). Run again any time the Gemfile changes.
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v ruby >/dev/null 2>&1; then
  echo "Ruby was not found. Install it first - see 'Mac setup' in README.md" >&2
  exit 1
fi

# macOS ships an old system Ruby (2.6) that is too old for Jekyll 4.
if ! ruby -e 'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.0") ? 0 : 1)'; then
  echo "Ruby $(ruby -e 'print RUBY_VERSION') is too old; Ruby 3.0 or newer is required." >&2
  echo "See 'Mac setup' in README.md." >&2
  exit 1
fi

ruby -v
bundle config set --local path vendor/bundle
bundle install
echo
echo "Setup complete. Run ./serve.sh to preview the site."
