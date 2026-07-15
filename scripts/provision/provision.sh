#!/usr/bin/env bash

set -e

PROVISION_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$PROVISION_DIR/lib.sh"
source "$PROVISION_DIR/services.sh"
source "$PROVISION_DIR/templates.sh"
source "$PROVISION_DIR/storage.sh"
source "$PROVISION_DIR/env.sh"
source "$PROVISION_DIR/validator.sh"
source "$PROVISION_DIR/start.sh"


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
