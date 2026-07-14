#!/usr/bin/env bash

generate_manifest() {

    local PROJECT="$1"

    local FILE="$HOME/workspace/$PROJECT/.developer-cloud.json"

    sed \
        -e "s/{{PROJECT}}/$PROJECT/g" \
        -e "s/{{DATE}}/$(date --iso-8601=seconds)/g" \
        "$HOME/Developer-Cloud/templates/project/.developer-cloud.json" \
        > "$FILE"

    sed -i \
        -e "s/\"frontend\": \"\"/\"frontend\": \"$FRONTEND\"/" \
        -e "s/\"backend\": \"\"/\"backend\": \"$BACKEND\"/" \
        -e "s/\"database\": \"\"/\"database\": \"$DATABASE\"/" \
        "$FILE"

    sed -i \
        -e "s/\"redis\": false/\"redis\": $REDIS/" \
        -e "s/\"mailpit\": false/\"mailpit\": $MAILPIT/" \
        -e "s/\"minio\": false/\"minio\": $MINIO/" \
        -e "s/\"evolution\": false/\"evolution\": $EVOLUTION/" \
        -e "s/\"n8n\": false/\"n8n\": $N8N/" \
        -e "s/\"supabase\": false/\"supabase\": $SUPABASE/" \
        "$FILE"


}
