#!/usr/bin/env bash

start_services() {
    local PROJECT="$1"
    local PROJECT_PATH="$HOME/workspace/$PROJECT"
    local FILE="$PROJECT_PATH/docker/docker-compose.generated.yml"

    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    source "$SCRIPT_DIR/wait.sh"
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
