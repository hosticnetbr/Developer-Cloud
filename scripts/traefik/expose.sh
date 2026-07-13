#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib.sh"

PROJECT="$1"

if [[ -z "$PROJECT" ]]; then

    echo "Uso:"
    echo "    dc expose <projeto>"
    exit 1

fi

PATH_PROJECT=$(project_path "$PROJECT")

if [[ ! -d "$PATH_PROJECT" ]]; then

    echo "[ERROR] Projeto não encontrado."
    exit 1

fi

DOMAIN=$(project_domain "$PROJECT")

echo

echo "[INFO] Projeto : $PROJECT"
echo "[INFO] Domínio : $DOMAIN"

echo

echo "[OK] Integração Traefik preparada."

echo
