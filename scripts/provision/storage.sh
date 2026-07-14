#!/usr/bin/env bash

create_storage() {

    local PROJECT="$1"

    local ROOT="$HOME/workspace/$PROJECT/storage"

    mkdir -p "$ROOT"

    for DIR in \
        redis \
        minio \
        evolution \
        n8n \
        postgres
    do

        VALUE=$(manifest_value "$PROJECT" "$DIR")

        [[ "$VALUE" != "true" ]] && continue

        mkdir -p "$ROOT/$DIR"

    done

}
