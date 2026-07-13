#!/usr/bin/env bash

generate_manifest() {

    local PROJECT="$1"

    local FILE="$HOME/workspace/$PROJECT/.developer-cloud.json"

    sed \
        -e "s/{{PROJECT}}/$PROJECT/g" \
        -e "s/{{DATE}}/$(date --iso-8601=seconds)/g" \
        "$HOME/Developer-Cloud/templates/project/.developer-cloud.json" \
        > "$FILE"

}
