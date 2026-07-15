#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

source "$ROOT/scripts/provision/env.sh"

module_env() {

    generate_envs "$@"

}
