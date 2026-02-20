const express = require("express");
const router = express.Router();
const { verifyToken } = require("../middleware/authmiddleware");
const { getRecommendedSmes, getSmeDetails } = require("../controllers/investorcontroller");
const { lockMilestones, getMilestones } = require("../controllers/milestonecontroller");

router.get("/recommendations", verifyToken, getRecommendedSmes);
router.get("/sme/:id", verifyToken, getSmeDetails);
router.post("/milestones/lock", verifyToken, lockMilestones);
router.get("/milestones/:goal_id", verifyToken, getMilestones);

module.exports = router;
