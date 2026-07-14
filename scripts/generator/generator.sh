#!/usr/bin/env bash

set -ex

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "SCRIPT_DIR=$SCRIPT_DIR"

source "$SCRIPT_DIR/lib.sh"

source "$SCRIPT_DIR/manifest.sh"

source "$SCRIPT_DIR/wizard.sh"

source "$SCRIPT_DIR/dependencies.sh"

PROJECT="$1"

echo "Projeto: $PROJECT"

echo "1 - copy_template"
wizard_frontend
wizard_backend
wizard_database
wizard_services
resolve_dependencies
copy_template "$PROJECT"

echo "2 - create_env"
create_env "$PROJECT"

echo "3 - create_compose"
create_compose "$PROJECT"
generate_manifest "$PROJECT"

echo "4 - register_project"
register_project "$PROJECT"

echo "[OK] Generator finalizado"
