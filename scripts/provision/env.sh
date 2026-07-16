#!/usr/bin/env bash

source "$HOME/Developer-Cloud/scripts/modules/metadata.sh"

generate_envs() {

    local PROJECT="$1"

    local ROOT="$HOME/workspace/$PROJECT/docker/env"

    mkdir -p "$ROOT"

    for MODULE_DIR in "$HOME"/Developer-Cloud/templates/services/*
    do
        MODULE=$(basename "$MODULE_DIR")

        [[ "$VALUE" != "true" ]] && continue

        module_ready "$MODULE" || continue
        module_has_env "$MODULE" || continue

        cat > "$ROOT/$MODULE.env" <<EOF
PROJECT_NAME=$PROJECT
SERVICE_NAME=$MODULE
TZ=America/Sao_Paulo
EOF

    done

}
