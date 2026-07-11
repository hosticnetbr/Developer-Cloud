#!/usr/bin/env bash

dcp_command_exists() {

    command -v "$1" >/dev/null 2>&1

}

dcp_pause() {

    read -rp "Pressione ENTER para continuar..."

}

dcp_confirm() {

    read -rp "$1 [y/N]: " RESPONSE

    [[ "$RESPONSE" =~ ^[Yy]$ ]]

}
