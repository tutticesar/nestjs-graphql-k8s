# Nest GraphQL K8s — Educational Prototype 🚀

A small, didactic project to learn GraphQL with NestJS and later package/orchestrate it with Kubernetes and Helm.

## Goals 🎯
- Learn GraphQL with NestJS (Apollo).
- Prepare for Kubernetes deployment and Helm packaging.

## Tech Stack 🧰
- Node.js 20, NestJS 11, TypeScript
- Future: Apollo GraphQL, Kubernetes manifests, Helm charts

## Current Status ✅
- Minimal NestJS API (GET `/` → "Hello World!").
- Multi‑stage Dockerfile ready for production on port `3000`.
- `docker-compose.yml` focused on lightweight development (port `3000`).

## Prerequisites 📋
- Docker and Docker Compose
- Optional: Node.js 20+ and npm (to run outside Docker)

## Quick Start (Docker Dev) 🐳
- Install dependencies (first time): `docker compose run --rm api-dev npm ci`
- Start the API: `docker compose up api-dev`
- Access: `http://localhost:3000`
- Verify: `curl http://localhost:3000` → should return `Hello World!`

## Local Development (no Docker) 💻
- Install deps: `npm ci`
- Dev (watch): `npm run start:dev`
- Prod (compiled): `npm run build && npm run start:prod`

## Project Structure 🧱
- `src/app.module.ts`: root module
- `src/app.controller.ts`: GET `/` (Hello World)
- `src/main.ts`: Nest bootstrap, listens on port `3000` at `0.0.0.0`

## Configuration ⚙️
- `.env`: `PORT=3000`
- `docker-compose.yml`: `api-dev` service using `npm run start:dev`
- `Dockerfile`: multi‑stage build (production), exposes port `3000`

## Roadmap 🧭
- GraphQL (NestJS + Apollo)
  - Choose approach: code‑first (decorators) vs schema‑first (SDL)
  - Sample resolver, types, inputs, and playground at `/graphql`
- Quality & DX
  - ESLint/Prettier (already configured), unit and e2e tests
- Containers & Images
  - Optional dev target and lean prod image
- Kubernetes / Helm ☸️
  - Manifests: Deployment, Service, ConfigMap, Ingress, liveness/readiness, resources
  - Helm chart with values for `image`, `replicas`, `resources`, `env`
- CI/CD
  - Pipeline for lint/test/build/push and deploy (optional)

## Useful Commands 🔧
- Start dev: `docker compose up api-dev`
- Stop/remove old standalone container: `docker stop <name|id> && docker rm <name|id>`

Contributions and ideas are welcome — we’ll evolve this README as we add GraphQL and Kubernetes manifests. 📝
