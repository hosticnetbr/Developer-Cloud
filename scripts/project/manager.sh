#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ACTION="${1:-}"

PROJECT="${2:-}"

if [[ -z "$ACTION" ]]; then
    echo
    echo "Uso:"
    echo "  dc project {up|down|restart|logs|ps|list|info} <projeto>"
    echo
    exit 1
fi

case "$ACTION" in

up)
    exec "$SCRIPT_DIR/actions/up.sh" "$PROJECT"
    ;;

down)
    exec "$SCRIPT_DIR/actions/down.sh" "$PROJECT"
    ;;

restart)
    exec "$SCRIPT_DIR/actions/restart.sh" "$PROJECT"
    ;;

logs)
    exec "$SCRIPT_DIR/actions/logs.sh" "$PROJECT"
    ;;

ps)
    exec "$SCRIPT_DIR/actions/ps.sh" "$PROJECT"
    ;;

list)
    exec "$SCRIPT_DIR/list.sh"
    ;;

info)
    exec "$SCRIPT_DIR/info.sh" "$PROJECT"
    ;;

*)
    echo
    echo "Ação inválida."
    echo
    exit 1
    ;;

esac
