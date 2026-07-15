#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/loader.sh"

module_has() {

    local MODULE="$1"
    local FILE="$2"

    [[ -f "$(module_file "$MODULE" "$FILE")" ]]

}

module_read() {

    local MODULE="$1"
    local FILE="$2"

    cat "$(module_file "$MODULE" "$FILE")"

}
