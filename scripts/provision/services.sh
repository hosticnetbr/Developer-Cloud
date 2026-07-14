#!/usr/bin/env bash

print_services() {

    local PROJECT="$1"

    echo
    echo "========== Serviços =========="

    for SERVICE in \
        traefik \
        redis \
        mailpit \
        minio \
        supabase \
        evolution \
        n8n
    do

        VALUE=$(manifest_value "$PROJECT" "$SERVICE")

        printf "%-15s %s\n" "$SERVICE" "$VALUE"

    done

}
