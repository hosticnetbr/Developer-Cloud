#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common/init.sh"

dcp_title "Portainer"

cd "$HOME/infrastructure/compose/portainer"

docker compose up -d

dcp_success "Portainer iniciado."
