#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib.sh"

module_volumes() {

    local MODULE="$1"

    module_has "$MODULE" volumes.conf || return

    grep -v '^#' \
        "$(module_file "$MODULE" volumes.conf)" \
        | sed '/^$/d'

}
