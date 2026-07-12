#!/usr/bin/env bash

render_template() {

    local TEMPLATE="$1"
    local DESTINATION="$2"
    local PROJECT="$3"

    sed \
        -e "s/{{PROJECT}}/${PROJECT}/g" \
        "$TEMPLATE" > "$DESTINATION"

}
