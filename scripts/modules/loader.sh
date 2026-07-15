#!/usr/bin/env bash

MODULES_DIR="$HOME/Developer-Cloud/templates/services"

module_exists() {

    local MODULE="$1"

    [[ -d "$MODULES_DIR/$MODULE" ]]

}

module_path() {

    local MODULE="$1"

    echo "$MODULES_DIR/$MODULE"

}

module_file() {

    local MODULE="$1"
    local FILE="$2"

    echo "$MODULES_DIR/$MODULE/$FILE"

}
