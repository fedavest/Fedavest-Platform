
## FedaVest – DevOps Implementation Documentation

Branch: feda-devops

Role: DevOps Engineer

Project: FedaVest – AI-Powered Investment Readiness & Accountability Platform for Food-System SMEs

## Overview

This branch documents the DevOps implementation for the FedaVest backend system.

As the DevOps Engineer on this project, my responsibilities included:

- Environment standardization

- Docker containerization

- CI pipeline implementation using GitHub Actions

- Secure environment variable management

## Deployment configuration on Render

Branching strategy and controlled promotion to production (main)

This branch serves as the staging and validation environment before production release.

## Architecture Overview

Frontend (Mobile – feda-dev)

   ⬇

Backend API (Node.js + Express)

⬇

PostgreSQL Database

⬇

Render Cloud Deployment

### DevOps Layer:

- Docker (Containerization)

- GitHub Actions (CI)

- Render (Cloud Hosting & Monitoring)

- Environment Secret Management

## Branching Strategy

To ensure stability and production safety, the following workflow was used:

- Backend updates exist in feda-backend

- Changes are pulled into feda-devops without direct merge:

       git checkout origin/feda-backend -- backend 

- Backend is tested locally via Docker

- APIs validated using Thunder Client

- After successful validation, feda-devops is merged into main

- Production deployment is triggered from main branch

Branch roles

- main → production-ready code
- feda-devops → DevOps integration branch (CI/CD, Docker, deployment)
- feda-backend → backend development branch
- feda-dev (mobile) → mobile application development branch

This ensures:

- No unstable code reaches production

- Controlled testing environment

- Clear separation of DevOps validation layer


## Docker Implementation

A production-grade Dockerfile was implemented.

## Key Decisions:

- Node 18 (LTS alignment)
- Slim image for optimized production size
- Production-only dependencies
- Port standardized to 2000

## Docker Build
     docker build -t fedavest-app . 

## Docker Run (Local Testing)
     docker run -p 2000:2000 --env-file .env.docker fedavest-app 

## Environment Variable Management

- No secrets were hardcoded.
- All sensitive values were managed via:
- .env file (local development only – excluded from Git)
- Render Environment Variables (Production)

### Examples:

DATABASE_URL

JWT_SECRET

GROQ_API_KEY

NODE_ENV=production

PORT=2000

Secrets are configured directly inside Render Dashboard for security.

## CI Implementation (GitHub Actions)

- A lightweight and stable CI pipeline was implemented to:
- Validate dependency installation
- Validate Docker image build
- Ensure build consistency before deployment

## Trigger

Pipeline runs on push to:
- feda-devops
- main

## Workflow Responsibilities

- Checkout repository
- Setup Node.js
- Install backend dependencies
- Build Docker image

This ensures every push validates container readiness.

## API Testing

Backend endpoints were validated using:

- Thunder Client (VS Code)

Tested:

- User Authentication

- Profile Creation
- Protected Routes (JWT validation)
- SME-related endpoints

This ensured application logic integrity before deployment.

## Deployment – Render

Deployment strategy:

- Branch: feda-devops (staging)
- Branch: main (production)
- Environment: Docker
- Secrets configured in Render dashboard
- Automatic redeploy on push

Render provides:
- Auto build
- Health monitoring
- Logs access
- Automatic restarts on failure

## Production Promotion Flow

Development Flow:
feda-backend → feda-devops → main

Mobile development continues independently in feda-dev.

- Backend feature ready
- Pulled into DevOps branch
- Docker tested locally
- CI pipeline validated
- Merged to main
- Render auto-deploy triggered

## Monitoring & Reliability

Since deployment is hosted on Render:

- Logs monitored via Render dashboard
- Service health monitored automatically
- Environment-level secret protection enforced
- Auto-restart enabled on crash

No secrets are exposed in repository.

### DevOps Achievements in This Branch

- Implemented Docker containerization
- Standardized production environment
- Implemented GitHub Actions CI pipeline
- Secured environment variable strategy
- Designed branch-based promotion workflow
- Configured cloud deployment pipeline
- Validated API lifecycle before production release

## DevOps Tools Used

- Docker
- GitHub Actions
- Render
- PostgreSQL
- Thunder Client
- Git Branching Strategy

## Status

CI: Active

Dockerized: Yes

Cloud Deployment: Active

Production Ready: Yes

Mobile Integration: Supported






