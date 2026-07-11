#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../common/init.sh"

dcp_title "Docker Engine Installation"

dcp_info "Removendo versões antigas..."

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt remove -y "$pkg" >/dev/null 2>&1 || true
done

dcp_info "Instalando dependências..."

sudo apt update

sudo apt install -y \
ca-certificates \
curl \
gnupg

dcp_info "Criando keyring..."

sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

dcp_info "Adicionando repositório Docker..."

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
| sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt update

dcp_info "Instalando Docker..."

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

dcp_success "Docker instalado."
