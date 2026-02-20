const express = require("express");
const router = express.Router();
const { predictReadiness } = require("../services/readinessmodel");

// POST /api/v1/ai/predict
router.post("/predict", async (req, res) => {
  try {
    const {
      Initial_Capital,
      Annual_revenue,
      Monthly_revenue,
      Profit_margin,
      Monthly_expenses,
      Total_debt,
      Funding_needed,
      Team_size,
      Business_age_years,
      Revenue_last_6_month_avg
    } = req.body;

    // Put features in the exact order your model expects
    const features = [
      Initial_Capital,
      Annual_revenue,
      Monthly_revenue,
      Profit_margin,
      Monthly_expenses,
      Total_debt,
      Funding_needed,
      Team_size,
      Business_age_years,
      Revenue_last_6_month_avg
    ];

    const prediction = await predictReadiness(features);

    res.json({
  success: true,
  readiness: prediction
});


  } catch (error) {
    console.error("AI ERROR", error);

    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

module.exports = router;
