const pool = require("../config/db");

// SME: Create Funding Goal & Milestones
exports.createFundingGoal = async (req, res) => {
    try {
        const userId = req.user.id;
        const { goal_amount, description, milestones } = req.body;

        const profileResult = await pool.query("SELECT id FROM sme_profiles WHERE user_id = $1", [userId]);
        const smeId = profileResult.rows[0].id;

        // Insert Goal
        const goalResult = await pool.query(
            "INSERT INTO funding_goals (sme_id, goal_amount, description) VALUES ($1, $2, $3) RETURNING *",
            [smeId, goal_amount, description]
        );
        const goalId = goalResult.rows[0].id;

        // Insert Milestones
        const createdMilestones = [];
        for (const m of milestones) {
            const mResult = await pool.query(
                "INSERT INTO milestones (funding_goal_id, description, evidence_type) VALUES ($1, $2, $3) RETURNING *",
                [goalId, m.description, m.evidence_type]
            );
            createdMilestones.push(mResult.rows[0]);
        }

        res.status(201).json({
            goal: goalResult.rows[0],
            milestones: createdMilestones
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Investor: Lock/Agree to Milestones
exports.lockMilestones = async (req, res) => {
    try {
        const { goal_id } = req.body;
        const investorId = req.user.id;

        await pool.query(
            "UPDATE milestones SET is_locked = TRUE, investor_id = $1 WHERE funding_goal_id = $2",
            [investorId, goal_id]
        );

        await pool.query(
            "UPDATE funding_goals SET status = 'Funded' WHERE id = $1",
            [goal_id]
        );

        res.json({ message: "Milestones locked and funding agreement established." });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// SME: Submit Evidence
exports.submitMilestoneEvidence = async (req, res) => {
    try {
        const { milestone_id, evidence_url, description } = req.body;

        const evidence = await pool.query(
            "INSERT INTO milestone_evidence (milestone_id, evidence_url, description) VALUES ($1, $2, $3) RETURNING *",
            [milestone_id, evidence_url, description]
        );

        // Update milestone status
        await pool.query(
            "UPDATE milestones SET status = 'Submitted' WHERE id = $1",
            [milestone_id]
        );

        res.json(evidence.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Get Milestones for a Goal
exports.getMilestones = async (req, res) => {
    try {
        const { goal_id } = req.params;
        const milestones = await pool.query(`
            SELECT m.*, e.evidence_url, e.description as evidence_desc, e.ai_validation_status
            FROM milestones m
            LEFT JOIN milestone_evidence e ON m.id = e.milestone_id
            WHERE m.funding_goal_id = $1
        `, [goal_id]);

        res.json(milestones.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
