#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$HOME/Developer-Cloud/scripts/modules/metadata.sh"

module_health() {

    local MODULE="$1"

    module_ready "$MODULE" || return
    module_has_health "$MODULE" health.conf || return

    cat "$(module_file "$MODULE" health.conf)"

}
