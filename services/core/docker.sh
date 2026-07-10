#!/usr/bin/env bash

set -euo pipefail

INFRA="$HOME/infrastructure"

compose() {

    local SERVICE="$1"
    shift

    local DIR="$INFRA/compose/$SERVICE"

    if [[ ! -d "$DIR" ]]; then
        echo "Serviço '$SERVICE' não encontrado."
        exit 1
    fi

    (
        cd "$DIR"

        docker compose \
            --env-file "$INFRA/.env" \
            "$@"
    )

}
