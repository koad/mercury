#!/usr/bin/env bash
set -euo pipefail
# Mercury — lives on fourty4. This hook connects any machine to her persistent session.
#
# Usage:
#   mercury                          → portal to Mercury's session on fourty4 (interactive)
#   PROMPT="draft a post" mercury    → send task to Mercury non-interactively
#   echo "draft a post" | mercury    → send task via stdin

MERCURY_HOST="fourty4"
MERCURY_DIR="\$HOME/.mercury"
SESSION_ID_FILE="\$HOME/.mercury/.session_id"
NVM_INIT="source \$HOME/.nvm/nvm.sh && nvm use 24 --silent"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

if [ -n "$PROMPT" ]; then
  # Non-interactive: send task to Mercury's persistent session, get response
  SESSION_ID=$(ssh "$MERCURY_HOST" "cat $SESSION_ID_FILE 2>/dev/null || echo ''")
  if [ -n "$SESSION_ID" ]; then
    ssh "$MERCURY_HOST" "zsh -c '$NVM_INIT && cd $MERCURY_DIR && claude --dangerously-skip-permissions --resume $SESSION_ID -p \"$PROMPT\"' 2>&1"
  else
    ssh "$MERCURY_HOST" "zsh -c '$NVM_INIT && cd $MERCURY_DIR && claude --dangerously-skip-permissions --name mercury-main -p \"$PROMPT\"' 2>&1"
  fi
else
  # Interactive: open a live portal to Mercury's session on fourty4
  SESSION_ID=$(ssh "$MERCURY_HOST" "cat $SESSION_ID_FILE 2>/dev/null || echo ''")
  if [ -n "$SESSION_ID" ]; then
    exec ssh -t "$MERCURY_HOST" "zsh -c '$NVM_INIT && cd $MERCURY_DIR && claude --dangerously-skip-permissions --resume $SESSION_ID'"
  else
    exec ssh -t "$MERCURY_HOST" "zsh -c '$NVM_INIT && cd $MERCURY_DIR && claude --dangerously-skip-permissions --name mercury-main'"
  fi
fi
