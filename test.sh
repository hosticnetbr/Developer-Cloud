#!/usr/bin/env bash

source scripts/common/init.sh

dcp_title "$DCP_NAME"

dcp_info "Framework carregado"

dcp_success "Logger funcionando"

dcp_warn "Teste de aviso"

dcp_error "Teste de erro"

echo

echo "Versão: $DCP_VERSION"
echo "Workspace: $DCP_WORKSPACE"
