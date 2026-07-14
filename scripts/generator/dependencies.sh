#!/usr/bin/env bash

resolve_dependencies() {

    #
    # Supabase
    #

    if [[ "$DATABASE" == "supabase" ]]; then
        SUPABASE=true
    else
        SUPABASE=false
    fi

    #
    # Evolution precisa de Redis
    #

    if [[ "$EVOLUTION" == true ]]; then
        REDIS=true
    fi

    #
    # N8N precisa de Redis
    #

    if [[ "$N8N" == true ]]; then
        REDIS=true
    fi

}
