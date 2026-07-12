#!/usr/bin/env bash

set -ex

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "SCRIPT_DIR=$SCRIPT_DIR"

source "$SCRIPT_DIR/lib.sh"

source "$SCRIPT_DIR/manifest.sh"

PROJECT="$1"

echo "Projeto: $PROJECT"

echo "1 - copy_template"
copy_template "$PROJECT"

echo "2 - create_env"
create_env "$PROJECT"

echo "3 - create_compose"
create_compose "$PROJECT"
generate_manifest "$PROJECT"

echo "4 - register_project"
register_project "$PROJECT"

echo "[OK] Generator finalizado"
