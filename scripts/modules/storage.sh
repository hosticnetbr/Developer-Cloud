#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$HOME/Developer-Cloud/scripts/modules/metadata.sh"

module_volumes() {

    local MODULE="$1"

    module_ready "$MODULE" || return
    module_has_volumes "$MODULE" volumes.conf || return

    grep -v '^#' \
        "$(module_file "$MODULE" volumes.conf)" \
        | sed '/^$/d'

}
