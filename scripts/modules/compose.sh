#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/metadata.sh"

module_has_compose() {

    local MODULE="$1"

    module_ready "$MODULE" || return
    module_has_compose "$MODULE" || return

    grep -qE '^[[:space:]]*(image:|build:)' \
        "$(module_file "$MODULE" compose.yml)"

}

append_module_compose() {

    local PROJECT="$1"
    local MODULE="$2"

    module_has_compose "$MODULE" || return

    echo "  $MODULE:"

    sed "s/{{PROJECT}}/$PROJECT/g" \
        "$(module_file "$MODULE" compose.yml)" \
        | sed 's/^/    /'

}
