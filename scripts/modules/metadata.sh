#!/usr/bin/env bash

source "$HOME/Developer-Cloud/scripts/modules/lib.sh"

module_has_compose() {
    module_has "$1" compose.yml
}

module_has_env() {
    module_has "$1" env.example
}

module_has_dependencies() {
    module_has "$1" dependencies.conf
}

module_has_health() {
    module_has "$1" health.conf
}

module_has_postinstall() {
    module_has "$1" post-install.sh
}

module_has_volumes() {
    module_has "$1" volumes.conf
}

module_has_services() {
    module_has "$1" services.list
}

module_ready() {

    local MODULE="$1"

    module_is_implemented "$MODULE"

}
