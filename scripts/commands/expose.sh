#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

exec "$ROOT/scripts/traefik/expose.sh" "$@"
