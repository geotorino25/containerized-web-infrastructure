
#!/usr/bin/env bash

set -Eeuo pipefail

PROJECT_DIR="/home/ccmfinal"
BACKUP_DIR="${PROJECT_DIR}/backups"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"

BACKUP_FILE="${BACKUP_DIR}/wordpress_${TIMESTAMP}.sql"
TEMP_FILE="${BACKUP_FILE}.tmp"

cd "${PROJECT_DIR}"
mkdir -p "${BACKUP_DIR}"

if docker compose exec -T db sh -c \
  'exec mysqldump --single-transaction --no-tablespaces \
   -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' \
   > "${TEMP_FILE}"; then

    if [ -s "${TEMP_FILE}" ]; then
        mv "${TEMP_FILE}" "${BACKUP_FILE}"
        chmod 600 "${BACKUP_FILE}"

        echo "Backup completed: ${BACKUP_FILE}"
    else
        rm -f "${TEMP_FILE}"
        echo "ERROR: Backup file is empty." >&2
        exit 1
    fi

else
    rm -f "${TEMP_FILE}"
    echo "ERROR: Database backup failed." >&2
    exit 1
fi
