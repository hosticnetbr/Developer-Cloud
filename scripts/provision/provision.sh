#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/lib.sh"
source "$SCRIPT_DIR/services.sh"
source "$SCRIPT_DIR/templates.sh"
source "$SCRIPT_DIR/storage.sh"
source "$SCRIPT_DIR/env.sh"
source "$SCRIPT_DIR/validator.sh"
source "$SCRIPT_DIR/start.sh"

PROJECT="$1"

if [[ -z "$PROJECT" ]]; then

    echo "Uso:"

    echo "dc provision <projeto>"

    exit 1

fi

print_services "$PROJECT"

prepare_templates "$PROJECT"

create_storage "$PROJECT"

generate_envs "$PROJECT"

validate_compose "$PROJECT"

start_services "$PROJECT"

echo
echo
echo "========== Resumo =========="
echo

echo "Projeto : $PROJECT"

echo "Manifesto : $(get_manifest "$PROJECT")"

echo "Compose : $HOME/workspace/$PROJECT/docker/docker-compose.generated.yml"

echo "Storage : $HOME/workspace/$PROJECT/storage"

echo "Env : $HOME/workspace/$PROJECT/docker/env"

echo "[OK] Provisionamento concluído."
