#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

ENV_FILE="$HOME/infrastructure/.env"

source "$SCRIPT_DIR/lib.sh"

ACTION="$1"
SERVICE="$2"

PATH_SERVICE=$(get_service_path "$SERVICE")

if [[ -z "$PATH_SERVICE" ]]; then
    echo "[ERROR] Serviço não encontrado."
    exit 1
fi

cd "$PATH_SERVICE"

case "$ACTION" in

up)
docker compose --env-file "$ENV_FILE" up -d
;;

down)
docker compose --env-file "$ENV_FILE" down
;;

restart)
docker compose --env-file "$ENV_FILE" restart
;;

logs)
docker compose --env-file "$ENV_FILE" logs -f
;;

ps)
docker compose --env-file "$ENV_FILE" ps
;;

*)
echo "Uso:"
echo "service {up|down|restart|logs|ps} <serviço>"
;;

esac
