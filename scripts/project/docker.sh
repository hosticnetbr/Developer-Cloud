#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ROOT="$HOME/Developer-Cloud"

PROJECTS="$ROOT/services/projects/projects.conf"

source "$SCRIPT_DIR/validator.sh"

get_project_path() {

    local PROJECT="$1"

    grep "^${PROJECT}=" "$PROJECTS" | cut -d= -f2

}

run_compose() {

    local PROJECT="$1"

    validate_project "$PROJECT"

    shift

    local PATH_PROJECT

    PATH_PROJECT=$(get_project_path "$PROJECT")

    if [[ -z "$PATH_PROJECT" ]]; then
        echo "[ERROR] Projeto '$PROJECT' não encontrado."
        exit 1
    fi

    docker compose \
        -p "$PROJECT" \
        --project-directory "$PATH_PROJECT" \
        -f "$PATH_PROJECT/docker/docker-compose.yml" \
        --env-file "$PATH_PROJECT/.env" \
        "$@"

}
