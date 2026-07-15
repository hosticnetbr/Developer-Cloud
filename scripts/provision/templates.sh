#!/usr/bin/env bash

source "$HOME/Developer-Cloud/scripts/modules/compose.sh"

append_service() {

    local PROJECT="$1"
    local SERVICE="$2"

    {
        echo
        echo "  ${SERVICE}:"
        append_module_compose "$PROJECT" "$SERVICE" \
            | sed 's/^/    /'
    } >> "$COMPOSE"

}

prepare_templates() {
    local PROJECT="$1"
    COMPOSE="$HOME/workspace/$PROJECT/docker/docker-compose.generated.yml"

    cat > "$COMPOSE" <<EOF
services:
EOF

    for SERVICE in \
        redis \
        mailpit \
        minio \
        evolution \
        n8n
    do
        VALUE=$(manifest_value "$PROJECT" "$SERVICE")
        [[ "$VALUE" != "true" ]] && continue
        append_service "$PROJECT" "$SERVICE"
    done

    cat >> "$COMPOSE" <<EOF

networks:
  developer-cloud:
    external: true
EOF

    echo
    echo "[OK] docker-compose.generated.yml criado."
}
