#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../docker.sh"

PROJECT="$1"

run_compose "$PROJECT" logs -f
