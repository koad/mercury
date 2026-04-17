#!/usr/bin/env bash
#
# Mercury — join the mesh
#
# Sources the full identity stack, then starts opencode serve.
#
# Usage:
#   source ~/.mercury/hooks/join-mesh.sh
#

# Framework defaults
source "$HOME/.koad-io/.env" 2>/dev/null || true

# Entity identity (overrides ENTITY, paths, git config, etc.)
export ENTITY=mercury
source "$HOME/.mercury/.env" 2>/dev/null || true

# Ensure config dir points to Mercury
export OPENCODE_CONFIG_DIR="$HOME/.mercury"
export CLAUDE_CONFIG_DIR="$HOME/.mercury"
export ENTITY_DIR="$HOME/.mercury"

MESH_PORT="${MESH_PORT:-3003}"
BIND_IP="${KOAD_IO_BIND_IP:-127.0.0.1}"

# Start opencode serve
cd "$HOME/.mercury" && opencode serve --port "$MESH_PORT" --hostname "$BIND_IP" > /dev/null 2>&1 &
echo "mercury joined mesh → ${BIND_IP}:${MESH_PORT} (PID $!)"
