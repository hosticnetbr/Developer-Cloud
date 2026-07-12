#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

PROJECTS="$ROOT/services/projects/projects.conf"

PROJECT="$1"

if [[ -z "$PROJECT" ]]; then
    echo "Uso:"
    echo "  dc project info <projeto>"
    exit 1
fi

PATH_PROJECT=$(grep "^${PROJECT}=" "$PROJECTS" | cut -d= -f2)

if [[ -z "$PATH_PROJECT" ]]; then
    echo "[ERROR] Projeto não encontrado."
    exit 1
fi

echo
echo "Projeto : $PROJECT"
echo "Path    : $PATH_PROJECT"

if [[ -f "$PATH_PROJECT/.developer-cloud.json" ]]; then
    echo
    echo "Manifesto:"
    cat "$PATH_PROJECT/.developer-cloud.json"
fi

echo
