#!/bin/bash

DATE=$(date +"%d_%m_%y")

LOCAL=./backups

name_backup="Backup_${DATE}.zip"

PASTAS=(
    ./priv
    ./pub
    ./usr1
    ./usr2
)

verificar_sudo() {
    if [ "$EUID" -ne 0 ]; then
        exit 1
    fi
}

mkdir -p "$LOCAL"

zip -r "$LOCAL/$name_backup" "${PASTAS[@]}"
