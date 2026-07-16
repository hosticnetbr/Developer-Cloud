#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

source "$HOME/Developer-Cloud/scripts/modules/metadata.sh"

module_env() {

    generate_envs "$@"

}
