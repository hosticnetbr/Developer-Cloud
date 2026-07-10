#!/usr/bin/env bash

set -euo pipefail

ROOT="$HOME/Developer-Cloud"

COMMAND="${1:-help}"
shift || true

SCRIPT="$ROOT/scripts/commands/${COMMAND}.sh"

if [[ -f "$SCRIPT" ]]; then
    exec bash "$SCRIPT" "$@"
else
    echo ""
    echo "Comando '$COMMAND' não encontrado."
    echo ""
    echo "Execute:"
    echo "    dc help"
    echo ""
    exit 1
fi
