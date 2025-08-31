**Nest GraphQL K8s — Protótipo Didático**

- **Objetivo:** estudar GraphQL com NestJS e, em seguida, empacotar e orquestrar com Kubernetes/Helm.
- **Stack:** Node 20, NestJS 11, TypeScript. Futuro: GraphQL (Apollo), K8s manifests, Helm charts.

**Estado Atual**
- API NestJS mínima (GET / → "Hello World!").
- Dockerfile multi-stage pronto para produção na porta `3000`.
- `docker-compose.yml` focado em desenvolvimento leve (porta `3000`).

**Pré‑requisitos**
- Docker e Docker Compose
- Opcional: Node.js 20+ e npm (para rodar fora do Docker)

**Rodando no Docker (Dev)**
- Instalar dependências (primeira vez): `docker compose run --rm api-dev npm ci`
- Subir a API: `docker compose up api-dev`
- Acesse: `http://localhost:3000`
- Verifique: `curl http://localhost:3000` → deve retornar `Hello World!`

Arquivos relevantes:
- `docker-compose.yml`: serviço `api-dev` (dev com live-reload via `npm run start:dev`).
- `Dockerfile`: build multi-stage para produção (expõe `3000`).
- `.env`: contém `PORT=3000`.

**Rodando Local (sem Docker)**
- Instalar deps: `npm ci`
- Dev (watch): `npm run start:dev`
- Prod (compilado): `npm run build && npm run start:prod`

**Estrutura**
- `src/app.module.ts`: módulo raiz
- `src/app.controller.ts`: rota GET `/` (Hello World)
- `src/main.ts`: inicialização do Nest na porta `3000` em `0.0.0.0`

**Roteiro Próximo (Roadmap)**
- GraphQL (NestJS + Apollo)
  - Escolha do approach: code‑first (decorators) vs schema‑first (SDL).
  - Resolver de exemplo, tipos, inputs e playground em `/graphql`.
- Qualidade e DX
  - ESLint/Prettier (já configurados), testes unitários e e2e.
- Contêiner e Imagens
  - Ajustes no Dockerfile para dev target (opcional) e imagem prod enxuta.
- Kubernetes / Helm
  - Manifests (Deployment, Service, ConfigMap, Ingress, liveness/readiness, recursos).
  - Helm chart com valores para `image`, `replicas`, `resources`, `env`.
- CI/CD
  - Pipeline para lint/test/build/push de imagem e deploy (opcional).

**Comandos Úteis**
- Subir dev: `docker compose up api-dev`
- Parar e remover container avulso antigo: `docker stop <nome|id> && docker rm <nome|id>`

Sugestões e incrementos são bem‑vindos — vamos evoluindo este README conforme adicionarmos GraphQL e os manifestos do Kubernetes.
