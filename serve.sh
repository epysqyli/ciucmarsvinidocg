#!/usr/bin/env bash
# Serve the site locally.
#   ./serve.sh                → http://localhost:4000
#   ./serve.sh --livereload   → extra flags are passed to `jekyll serve`
set -euo pipefail

cd "$(dirname "$0")"

# Jekyll may be installed as a user gem (e.g. via rbenv) and not on PATH yet.
if ! command -v jekyll >/dev/null 2>&1 && command -v ruby >/dev/null 2>&1; then
  GEM_BIN="$(ruby -e 'puts Gem.user_dir' 2>/dev/null || true)/bin"
  if [ -x "$GEM_BIN/jekyll" ]; then
    export PATH="$GEM_BIN:$PATH"
  fi
fi

if ! command -v jekyll >/dev/null 2>&1; then
  echo "Jekyll not found." >&2
  echo "Install it with:  gem install jekyll jekyll-sitemap" >&2
  echo "or run:           bundle install && bundle exec jekyll serve" >&2
  exit 1
fi

echo "Serving the site at http://localhost:4000 (Ctrl+C to stop)"
exec jekyll serve --baseurl "" "$@"
