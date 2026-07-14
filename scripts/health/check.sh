#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib.sh"

health_check() {

    local PROJECT="$1"

    if docker ps --format '{{.Names}}' | grep -q "${PROJECT}-redis"
    then
        wait_tcp localhost 6379 Redis
    fi

    if docker ps --format '{{.Names}}' | grep -q "${PROJECT}-mailpit"
    then
        wait_http http://localhost:8025 Mailpit
    fi

    if docker ps --format '{{.Names}}' | grep -q "${PROJECT}-n8n"
    then
        wait_http http://localhost:5678 n8n
    fi

    if docker ps --format '{{.Names}}' | grep -q "${PROJECT}-evolution"
    then
        wait_http http://localhost:8080 Evolution
    fi

}
