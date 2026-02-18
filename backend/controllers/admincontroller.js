const pool = require("../config/db");

exports.verifyUserStatus = async (req, res) => {
    try {
        const { userId, status } = req.body; // status: 'Verified', 'Limited', 'Pending'

        const validStatuses = ['Pending', 'Verified', 'Limited'];
        if (!validStatuses.includes(status)) {
            return res.status(400).json({ message: "Invalid status" });
        }

        const isVerified = status === 'Verified';

        const result = await pool.query(
            "UPDATE users SET verification_status = $1, is_verified = $2 WHERE id = $3 RETURNING id, name, verification_status, is_verified",
            [status, isVerified, userId]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: "User not found" });
        }

        res.json({
            message: `User status updated to ${status}`,
            user: result.rows[0]
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

exports.getAllUsers = async (req, res) => {
    try {
        const users = await pool.query("SELECT id, name, email, role, verification_status, is_verified FROM users");
        res.json(users.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};
