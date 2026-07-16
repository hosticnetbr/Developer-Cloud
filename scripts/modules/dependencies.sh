#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$HOME/Developer-Cloud/scripts/modules/metadata.sh"

module_dependencies() {

    local MODULE="$1"

    module_ready "$MODULE" || return
    module_has_dependencies "$MODULE" dependencies.conf || return

    grep -v '^#' \
        "$(module_file "$MODULE" dependencies.conf)" \
        | sed '/^$/d'

}
