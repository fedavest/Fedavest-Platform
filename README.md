
# FedaVest
### AI-Powered Investment Readiness & Impact Platform for Food-System SMEs

### Overview

FedaVest is an AI powered mobile-investment platform designed to help food-system SMEs in Nigeria access funding by proving investment readiness, risk assessment platform, transparency, and measurable impact designed to support Small and Medium Enterprises (SMEs) in accessing funding while enabling investors to fund, make data-driven decisions, monitor, and verify outcomes aligned with SDG 2 (Zero Hunger).

The platform addresses trust gaps in impact financing by combining structured verification, AI-driven readiness scoring, and milestone-based accountability.

This repository represents the full-stack capstone implementation, including backend infrastructure, mobile integration, and DevOps for production deployment and CI/CD workflow.

## Problem

Food-system SMEs often struggle to access funding due to:

- Limited verification and credibility signals

- Manual, fragmented due diligence processes

- Low investor trust

- Poor visibility into measurable impact

Investors, on the other hand, lack structured tools to assess SME risk and track funding outcomes confidently.

FedaVest provides structured verification, AI-powered assessment, and accountability tracking to close this trust gap.

## Core Features

- Role-based onboarding (SME / Investor)

- Identity and business verification workflow

- AI-powered investment readiness scoring

- AI-driven risk and resilience insights

- Impact-aware SME–Investor matching

- Milestone-based funding accountability

- Progress tracking and impact dashboards

- Role-based access control and secure authentication

## Architecture

### Backend

- Runtime Environment: Node.js

- Framework: Express.js

- Database: PostgreSQL

- Authentication: JSON Web Token (JWT-based authentication)

- Password Hashing:bcrypt

- AI Model Runtime: ONNX Runtime

- Environment-driven configuration: dotenv

### Mobile Application

Flutter (mobile-first architecture)

### DevOps & Infrastructure

- Repository creation and project structure setup

- Dockerized backend service

- GitHub Actions CI pipeline

- Branch-based development workflow

- Production deployment via Render

- Secure environment variable management

- Cloud-ready container architecture (AWS compatible)

## Branch Structure

To ensure production safety and clean collaboration:

- main – Production-ready code

- feda-backend – Backend feature development

- feda-dev – Mobile application development

- feda-devops – DevOps integration (Docker, CI/CD, deployment validation)

Only validated and tested changes are merged into main to maintain deployment stability.

## Deployment Model

- Containerized backend using Docker

- CI pipeline triggered on production merges

- Managed PostgreSQL database

- Environment variables securely configured in production

- Automated cloud deployment from main

The system is designed to be reproducible, scalable, and cloud-portable.

## Technical Stack

Backend: Node.js, Express, PostgreSQL

Mobile: Flutter

DevOps: Docker, GitHub Actions, Render

API Testing: Thunder Client

## Project Status

Active development.
Core backend infrastructure, DevOps pipeline, and deployment workflow are implemented and production-ready. Feature expansion and AI refinement are ongoing.
