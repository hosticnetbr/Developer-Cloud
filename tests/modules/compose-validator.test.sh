#!/usr/bin/env bash

set -e

ROOT="$HOME/Developer-Cloud"

source "$ROOT/scripts/modules/lib.sh"
source "$ROOT/scripts/modules/compose.sh"

echo "==============================="
echo " Compose Validator Test"
echo "==============================="
echo

PASS=0
FAIL=0

for MODULE in "$ROOT"/templates/services/*
do
    MODULE=$(basename "$MODULE")

    printf "%-15s" "$MODULE"

    if module_has_compose "$MODULE"; then
        echo " -> compose válido"
    else
        echo " -> ignorado"
    fi
done

echo
echo "Teste concluído."
