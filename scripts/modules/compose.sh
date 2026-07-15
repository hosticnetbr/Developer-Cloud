#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib.sh"

append_module_compose() {

    local PROJECT="$1"
    local MODULE="$2"

    module_has "$MODULE" compose.yml || return

    sed "s/{{PROJECT}}/$PROJECT/g" \
        "$(module_file "$MODULE" compose.yml)"

}
