#!/usr/bin/env bash
set -euo pipefail
# Mercury — lives on fourty4. This hook connects any machine to her session there.
# Hardcoded host is OK for now; daemon state machine will route this properly when live.
#
# Usage:
#   mercury                          → portal to Mercury on fourty4 (interactive)
#   PROMPT="draft a post" mercury    → send task non-interactively, get response
#   echo "draft a post" | mercury    → send task via stdin

MERCURY_HOST="fourty4"
MERCURY_DIR="\$HOME/.mercury"
CLAUDE_BIN="\$HOME/.nvm/versions/node/v24.14.0/bin/claude"
NVM_INIT="export PATH=/opt/homebrew/bin:\$HOME/.nvm/versions/node/v24.14.0/bin:\$PATH"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

if [ -n "$PROMPT" ]; then
  # Non-interactive: send task, return only the result (JSON format — no tool echoes)
  ssh "$MERCURY_HOST" "$NVM_INIT && cd $MERCURY_DIR && claude --model sonnet --dangerously-skip-permissions -c --output-format=json -p '$PROMPT' 2>/dev/null" \
    | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('result',''))"
else
  # Interactive: open live terminal portal to Mercury on fourty4
  exec ssh -t "$MERCURY_HOST" "$NVM_INIT && cd $MERCURY_DIR && claude --model sonnet --dangerously-skip-permissions -c"
fi
