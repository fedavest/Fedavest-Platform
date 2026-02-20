const express = require("express");
const router = express.Router();
const riskController = require("../controllers/riskcontroller");

// POST /api/v1/ai/predict-risk
router.post("/predict-risk", riskController.calculateRisk);

module.exports = router;