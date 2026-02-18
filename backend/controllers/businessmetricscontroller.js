const pool = require("../config/db");
const { analyzeBusinessMetrics } = require("../utils/ai_scoring");

exports.submitBusinessMetrics = async (req, res) => {
    try {
        const userId = req.user.id;
        const {
            initial_capital,
            annual_revenue,
            monthly_revenue,
            profit_margin,
            monthly_expenses,
            total_debt,
            funding_needed,
            team_size,
            business_age_years,
            revenue_last_6_month_avg
        } = req.body;

        // Get SME profile id
        const profileResult = await pool.query("SELECT id FROM sme_profiles WHERE user_id = $1", [userId]);
        if (profileResult.rows.length === 0) {
            return res.status(404).json({ message: "SME profile not found. Please complete profile first." });
        }
        const smeId = profileResult.rows[0].id;

        // Save or update metrics
        const metricsCheck = await pool.query("SELECT id FROM business_metrics WHERE sme_id = $1", [smeId]);

        let metrics;
        if (metricsCheck.rows.length === 0) {
            metrics = await pool.query(
                `INSERT INTO business_metrics (
                    sme_id, initial_capital, annual_revenue, monthly_revenue, profit_margin, 
                    monthly_expenses, total_debt, funding_needed, team_size, 
                    business_age_years, revenue_last_6_month_avg
                ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`,
                [smeId, initial_capital, annual_revenue, monthly_revenue, profit_margin, monthly_expenses, total_debt, funding_needed, team_size, business_age_years, revenue_last_6_month_avg]
            );
        } else {
            metrics = await pool.query(
                `UPDATE business_metrics SET 
                    initial_capital=$2, annual_revenue=$3, monthly_revenue=$4, profit_margin=$5, 
                    monthly_expenses=$6, total_debt=$7, funding_needed=$8, team_size=$9, 
                    business_age_years=$10, revenue_last_6_month_avg=$11, updated_at=CURRENT_TIMESTAMP
                WHERE sme_id = $1 RETURNING *`,
                [smeId, initial_capital, annual_revenue, monthly_revenue, profit_margin, monthly_expenses, total_debt, funding_needed, team_size, business_age_years, revenue_last_6_month_avg]
            );
        }

        // Run AI Analysis (Real Groq Integration)
        const aiAnalysis = await analyzeBusinessMetrics(req.body);

        // Update profile with AI results
        await pool.query(
            "UPDATE sme_profiles SET readiness_score = $1, risk_level = $2, resilience_summary = $3 WHERE id = $4",
            [aiAnalysis.readiness.score, aiAnalysis.risk.level, aiAnalysis.risk.resilienceSummary, smeId]
        );

        res.json({
            message: "Metrics submitted and AI analysis completed",
            metrics: metrics.rows[0],
            ai_results: aiAnalysis
        });

    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getBusinessMetrics = async (req, res) => {
    try {
        const userId = req.user.id;
        const profileResult = await pool.query("SELECT id FROM sme_profiles WHERE user_id = $1", [userId]);
        if (profileResult.rows.length === 0) {
            return res.status(404).json({ message: "SME profile not found." });
        }
        const smeId = profileResult.rows[0].id;

        const metrics = await pool.query("SELECT * FROM business_metrics WHERE sme_id = $1", [smeId]);
        res.json(metrics.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
