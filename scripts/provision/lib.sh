#!/usr/bin/env bash

ROOT="$HOME/Developer-Cloud"

get_manifest() {

    local PROJECT="$1"

    echo "$HOME/workspace/$PROJECT/.developer-cloud.json"

}

manifest_value() {

    local PROJECT="$1"
    local KEY="$2"

    awk -F': ' -v key="\"$KEY\"" '
        $1 ~ key {
            gsub(/[",]/,"",$2)
            gsub(/^[ \t]+|[ \t]+$/,"",$2)
            print $2
            exit
        }
    ' "$(get_manifest "$PROJECT")"

}
