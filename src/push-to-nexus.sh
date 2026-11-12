#!/bin/bash
set -euo pipefail
source ./.env

# Формируем п
BACKEND_IMAGE="${NEXUS_URL}/${NEXUS_REPO_BACKEND}/sandbox-backend:latest"
FRONTEND_IMAGE="${NEXUS_URL}/${NEXUS_REPO_FRONTEND}/sandbox-frontend:latest"

echo "==> Логин в Nexus (${NEXUS_URL})..."
# Логинимся на сам хост с портом 8081
echo "${NEXUS_PASS}" | docker login "${NEXUS_URL}" -u "${NEXUS_USER}" --password-stdin

echo "==> Тегирование и пуш бэкенда..."
docker tag sandbox-backend:latest "${BACKEND_IMAGE}"
docker push "${BACKEND_IMAGE}"

echo "==> Тегирование и пуш фронтенда..."
docker tag sandbox-frontend:latest "${FRONTEND_IMAGE}"
docker push "${FRONTEND_IMAGE}"

echo "==> Готово!"