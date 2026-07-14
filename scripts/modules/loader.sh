#!/usr/bin/env bash

MODULES="$HOME/Developer-Cloud/templates/services"

module_exists() {

    local MODULE="$1"

    [[ -d "$MODULES/$MODULE" ]]

}

module_path() {

    local MODULE="$1"

    echo "$MODULES/$MODULE"

}
