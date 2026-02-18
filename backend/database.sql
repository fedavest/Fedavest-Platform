-- Database Schema for FedaVest

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) CHECK (role IN ('food_sme', 'investor')) NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    verification_status VARCHAR(50) DEFAULT 'Pending' CHECK (verification_status IN ('Pending', 'Verified', 'Limited')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sme_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    gender VARCHAR(20),
    product_stage VARCHAR(100),
    business_description TEXT,
    nin VARCHAR(20),
    cac_number VARCHAR(50),
    business_location JSONB, -- For Google Places API data
    readiness_score INTEGER DEFAULT 0,
    risk_level VARCHAR(50),
    resilience_summary TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investor_profiles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    sector_preferences TEXT[], -- e.g. ['Rice Production', 'Poultry']
    impact_preferences TEXT[], -- e.g. ['Meal Security Gap', 'Nutrition Risk Reduction']
    risk_tolerance VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business_metrics (
    id SERIAL PRIMARY KEY,
    sme_id INTEGER REFERENCES sme_profiles(id) ON DELETE CASCADE,
    initial_capital NUMERIC,
    annual_revenue NUMERIC,
    monthly_revenue NUMERIC,
    profit_margin NUMERIC,
    monthly_expenses NUMERIC,
    total_debt NUMERIC,
    funding_needed NUMERIC,
    team_size INTEGER,
    business_age_years INTEGER,
    revenue_last_6_month_avg NUMERIC,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE funding_goals (
    id SERIAL PRIMARY KEY,
    sme_id INTEGER REFERENCES sme_profiles(id) ON DELETE CASCADE,
    goal_amount NUMERIC NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE milestones (
    id SERIAL PRIMARY KEY,
    funding_goal_id INTEGER REFERENCES funding_goals(id) ON DELETE CASCADE,
    investor_id INTEGER REFERENCES users(id), -- The investor who funded/is monitoring
    description TEXT NOT NULL,
    evidence_type VARCHAR(100),
    is_locked BOOLEAN DEFAULT FALSE,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE milestone_evidence (
    id SERIAL PRIMARY KEY,
    milestone_id INTEGER REFERENCES milestones(id) ON DELETE CASCADE,
    evidence_url TEXT,
    description TEXT,
    ai_validation_status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
