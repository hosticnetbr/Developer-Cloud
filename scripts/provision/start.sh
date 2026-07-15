#!/usr/bin/env bash

wait_container() {
    local CONTAINER_NAME="$1"
    local MAX_ATTEMPTS=30
    local ATTEMPT=0
    
    echo "[INFO] Aguardando container $CONTAINER_NAME..."
    
    while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
        if docker inspect "$CONTAINER_NAME" &>/dev/null; then
            local STATUS=$(docker inspect --format='{{.State.Status}}' "$CONTAINER_NAME" 2>/dev/null)
            local HEALTH=$(docker inspect --format='{{.State.Health.Status}}' "$CONTAINER_NAME" 2>/dev/null)
            
            if [ "$STATUS" = "running" ] && ([ -z "$HEALTH" ] || [ "$HEALTH" = "healthy" ]); then
                echo "[OK] Container $CONTAINER_NAME está pronto."
                return 0
            fi
        fi
        sleep 2
        ATTEMPT=$((ATTEMPT + 1))
    done
    
    echo "[WARN] Timeout ao aguardar container $CONTAINER_NAME"
    return 1
}

start_services() {
    local PROJECT="$1"
    local PROJECT_PATH="$HOME/workspace/$PROJECT"
    local FILE="$PROJECT_PATH/docker/docker-compose.generated.yml"

    source "$HOME/Developer-Cloud/scripts/health/check.sh"

    echo
    echo "[INFO] Iniciando serviços..."

    docker compose \
        -p "$PROJECT" \
        --project-directory "$PROJECT_PATH" \
        -f "$FILE" \
        up -d

    CONTAINERS=$(docker compose \
        -p "$PROJECT" \
        --project-directory "$PROJECT_PATH" \
        -f "$FILE" \
        ps -q)

    for ID in $CONTAINERS; do
        NAME=$(docker inspect \
            --format '{{.Name}}' \
            "$ID")
        NAME="${NAME#/}"
        wait_container "$NAME"
    done
    health_check "$PROJECT"

    echo
    echo "[OK] Serviços iniciados."
}
