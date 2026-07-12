#!/usr/bin/env bash

generate_manifest() {

    local PROJECT="$1"

    cat > "$HOME/workspace/$PROJECT/.developer-cloud.json" <<EOF
{
  "name": "$PROJECT",
  "domain": "$PROJECT.dev.hostic.net.br",
  "version": "1.0",
  "created_at": "$(date -Iseconds)"
}
EOF

}
