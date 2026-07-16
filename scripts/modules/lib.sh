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

module_conf() {

    module_file "$1" module.conf

}

module_is_implemented() {

    local MODULE="$1"

    module_has "$MODULE" module.conf || return 1

    grep -q "^IMPLEMENTED=true$" "$(module_conf "$MODULE")"

}
