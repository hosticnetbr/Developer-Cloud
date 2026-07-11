#!/usr/bin/env bash

cat << EOF

==========================================
      Developer Cloud Platform
==========================================

Comandos disponíveis

Sistema
--------

dc help
dc version
dc doctor
dc update
dc backup

Containers
----------

dc ps

dc up <serviço>

dc down <serviço>

dc restart <serviço>

dc logs <serviço>

Instalação
----------

dc install <serviço>

EOF
