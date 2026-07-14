#!/usr/bin/env bash

validate_compose() {

    local PROJECT="$1"

    local FILE="$HOME/workspace/$PROJECT/docker/docker-compose.generated.yml"

    echo

    echo "[INFO] Validando docker-compose..."

    docker compose -f "$FILE" config >/dev/null

    echo "[OK] docker-compose válido."

}
