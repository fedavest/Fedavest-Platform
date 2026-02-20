const express = require("express");
const router = express.Router();
const { verifyToken } = require("../middleware/authmiddleware");
const { verifyUserStatus, getAllUsers } = require("../controllers/admincontroller");

// In a real app, we would have a verifyAdmin middleware here
router.post("/verify-status", verifyToken, verifyUserStatus);
router.get("/users", verifyToken, getAllUsers);

module.exports = router;
