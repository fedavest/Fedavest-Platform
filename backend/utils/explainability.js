const Groq = require("groq-sdk");
require("dotenv").config();

const groq = new Groq({
    apiKey: process.env.GROQ_API_KEY
});

/**
 * Generate AI Explainability for why an SME is a good match for an investor
 */
exports.generateMatchReasoning = async (investorProfile, smeProfile) => {
    try {
        const prompt = `
        Explain why this SME is a good match for this investor in the context of food security and SDG 2.
        
        Investor Preferences:
        - Sectors: ${investorProfile.sector_preferences}
        - Impact Goals: ${investorProfile.impact_preferences}
        - Risk Tolerance: ${investorProfile.risk_tolerance}

        SME Profile:
        - Description: ${smeProfile.business_description}
        - Product Stage: ${smeProfile.product_stage}
        - AI Readiness Score: ${smeProfile.readiness_score}
        - Risk Level: ${smeProfile.risk_level}

        Provide a concise, professional explanation (max 3 sentences) that highlights the alignment.
        `;

        const completion = await groq.chat.completions.create({
            messages: [{ role: "user", content: prompt }],
            model: "llama-3.3-70b-versatile",
        });

        return completion.choices[0].message.content;

    } catch (error) {
        console.error("Explainability Error:", error);
        return "Alignment detected based on sector preferences and impact goals.";
    }
};
