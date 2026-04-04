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
NVM_INIT="source \$HOME/.nvm/nvm.sh && nvm use 24 --silent && export PATH=/opt/homebrew/bin:\$PATH"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

if [ -n "$PROMPT" ]; then
  # Non-interactive: send task, get response
  ssh "$MERCURY_HOST" "zsh -c '$NVM_INIT && cd $MERCURY_DIR && claude --dangerously-skip-permissions -c -p \"$PROMPT\"' 2>&1"
else
  # Interactive: open live terminal portal to Mercury on fourty4
  exec ssh -t "$MERCURY_HOST" "zsh -c '$NVM_INIT && cd $MERCURY_DIR && claude --dangerously-skip-permissions -c'"
fi
