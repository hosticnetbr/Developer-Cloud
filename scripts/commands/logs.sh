#!/usr/bin/env bash

set -euo pipefail

SERVICE="${1:-}"

if [[ -z "$SERVICE" ]]; then
    echo "Uso:"
    echo "dc logs <servico>"
    exit 1
fi

source "$HOME/Developer-Cloud/services/core/docker.sh"

compose "$SERVICE" logs -f
