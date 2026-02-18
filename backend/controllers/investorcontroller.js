const pool = require("../config/db");
const { matchSmesToInvestor } = require("../utils/matching");

exports.getRecommendedSmes = async (req, res) => {
    try {
        const userId = req.user.id;

        // Get investor profile
        const investorResult = await pool.query("SELECT * FROM investor_profiles WHERE user_id = $1", [userId]);
        if (investorResult.rows.length === 0) {
            return res.status(404).json({ message: "Investor profile not found." });
        }
        const investorProfile = investorResult.rows[0];

        // Get all verified SMEs
        const smesResult = await pool.query(`
            SELECT u.name, u.email, s.* 
            FROM users u 
            JOIN sme_profiles s ON u.id = s.user_id 
            WHERE u.role = 'food_sme' AND u.verification_status = 'Verified'
        `);

        const allSmes = smesResult.rows;

        // Perform matching
        const recommendations = matchSmesToInvestor(investorProfile, allSmes);

        res.json(recommendations);

    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getSmeDetails = async (req, res) => {
    try {
        const { id } = req.params; // SME Profile ID

        const smeDetail = await pool.query(`
            SELECT u.name, u.email, s.*, m.*
            FROM users u
            JOIN sme_profiles s ON u.id = s.user_id
            LEFT JOIN business_metrics m ON s.id = m.sme_id
            WHERE s.id = $1
        `, [id]);

        if (smeDetail.rows.length === 0) {
            return res.status(404).json({ message: "SME not found" });
        }

        res.json(smeDetail.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
