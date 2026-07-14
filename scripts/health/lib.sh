#!/usr/bin/env bash

wait_http() {

    local URL="$1"
    local NAME="$2"
    local TIMEOUT="${3:-120}"

    local ELAPSED=0

    echo
    echo "[INFO] Aguardando $NAME..."

    while true
    do
        if curl -fs "$URL" >/dev/null 2>&1
        then
            echo "[OK] $NAME disponível."
            return 0
        fi

        sleep 2

        ELAPSED=$((ELAPSED+2))

        if [ "$ELAPSED" -ge "$TIMEOUT" ]
        then
            echo "[ERROR] Timeout aguardando $NAME"
            return 1
        fi
    done

}

wait_tcp() {

    local HOST="$1"
    local PORT="$2"
    local NAME="$3"
    local TIMEOUT="${4:-120}"

    local ELAPSED=0

    echo
    echo "[INFO] Aguardando $NAME..."

    while true
    do

        if nc -z "$HOST" "$PORT" >/dev/null 2>&1
        then
            echo "[OK] $NAME disponível."
            return 0
        fi

        sleep 2

        ELAPSED=$((ELAPSED+2))

        if [ "$ELAPSED" -ge "$TIMEOUT" ]
        then
            echo "[ERROR] Timeout aguardando $NAME"
            return 1
        fi

    done

}
