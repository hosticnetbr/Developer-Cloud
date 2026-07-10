

#!/usr/bin/env bash

set -euo pipefail

SERVICE="$1"

source "$HOME/Developer-Cloud/services/core/docker.sh"

compose "$SERVICE" up -d
