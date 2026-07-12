#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

PROJECTS="$ROOT/services/projects/projects.conf"

echo
echo "Projetos registrados"
echo "--------------------"

grep -v '^#' "$PROJECTS" | grep -v '^$' | while IFS='=' read -r NAME PATH_PROJECT
do
    printf "%-20s %s\n" "$NAME" "$PATH_PROJECT"
done

echo
