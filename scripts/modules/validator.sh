#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

source "$ROOT/scripts/provision/validator.sh"

module_validator() {

    validate_compose "$@"

}
