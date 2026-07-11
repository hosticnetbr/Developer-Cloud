#!/usr/bin/env bash

dcp_check_root() {

    if [[ "$EUID" -eq 0 ]]; then

        dcp_error "Execute como usuário normal."

        exit 1

    fi

}

dcp_check_network() {

    if ping -c 1 8.8.8.8 >/dev/null 2>&1; then

        dcp_success "Internet disponível."

    else

        dcp_error "Sem conexão com a Internet."

        exit 1

    fi

}

dcp_check_command() {

    if dcp_command_exists "$1"; then

        dcp_success "$1 encontrado."

    else

        dcp_error "$1 não encontrado."

        exit 1

    fi

}
