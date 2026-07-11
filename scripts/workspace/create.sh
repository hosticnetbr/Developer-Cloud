#!/usr/bin/env bash

set -e

CONFIG="$HOME/.developer-cloud/config"

if [ ! -f "$CONFIG" ]; then
    echo "[ERROR] Developer Cloud não configurado."
    exit 1
fi

source "$CONFIG"

PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
    echo "Uso:"
    echo "dc create <nome-do-projeto>"
    exit 1
fi

PROJECT_DIR="$WORKSPACE/$PROJECT_NAME"

if [ -d "$PROJECT_DIR" ]; then
    echo "[ERROR] Projeto '$PROJECT_NAME' já existe."
    exit 1
fi

echo "[INFO] Criando projeto..."

cp -R "$TEMPLATES" "$PROJECT_DIR"

cp "$PROJECT_DIR/.env.example" "$PROJECT_DIR/.env"

echo "[OK] Projeto criado em:"
echo "$PROJECT_DIR"
