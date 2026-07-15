#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib.sh"

module_dependencies() {

    local MODULE="$1"

    module_has "$MODULE" dependencies.conf || return

    grep -v '^#' \
        "$(module_file "$MODULE" dependencies.conf)" \
        | sed '/^$/d'

}
