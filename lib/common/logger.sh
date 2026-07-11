#!/usr/bin/env bash

LOG_FILE="$HOME/infrastructure/logs/dcp.log"

mkdir -p "$(dirname "$LOG_FILE")"

dcp_log() {

    local LEVEL="$1"
    local MESSAGE="$2"

    local DATE

    DATE=$(date "+%Y-%m-%d %H:%M:%S")

    echo "[$DATE] [$LEVEL] $MESSAGE" >> "$LOG_FILE"

}

dcp_info() {

    echo -e "${BLUE}[INFO]${NC} $1"

    dcp_log INFO "$1"

}

dcp_success() {

    echo -e "${GREEN}[ OK ]${NC} $1"

    dcp_log SUCCESS "$1"

}

dcp_warn() {

    echo -e "${YELLOW}[WARN]${NC} $1"

    dcp_log WARNING "$1"

}

dcp_error() {

    echo -e "${RED}[FAIL]${NC} $1"

    dcp_log ERROR "$1"

}

dcp_title() {

    echo

    echo -e "${CYAN}$1${NC}"

    echo

    dcp_log TITLE "$1"

}
