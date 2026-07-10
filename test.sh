#!/usr/bin/env bash

source scripts/common/init.sh

dcp_title "$DCP_NAME"

dcp_check_network

dcp_info "Framework carregado"

dcp_check_command git

dcp_check_command curl

dcp_check_command tree

dcp_success "Todos os testes passaram"

echo

echo "Versão: $DCP_VERSION"

echo "Workspace: $DCP_WORKSPACE"

echo "Log: $HOME/infrastructure/logs/dcp.log"
