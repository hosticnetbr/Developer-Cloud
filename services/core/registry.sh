#!/usr/bin/env bash

SERVICES_FILE="$HOME/Developer-Cloud/services/definitions/services.conf"

get_service_path() {

    local SERVICE="$1"

    grep "^${SERVICE}=" "$SERVICES_FILE" | cut -d '=' -f2

}
