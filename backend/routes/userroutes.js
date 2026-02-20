const express = require("express");
const router = express.Router();
const { verifyToken } = require("../middleware/authmiddleware");
const { getMyProfile, updateSmeProfile, updateInvestorProfile } = require("../controllers/profilecontroller");

router.get("/profile", verifyToken, getMyProfile);
router.post("/profile/sme", verifyToken, updateSmeProfile);
router.post("/profile/investor", verifyToken, updateInvestorProfile);

module.exports = router;
