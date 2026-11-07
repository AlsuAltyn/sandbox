# ============================================================
# Stage 1: builder
# ============================================================
FROM node:16.20.0-alpine3.18 AS builder

ARG VERSION="0.0.1"

WORKDIR /app
COPY . .

RUN npm install

ENV NODE_ENV=production
RUN npm run build -- --dest "/app/build/frontend-${VERSION}/site"

# ============================================================
# Stage 2: runtime
# ============================================================
FROM node:16.20.0-alpine3.18 AS runtime

ARG VERSION="0.0.1"

USER root
WORKDIR /app

RUN npm install -g http-server

RUN mkdir -p /opt/sandbox/frontend/site

COPY --from=builder /app/build/frontend-${VERSION}/site/ /opt/sandbox/frontend/site/

EXPOSE 8888

CMD ["http-server", "/opt/sandbox/frontend/site", "-p", "8888", "--proxy", "http://sandbox-backend:8081"]