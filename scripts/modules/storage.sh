#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

source "$ROOT/scripts/provision/storage.sh"

module_storage() {

    create_storage "$@"

}
