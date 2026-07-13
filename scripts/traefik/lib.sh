#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

PROJECTS="$ROOT/services/projects/projects.conf"

project_path() {

    grep "^$1=" "$PROJECTS" | cut -d= -f2

}

project_domain() {

    local PROJECT

    PROJECT=$(project_path "$1")

    grep "^DOMAIN=" "$PROJECT/.env" | cut -d= -f2

}
