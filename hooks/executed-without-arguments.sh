#!/usr/bin/env bash
set -euo pipefail
# Mercury — interactive or prompt-driven
# Usage: mercury                             → interactive Claude Code session
#        PROMPT="draft a post about X" mercury → non-interactive, identity + prompt
#        echo "draft a post about X" | mercury → non-interactive, stdin

IDENTITY="$HOME/.mercury/memories/001-identity.md"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

cd "$HOME/.mercury"

if [ -n "$PROMPT" ]; then
  exec claude -p "$(cat "$IDENTITY")

$PROMPT"
else
  exec claude . --model sonnet
fi
