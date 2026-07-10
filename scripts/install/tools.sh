#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../common/init.sh"

dcp_title "Instalação das Ferramentas Base"

TOOLS=(
    git
    curl
    wget
    jq
    unzip
    zip
    tree
    htop
    btop
    ripgrep
    fzf
    build-essential
    ca-certificates
    gnupg
    software-properties-common
)

dcp_info "Atualizando lista de pacotes..."

sudo apt update

dcp_info "Instalando ferramentas..."

sudo apt install -y "${TOOLS[@]}"

dcp_success "Ferramentas instaladas com sucesso."
