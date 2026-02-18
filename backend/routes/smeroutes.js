const express = require("express");
const router = express.Router();
const { verifyToken } = require("../middleware/authmiddleware");
const { submitBusinessMetrics, getBusinessMetrics } = require("../controllers/businessmetricscontroller");
const { createFundingGoal, submitMilestoneEvidence } = require("../controllers/milestonecontroller");

router.post("/metrics", verifyToken, submitBusinessMetrics);
router.get("/metrics", verifyToken, getBusinessMetrics);
router.post("/goals", verifyToken, createFundingGoal);
router.post("/milestones/evidence", verifyToken, submitMilestoneEvidence);

module.exports = router;
