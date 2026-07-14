#!/usr/bin/env bash

wizard_frontend() {

    echo
    echo "Frontend"
    echo
    echo "1) React"
    echo "2) Next.js"
    echo "3) Vue"
    echo "4) Nenhum"
    echo

    read -rp "Escolha: " OPTION

    case "$OPTION" in
        1) FRONTEND="react" ;;
        2) FRONTEND="nextjs" ;;
        3) FRONTEND="vue" ;;
        *) FRONTEND="" ;;
    esac

}

wizard_backend() {

    echo
    echo "Backend"
    echo
    echo "1) NestJS"
    echo "2) Express"
    echo "3) Laravel"
    echo "4) Nenhum"
    echo

    read -rp "Escolha: " OPTION

    case "$OPTION" in
        1) BACKEND="nestjs" ;;
        2) BACKEND="express" ;;
        3) BACKEND="laravel" ;;
        *) BACKEND="" ;;
    esac

}

wizard_database() {

    echo
    echo "Banco de dados"
    echo
    echo "1) PostgreSQL"
    echo "2) MySQL"
    echo "3) MongoDB"
    echo "4) Supabase"
    echo "5) Nenhum"
    echo

    read -rp "Escolha: " OPTION

    case "$OPTION" in
        1) DATABASE="postgres" ;;
        2) DATABASE="mysql" ;;
        3) DATABASE="mongodb" ;;
        4) DATABASE="supabase" ;;
        *) DATABASE="" ;;
    esac

}

wizard_services() {

    echo
    echo "========== Serviços =========="
    echo

    ask_service() {

        local NAME="$1"

        read -rp "Instalar $NAME? (y/N): " ANSWER

        [[ "$ANSWER" =~ ^[Yy]$ ]]
    }

    REDIS=false
    MAILPIT=false
    MINIO=false
    EVOLUTION=false
    N8N=false

    ask_service "Redis" && REDIS=true

    ask_service "Mailpit" && MAILPIT=true

    ask_service "MinIO" && MINIO=true

    ask_service "Evolution API" && EVOLUTION=true

    ask_service "N8N" && N8N=true

}
