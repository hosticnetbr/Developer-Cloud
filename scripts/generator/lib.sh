#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

TEMPLATE="$ROOT/templates/project"

WORKSPACE="$HOME/workspace"

source "$ROOT/lib/templates/render.sh"

copy_template() {

    local NAME="$1"

    mkdir -p "$WORKSPACE/$NAME"

    cp -a "$TEMPLATE"/. "$WORKSPACE/$NAME/"

}

create_env() {

    local NAME="$1"

    render_template \
        "$ROOT/templates/project/.env.example" \
        "$WORKSPACE/$NAME/.env" \
        "$NAME"

}

create_compose() {

    local NAME="$1"

    mkdir -p "$WORKSPACE/$NAME/docker"

    render_template \
        "$ROOT/templates/project/docker/docker-compose.yml" \
        "$WORKSPACE/$NAME/docker/docker-compose.yml" \
        "$NAME"

}

register_project() {

    local NAME="$1"

    local FILE="$ROOT/services/projects/projects.conf"

    touch "$FILE"

    grep -q "^${NAME}=" "$FILE" 2>/dev/null && return

    echo "${NAME}=$WORKSPACE/$NAME" >> "$FILE"

}
