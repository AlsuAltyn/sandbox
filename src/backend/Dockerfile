# Используем легковесный образ alpine с установленным Go
FROM golang:alpine AS builder

ARG VERSION="0.0.1"
ENV VERSION=VERSION

# Устанавливаем зависимости для компиляции (если нужны сторонние пакеты)
RUN apk add --no-cache git

# Копируем исходники внутрь образа
WORKDIR /app
COPY . .

# Собираем проект статически
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o "./build/backend-${VERSION}/app" ./cmd/api/main.go ./cmd/api/router.go

FROM golang:alpine AS runtime

WORKDIR /app

ARG VERSION="0.0.1"
ENV VERSION=VERSION

COPY --from=builder "/app/build/backend-${VERSION}/app" ./

CMD [ "/app/app" ]