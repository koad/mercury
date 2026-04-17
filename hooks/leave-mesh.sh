#!/usr/bin/env bash
#
# Mercury — leave the mesh
#
# Stops the opencode serve instance.
#
# Usage:
#   bash ~/.mercury/hooks/leave-mesh.sh
#

MESH_PORT="${MESH_PORT:-3003}"

PID=$(lsof -ti :${MESH_PORT} 2>/dev/null)
if [ -n "$PID" ]; then
  kill "$PID" 2>/dev/null
  echo "mercury left mesh (killed PID $PID)"
else
  echo "mercury was not on the mesh"
fi
