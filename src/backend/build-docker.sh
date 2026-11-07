#!/bin/bash
set -euo pipefail

echo "==> Сборка локального образа sandbox-backend:latest..."
# Сборка из текущей папки (где лежит Dockerfile)
docker build -t sandbox-backend:latest .

echo "==> Сборка бэкенда завершена."


