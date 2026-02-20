const pool = require("../config/db");

// Update SME Profile
exports.updateSmeProfile = async (req, res) => {
    try {
        const { id } = req.user; // From auth middleware
        const { gender, product_stage, business_description, nin, cac_number, business_location } = req.body;

        // Check if profile exists
        const profile = await pool.query("SELECT * FROM sme_profiles WHERE user_id = $1", [id]);

        if (profile.rows.length === 0) {
            // Create new profile
            const newProfile = await pool.query(
                "INSERT INTO sme_profiles (user_id, gender, product_stage, business_description, nin, cac_number, business_location) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
                [id, gender, product_stage, business_description, nin, cac_number, JSON.stringify(business_location)]
            );
            return res.status(201).json(newProfile.rows[0]);
        } else {
            // Update existing profile
            const updatedProfile = await pool.query(
                "UPDATE sme_profiles SET gender = $1, product_stage = $2, business_description = $3, nin = $4, cac_number = $5, business_location = $6 WHERE user_id = $7 RETURNING *",
                [gender, product_stage, business_description, nin, cac_number, JSON.stringify(business_location), id]
            );
            return res.json(updatedProfile.rows[0]);
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Update Investor Profile
exports.updateInvestorProfile = async (req, res) => {
    try {
        const { id } = req.user;
        const { sector_preferences, impact_preferences, risk_tolerance } = req.body;

        const profile = await pool.query("SELECT * FROM investor_profiles WHERE user_id = $1", [id]);

        if (profile.rows.length === 0) {
            const newProfile = await pool.query(
                "INSERT INTO investor_profiles (user_id, sector_preferences, impact_preferences, risk_tolerance) VALUES ($1, $2, $3, $4) RETURNING *",
                [id, sector_preferences, impact_preferences, risk_tolerance]
            );
            return res.status(201).json(newProfile.rows[0]);
        } else {
            const updatedProfile = await pool.query(
                "UPDATE investor_profiles SET sector_preferences = $1, impact_preferences = $2, risk_tolerance = $3 WHERE user_id = $4 RETURNING *",
                [sector_preferences, impact_preferences, risk_tolerance, id]
            );
            return res.json(updatedProfile.rows[0]);
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get My Profile
exports.getMyProfile = async (req, res) => {
    try {
        const { id, role } = req.user;
        let profile;
        if (role === 'food_sme') {
            profile = await pool.query("SELECT u.name, u.email, u.role, u.is_verified, u.verification_status, s.* FROM users u LEFT JOIN sme_profiles s ON u.id = s.user_id WHERE u.id = $1", [id]);
        } else {
            profile = await pool.query("SELECT u.name, u.email, u.role, u.is_verified, u.verification_status, i.* FROM users u LEFT JOIN investor_profiles i ON u.id = i.user_id WHERE u.id = $1", [id]);
        }
        res.json(profile.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
