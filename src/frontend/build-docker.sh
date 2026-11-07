#!/bin/bash
set -euo pipefail

echo "==> Сборка локального образа sandbox-frontend:latest..."
docker build -t sandbox-frontend:latest .

echo "==> Сборка фронтенда завершена."

