const pool = require("../config/db");

// CREATE PROFILE
exports.createProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    const {
      business_name,
      industry,
      years_in_operation,
      annual_revenue,
      employees,
      location,
      funding_needed,
      business_stage,
      description,
    } = req.body;

    // Check if profile already exists
    const existing = await pool.query(
      "SELECT * FROM profiles WHERE user_id = $1",
      [userId]
    );

    if (existing.rows.length > 0) {
      return res.status(400).json({
        message: "Profile already exists. Use update instead.",
      });
    }

    const result = await pool.query(
      `INSERT INTO profiles
       (user_id, business_name, industry, years_in_operation,
        annual_revenue, employees, location,
        funding_needed, business_stage, description)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)
       RETURNING *`,
      [
        userId,
        business_name,
        industry,
        years_in_operation,
        annual_revenue,
        employees,
        location,
        funding_needed,
        business_stage,
        description,
      ]
    );

    res.status(201).json({
      message: "Profile created successfully",
      profile: result.rows[0],
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server Error" });
  }
};

// GET MY PROFILE
exports.getMyProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    const result = await pool.query(
      "SELECT * FROM profiles WHERE user_id = $1",
      [userId]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: "Profile not found" });
    }

    res.json(result.rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server Error" });
  }
};

// UPDATE PROFILE
exports.updateProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    const {
      business_name,
      industry,
      years_in_operation,
      annual_revenue,
      employees,
      location,
      funding_needed,
      business_stage,
      description,
    } = req.body;

    const result = await pool.query(
      `UPDATE profiles SET
        business_name = $1,
        industry = $2,
        years_in_operation = $3,
        annual_revenue = $4,
        employees = $5,
        location = $6,
        funding_needed = $7,
        business_stage = $8,
        description = $9,
        updated_at = CURRENT_TIMESTAMP
      WHERE user_id = $10
      RETURNING *`,
      [
        business_name,
        industry,
        years_in_operation,
        annual_revenue,
        employees,
        location,
        funding_needed,
        business_stage,
        description,
        userId,
      ]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ message: "Profile not found" });
    }

    res.json({
      message: "Profile updated successfully",
      profile: result.rows[0],
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server Error" });
  }
};

// DELETE PROFILE
exports.deleteProfile = async (req, res) => {
  try {
    const userId = req.user.id;

    await pool.query("DELETE FROM profiles WHERE user_id = $1", [
      userId,
    ]);

    res.json({ message: "Profile deleted successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Server Error" });
  }
};