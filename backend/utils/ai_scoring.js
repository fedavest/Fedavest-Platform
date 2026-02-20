const Groq = require("groq-sdk");
require("dotenv").config();

const groq = new Groq({
    apiKey: process.env.GROQ_API_KEY
});

/**
 * AI Readiness Scoring & Risk Detection using Groq
 */
exports.analyzeBusinessMetrics = async (metrics) => {
    try {
        const prompt = `
        Analyze the following food-system SME business metrics for investment readiness and risk.
        Metrics:
        - Initial Capital: ${metrics.initial_capital}
        - Annual Revenue: ${metrics.annual_revenue}
        - Monthly Revenue: ${metrics.monthly_revenue}
        - Profit Margin: ${metrics.profit_margin}%
        - Monthly Expenses: ${metrics.monthly_expenses}
        - Total Debt: ${metrics.total_debt}
        - Funding Needed: ${metrics.funding_needed}
        - Team Size: ${metrics.team_size}
        - Business Age: ${metrics.business_age_years} years
        - Revenue Last 6 Months (Avg): ${metrics.revenue_last_6_month_avg}

        Output a JSON object with the following structure:
        {
            "readiness": {
                "score": (0-100),
                "strengths": [array of strings],
                "gaps": [array of strings],
                "suggestions": [array of strings]
            },
            "risk": {
                "level": ("Low", "Medium", "High"),
                "indicators": [array of strings],
                "resilienceSummary": "string",
                "confidenceIndicator": "string (e.g. 85%)"
            }
        }
        Do not include any other text in your response, only the JSON.
        `;

        const completion = await groq.chat.completions.create({
            messages: [{ role: "user", content: prompt }],
            model: "llama-3.3-70b-versatile",
            response_format: { type: "json_object" }
        });

        const result = JSON.parse(completion.choices[0].message.content);
        return result;

    } catch (error) {
        console.error("AI Analysis Error:", error);
        // Fallback to basic logic if AI fails
        return {
            readiness: {
                score: 50,
                strengths: ["Data submitted successfully"],
                gaps: ["AI analysis failed to process fully"],
                suggestions: ["Contact support if this persists"]
            },
            risk: {
                level: "Medium",
                indicators: ["Analysis Fallback triggered"],
                resilienceSummary: "Based on basic metrics, business is stable but requires deeper audit.",
                confidenceIndicator: "50%"
            }
        };
    }
};
