#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ROOT="$HOME/Developer-Cloud"

source "$SCRIPT_DIR/validator.sh"

PROJECT="$1"

if [[ -z "$PROJECT" ]]; then
    echo "Uso:"
    echo "  dc project status <projeto>"
    exit 1
fi

validate_project "$PROJECT"

PROJECT_PATH=$(project_path "$PROJECT")

MANIFEST="$PROJECT_PATH/.developer-cloud.json"

ENV_FILE="$PROJECT_PATH/.env"

COMPOSE_FILE="$PROJECT_PATH/docker/docker-compose.yml"

DOMAIN=$(grep "^DOMAIN=" "$ENV_FILE" | cut -d= -f2)

RUNNING="Não"

if docker ps --format "{{.Names}}" | grep -qx "$PROJECT"; then
    RUNNING="Sim"
fi

echo
echo "========== Developer Cloud =========="
echo
printf "%-18s %s\n" "Projeto:" "$PROJECT"
printf "%-18s %s\n" "Workspace:" "$PROJECT_PATH"
printf "%-18s %s\n" "Docker:" "$RUNNING"
printf "%-18s %s\n" ".env:" "$(test -f "$ENV_FILE" && echo OK)"
printf "%-18s %s\n" "Compose:" "$(test -f "$COMPOSE_FILE" && echo OK)"
printf "%-18s %s\n" "Manifest:" "$(test -f "$MANIFEST" && echo OK)"
printf "%-18s %s\n" "Domínio:" "$DOMAIN"

echo

echo
echo "===== Stack ====="

grep -A4 '"stack"' "$MANIFEST"

echo
echo "===== Services ====="

grep -A10 '"services"' "$MANIFEST"
