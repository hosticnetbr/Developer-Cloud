#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"
INFRA="$HOME/infrastructure"

REGISTRY="$ROOT/services/registry/services.conf"

get_service_path() {

    local SERVICE="$1"

    local RELATIVE

    RELATIVE=$(grep "^${SERVICE}=" "$REGISTRY" | cut -d= -f2)

    [[ -z "$RELATIVE" ]] && return 1

    echo "$INFRA/$RELATIVE"

}
