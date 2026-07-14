#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/loader.sh"

append_module_compose() {

    local PROJECT="$1"
    local MODULE="$2"

    local FILE

    FILE=$(module_path "$MODULE")/compose.yml

    [[ -f "$FILE" ]] || return

    sed "s/{{PROJECT}}/$PROJECT/g" "$FILE"
}
