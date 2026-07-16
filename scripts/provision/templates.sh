#!/usr/bin/env bash

source "$HOME/Developer-Cloud/scripts/modules/compose.sh"

append_service() {

    local PROJECT="$1"
    local MODULE="$2"

    module_has_compose "$MODULE" || return

    {
        echo
        append_module_compose "$PROJECT" "$MODULE"
    } >> "$COMPOSE"

}

prepare_templates() {
    local PROJECT="$1"
    COMPOSE="$HOME/workspace/$PROJECT/docker/docker-compose.generated.yml"

    cat > "$COMPOSE" <<EOF
services:
EOF

    for MODULE in "$HOME"/Developer-Cloud/templates/services/*
    do
        MODULE=$(basename "$MODULE")

        VALUE=$(manifest_value "$PROJECT" "$MODULE")

        [[ "$VALUE" != "true" ]] && continue

        append_service "$PROJECT" "$MODULE"
    done

    cat >> "$COMPOSE" <<EOF

networks:
  developer-cloud:
    external: true
EOF

    echo
    echo "[OK] docker-compose.generated.yml criado."
}
