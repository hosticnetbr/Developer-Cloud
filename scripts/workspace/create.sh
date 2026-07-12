#!/usr/bin/env bash

set -e

PROJECT="${1:-}"

if [[ -z "$PROJECT" ]]; then
    echo "[ERROR] Informe o nome do projeto."
    echo
    echo "Uso:"
    echo "    dc create <nome>"
    exit 1
fi

ROOT="$HOME/Developer-Cloud"
WORKSPACE="$HOME/workspace"

if [[ -d "$WORKSPACE/$PROJECT" ]]; then
    echo "[ERROR] Projeto '$PROJECT' já existe."
    exit 1
fi

echo "[INFO] Criando projeto..."

bash "$ROOT/scripts/generator/generator.sh" "$PROJECT"

echo
echo "[OK] Projeto criado em:"
echo "$WORKSPACE/$PROJECT"
echo
