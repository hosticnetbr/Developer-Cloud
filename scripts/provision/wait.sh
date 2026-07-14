#!/usr/bin/env bash

wait_container() {

    local CONTAINER="$1"

    local TIMEOUT="${2:-120}"

    local COUNT=0

    echo
    echo "[INFO] Aguardando $CONTAINER..."

    while true; do

        STATUS=$(docker inspect \
            --format '{{.State.Status}}' \
            "$CONTAINER" 2>/dev/null)

        if [[ "$STATUS" == "running" ]]; then

            echo "[OK] $CONTAINER está em execução."

            return

        fi

        sleep 2

        COUNT=$((COUNT+2))

        if [[ "$COUNT" -ge "$TIMEOUT" ]]; then

            echo "[ERROR] Timeout aguardando $CONTAINER"

            exit 1

        fi

    done

}
