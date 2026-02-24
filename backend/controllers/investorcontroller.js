const pool = require("../config/db");

/* ===============================
   CREATE / UPDATE INVESTOR PROFILE
================================ */
exports.createOrUpdateProfile = async (req, res) => {
  try {
    const userId = req.user.id;
    const {
      full_name,
      organization,
      nin,
      passport_photo,
      agreed_terms
    } = req.body;

    const existing = await pool.query(
      "SELECT * FROM investor_profiles WHERE user_id = $1",
      [userId]
    );

    if (existing.rows.length > 0) {
      await pool.query(
        `UPDATE investor_profiles SET
          full_name=$1,
          organization=$2,
          nin=$3,
          passport_photo=$4,
          agreed_terms=$5,
          updated_at=NOW()
         WHERE user_id=$6`,
        [full_name, organization, nin, passport_photo, agreed_terms, userId]
      );
      return res.json({ message: "Investor profile updated" });
    }

    await pool.query(
      `INSERT INTO investor_profiles
      (user_id, full_name, organization, nin, passport_photo, agreed_terms)
      VALUES ($1,$2,$3,$4,$5,$6)`,
      [userId, full_name, organization, nin, passport_photo, agreed_terms]
    );

    res.status(201).json({ message: "Investor profile created" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
};

/* ===============================
   GET MY INVESTOR PROFILE
================================ */
exports.getMyProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await pool.query(
      "SELECT * FROM investor_profiles WHERE user_id = $1",
      [userId]
    );

    if (result.rows.length === 0)
      return res.status(404).json({ message: "Profile not found" });

    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: "Server error" });
  }
};

/* ===============================
   SET / UPDATE INVESTMENT PREFERENCES
================================ */
exports.setPreferences = async (req, res) => {
  try {
    const userId = req.user.id;
    const {
      food_sector,
      impact_category,
      risk_tolerance,
      preferred_funding_min,
      preferred_funding_max,
      tracking_method
    } = req.body;

    const investor = await pool.query(
      "SELECT id FROM investor_profiles WHERE user_id = $1",
      [userId]
    );

    if (investor.rows.length === 0)
      return res.status(404).json({ message: "Investor profile required first" });

    const investorId = investor.rows[0].id;

    const existing = await pool.query(
      "SELECT * FROM investor_preferences WHERE investor_id = $1",
      [investorId]
    );

    if (existing.rows.length > 0) {
      await pool.query(
        `UPDATE investor_preferences SET
          food_sector=$1,
          impact_category=$2,
          risk_tolerance=$3,
          preferred_funding_min=$4,
          preferred_funding_max=$5,
          tracking_method=$6,
          updated_at=NOW()
         WHERE investor_id=$7`,
        [
          food_sector,
          impact_category,
          risk_tolerance,
          preferred_funding_min,
          preferred_funding_max,
          tracking_method,
          investorId
        ]
      );
      return res.json({ message: "Preferences updated" });
    }

    await pool.query(
      `INSERT INTO investor_preferences
      (investor_id, food_sector, impact_category, risk_tolerance,
       preferred_funding_min, preferred_funding_max, tracking_method)
      VALUES ($1,$2,$3,$4,$5,$6,$7)`,
      [
        investorId,
        food_sector,
        impact_category,
        risk_tolerance,
        preferred_funding_min,
        preferred_funding_max,
        tracking_method
      ]
    );

    res.status(201).json({ message: "Preferences saved" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server error" });
  }
};

/* ===============================
   GET INVESTOR PREFERENCES
================================ */
exports.getPreferences = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await pool.query(
      `SELECT p.*
       FROM investor_preferences p
       JOIN investor_profiles i ON p.investor_id = i.id
       WHERE i.user_id = $1`,
      [userId]
    );

    if (result.rows.length === 0)
      return res.status(404).json({ message: "Preferences not found" });

    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: "Server error" });
  }
};