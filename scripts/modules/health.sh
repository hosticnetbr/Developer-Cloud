#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

source "$ROOT/scripts/health/check.sh"

module_health() {

    health_check "$@"

}
