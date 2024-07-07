FROM node:lts-alpine as builder
WORKDIR /app
COPY package*.json pnpm-lock.yaml ./

RUN npm config set registry https://registry.npmmirror.com && \
    npm install -g pnpm && \
    pnpm config set registry https://registry.npmmirror.com && \
    pnpm install
COPY . .
RUN pnpm run build

FROM bitnami/nginx:1.21
COPY --from=builder /app/dist/ /app
COPY /nginx/server-block.conf /opt/bitnami/nginx/conf/server_blocks/
