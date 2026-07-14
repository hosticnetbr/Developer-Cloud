#!/usr/bin/env bash

generate_envs() {

    local PROJECT="$1"

    local ROOT="$HOME/workspace/$PROJECT/docker/env"

    mkdir -p "$ROOT"

    for SERVICE in \
        redis \
        minio \
        evolution \
        n8n
    do

        VALUE=$(manifest_value "$PROJECT" "$SERVICE")

        [[ "$VALUE" != "true" ]] && continue

        cat > "$ROOT/$SERVICE.env" <<EOF
PROJECT_NAME=$PROJECT
SERVICE_NAME=$SERVICE
TZ=America/Sao_Paulo
EOF

    done

}
