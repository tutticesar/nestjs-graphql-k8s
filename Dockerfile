# Etapa 1: deps
FROM node:20-slim AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Etapa 2: build
FROM node:20-slim AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# Etapa 3: runtime
FROM node:20-slim AS runner
WORKDIR /app
ENV NODE_ENV=production \
    PORT=3000
# Só deps de prod
COPY package*.json ./
RUN npm ci --omit=dev
# Artefatos de build
COPY --from=build /app/dist ./dist
# Se você carrega assets estáticos, copie também (ex.: views/public):
# COPY --from=build /app/public ./public

EXPOSE 3000
CMD ["node", "dist/main.js"]
