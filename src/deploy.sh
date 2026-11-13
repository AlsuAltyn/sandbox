#!/bin/bash
set -e

echo "Deploying version: $VERSION"
echo "Using image tag: $IMAGE_TAG"

# Явно указываем файл, чтобы не зависеть от текущей директории
COMPOSE_FILE="docker-compose.yml"

# Скачиваем новые образы
docker compose -f $COMPOSE_FILE pull

# Перезапускаем контейнеры
docker compose -f $COMPOSE_FILE up -d --remove-orphans --force-recreate

# Удаляем старые неиспользуемые образы
docker image prune -f

echo "Deploy completed successfully!"