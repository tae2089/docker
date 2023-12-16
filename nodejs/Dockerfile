FROM node:18.7.0-alpine3.15 AS base

WORKDIR /src

RUN npm install -g pnpm
# Install dependencies with pnpm and cache mount
RUN --mount=type=cache,id=pnmcache,target=/var/pnpm/store \
  --mount=type=bind,source=package.json,target=package.json \
  --mount=type=bind,source=pnpm-lock.yaml,target=pnpm-lock.yaml \
  pnpm config set store-dir /var/pnpm/store && \
  pnpm config set package-import-method copy && \
  pnpm install --prefer-offline --ignore-scripts --frozen-lockfile

FROM base as builder
COPY . . 
RUN --mount=type=cache,id=pnmcache,target=/var/pnpm/store \
    pnpm build

FROM node:18.7.0-alpine3.15 AS runner
WORKDIR /app
COPY --from=builder --chown=node:node /src/dist ./dist
COPY --from=builder --chown=node:node /src/node_modules ./node_modules

ENV NODE_ENV production

USER node

CMD ["node", "dist/src/main"]
