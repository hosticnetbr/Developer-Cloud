#!/usr/bin/env bash

# ==========================================================
# Logger
# ==========================================================

dcp_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

dcp_success() {
    echo -e "${GREEN}[ OK ]${NC} $1"
}

dcp_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

dcp_error() {
    echo -e "${RED}[FAIL]${NC} $1"
}

dcp_title() {
    echo
    echo -e "${CYAN}$1${NC}"
    echo
}
