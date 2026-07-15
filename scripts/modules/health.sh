#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib.sh"

module_health() {

    local MODULE="$1"

    module_has "$MODULE" health.conf || return

    cat "$(module_file "$MODULE" health.conf)"

}
