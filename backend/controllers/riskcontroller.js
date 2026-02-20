const riskService = require("../services/riskmodel");

async function calculateRisk(req, res) {
  try {
    const {
      profit_margin,
      funding_ratio,
      expense_ratio,
      supplier_fragility_score,
      largest_supplier_percentage,
      data_inconsistency_count,
      sme_type,
    } = req.body;

    if (
      !profit_margin ||
      !funding_ratio ||
      !expense_ratio ||
      !supplier_fragility_score ||
      !largest_supplier_percentage ||
      !data_inconsistency_count ||
      !sme_type
    ) {
      return res.status(400).json({
        success: false,
        message: "All fields including sme_type are required",
      });
    }

    const result = await riskService.predictRisk(req.body);

    return res.status(200).json({
      success: true,
      data: result,
    });
  } catch (error) {
    console.error("Risk Prediction Error:", error);
    return res.status(500).json({
      success: false,
      message: "Prediction failed",
    });
  }
}

module.exports = {
  calculateRisk,
};