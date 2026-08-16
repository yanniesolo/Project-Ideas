#!/usr/bin/env bash
# Create a new idea file from templates/idea.md.
#
#   ./scripts/new-idea.sh "Immich photo server"
#   -> ideas/immich-photo-server.md

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
template="$repo_root/templates/idea.md"

if [ $# -eq 0 ]; then
  echo "usage: $(basename "$0") \"Idea title\"" >&2
  exit 1
fi

title="$*"

slug="$(printf '%s' "$title" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')"

if [ -z "$slug" ]; then
  echo "error: title '$title' has no usable characters for a filename" >&2
  exit 1
fi

target="$repo_root/ideas/$slug.md"

if [ -e "$target" ]; then
  echo "error: $target already exists" >&2
  exit 1
fi

today="$(date +%F)"

# Escape characters that are special on the right-hand side of an s|…|…|
# command, so titles like "Plex / Jellyfin & friends" survive intact.
repl="${title//\\/\\\\}"
repl="${repl//|/\\|}"
repl="${repl//&/\\&}"

mkdir -p "$repo_root/ideas"
sed -e "s|^title: TITLE$|title: $repl|" \
    -e "s|^# TITLE$|# $repl|" \
    -e "s|^created: DATE$|created: $today|" \
    -e "s|^updated: DATE$|updated: $today|" \
    "$template" > "$target"

echo "$target"
