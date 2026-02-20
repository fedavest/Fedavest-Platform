# FedaVest Backend Documentation

## Overview
FedaVest is an AI-powered trust and accountability platform for food-system SMEs in Nigeria. The backend provides the core logic for user verification, AI-driven investment readiness scoring, investor matching, and milestone-based funding accountability.

## Technology Stack
- **Node.js & Express**: Web framework
- **PostgreSQL**: Relational database
- **JWT (JSON Web Tokens)**: Authentication
- **Bcrypt**: Password hashing
- **Dotenv**: Environment variable management
- **Pg (node-postgres)**: Database client

## Project Structure
```
backend/
├── config/             # Database configuration
├── controllers/        # Business logic for endpoints
├── middleware/         # Authentication and authorization
├── routes/             # API route definitions
├── utils/              # AI scoring and matching logic
├── .env                # Environment variables
├── database.sql        # Database schema
└── index.js            # Entry point
```

## Database Schema
The system uses a relational schema designed for auditability:
- `users`: Core identity and verification status.
- `sme_profiles`: Extended data for SMEs (NIN, CAC, Stage).
- `investor_profiles`: Investor preferences and risk tolerance.
- `business_metrics`: Financial data used for AI scoring.
- `funding_goals`: Funding requests from SMEs.
- `milestones`: Granular steps for fund disbursement and accountability.
- `milestone_evidence`: Supporting documents/photos for milestone completion.

## API Endpoints

### Authentication
- `POST /api/v1/auth/register`: Register as `food_sme` or `investor`.
- `POST /api/v1/auth/login`: Login and receive JWT.

### User Profiles
- `GET /api/v1/users/profile`: Get current user's profile details.
- `POST /api/v1/users/profile/sme`: Initialize or update SME profile.
- `POST /api/v1/users/profile/investor`: Initialize or update Investor profile.

### SME Features
- `POST /api/v1/sme/metrics`: Submit financial data for AI readiness scoring.
- `GET /api/v1/sme/metrics`: Retrieve current business metrics.
- `POST /api/v1/sme/goals`: Create a funding goal with associated milestones.
- `POST /api/v1/sme/milestones/evidence`: Submit proof of milestone completion.

### Investor Features
- `GET /api/v1/investors/recommendations`: Get ranked SME matches based on profile preferences.
- `GET /api/v1/investors/sme/:id`: View detailed SME profile and AI scores.
- `POST /api/v1/investors/milestones/lock`: Lock milestones to enter a funding agreement.
- `GET /api/v1/investors/milestones/:goal_id`: Track milestone progress and evidence.

### Admin Features
- `POST /api/v1/admin/verify-status`: Manually update user verification status (`Verified`, `Limited`, `Pending`).
- `GET /api/v1/admin/users`: List all users for moderation.

## AI Inference Layer (Simulated)

### Readiness Scoring (`utils/ai_scoring.js`)
Calculates a score (0-100) based on:
- Revenue scale and consistency.
- Profit margins.
- Debt-to-revenue ratios.
- Business age and team size.

### Risk & Resilience Detection (`utils/ai_scoring.js`)
Detects financial inconsistencies and negative cash flow trends to assign a risk level (`Low`, `Medium`, `High`).

### Investor Matching (`utils/matching.js`)
Uses a weighted ranking system to match investors with SMEs based on:
- Sector alignment.
- Impact category matching (SDG 2).
- Risk tolerance compatibility.
- SME readiness score.

## Setup Instructions

1. **Prerequisites**:
   - Node.js installed.
   - PostgreSQL installed and running.

2. **Database Setup**:
   - Create a database named `fedavest`.
   - Run the commands in `backend/database.sql` to setup the tables.

3. **Environment Config**:
   - Create a `.env` file (see `.env.example` or use the default provided in documentation).
   - Update `DB_PASSWORD` and `JWT_SECRET`.

4. **Installation**:
   ```bash
   cd backend
   npm install
   ```

5. **Run the Server**:
   ```bash
   npm start
   ```
   The server will run on `http://localhost:2000`.
