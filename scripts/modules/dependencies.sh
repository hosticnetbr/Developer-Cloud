#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

source "$ROOT/scripts/generator/dependencies.sh"

module_dependencies() {

    resolve_dependencies "$@"

}
