#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

PROJECTS="$ROOT/services/projects/projects.conf"

project_exists() {

    local PROJECT="$1"

    grep -q "^${PROJECT}=" "$PROJECTS"

}

project_path() {

    local PROJECT="$1"

    grep "^${PROJECT}=" "$PROJECTS" | cut -d= -f2

}

validate_project() {

    local PROJECT="$1"

    if ! project_exists "$PROJECT"; then
        echo "[ERROR] Projeto '$PROJECT' não encontrado."
        exit 1
    fi

    local PATH_PROJECT

    PATH_PROJECT=$(project_path "$PROJECT")

    if [[ ! -d "$PATH_PROJECT" ]]; then
        echo "[ERROR] Workspace inexistente."
        exit 1
    fi

    if [[ ! -f "$PATH_PROJECT/.env" ]]; then
        echo "[ERROR] Arquivo .env não encontrado."
        exit 1
    fi

    if [[ ! -f "$PATH_PROJECT/docker/docker-compose.yml" ]]; then
        echo "[ERROR] docker-compose.yml não encontrado."
        exit 1
    fi

}
