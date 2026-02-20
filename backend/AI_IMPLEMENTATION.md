# FedaVest AI Implementation Documentation

## 🧠 Overview
The FedaVest platform utilizes a state-of-the-art AI inference layer powered by the **Groq SDK** and **Meta's Llama 3.3 70B** model. This implementation transforms raw SME financial and impact data into actionable insights for investors, establishing the core "Trust Infrastructure" of the platform.

## 🛠 Technology Stack
- **Engine**: Groq Cloud Inference
- **Model**: `llama-3.3-70b-versatile`
- **SDK**: `groq-sdk`
- **Format**: JSON Mode (Structured Outputs)

## 🚀 Core AI Modules

### 1. Business Readiness & Risk Analysis
**File**: `backend/utils/ai_scoring.js`
**Function**: `analyzeBusinessMetrics(metrics)`

This module performs a comprehensive audit of an SME's financial health.
- **Inputs**: Annual revenue, profit margins, debt ratios, team size, business age, and cash flow data.
- **Output Structure**:
  - `readiness`: Score (0-100), Strengths, Gaps, and Improvement Suggestions.
  - `risk`: Level (Low/Medium/High), Indicators, Resilience Summary, and Confidence Rating.
- **Key Prompt Logic**: The AI is instructed to act as a venture capital analyst specializing in the Nigerian food-system, ensuring the context is localized and relevant.

### 2. Match Explainability Engine
**File**: `backend/utils/explainability.js`
**Function**: `generateMatchReasoning(investorProfile, smeProfile)`

This module solves the "Information Asymmetry" problem by explaining *why* a match was made.
- **Logic**: It compares the Investor's specific SDG 2 preferences (e.g., "Meal Security Gap") against the SME's actual business mission and metrics.
- **User Value**: Provides a concise, 3-sentence professional justification of the alignment, displayed directly on the investor's dashboard.

## 📡 API Integration Details

### SME Metrics Processing
When an SME submits their metrics to `/api/v1/sme/metrics`, the following happens:
1. Data is validated and stored in PostgreSQL.
2. The `analyzeBusinessMetrics` function is triggered asynchronously.
3. The AI response is parsed and used to update the `sme_profiles` table (`readiness_score`, `risk_level`, `resilience_summary`).
4. The frontend receives the full AI breakdown immediately.

### Investor Matching Discovery
When an investor views an SME detail via `/api/v1/investors/sme/:id`:
1. The system retrieves both the investor's preferences and the SME's characteristics.
2. The `generateMatchReasoning` function creates a live justification of the match.
3. This "Explainably AI" response is returned in the `ai_match_reasoning` field.

## 🛡️ Resilience & Safety
- **Fallback Logic**: In the event of an API timeout or Groq service disruption, the system gracefully falls back to a deterministic scoring algorithm to ensure the platform remains functional.
- **JSON Validation**: The implementation uses Groq's `json_object` response format to guarantee that the backend can always parse the AI's output without syntax errors.

## ⚙️ Configuration
The AI requires a valid Groq API key in the `.env` file:
```env
GROQ_API_KEY=your_gsk_key_here
```

---
*Documented by Antigravity AI - FedaVest Infrastructure Team*
