/**
 * Simulated AI Readiness Scoring
 * Inputs: business metrics
 * Outputs: readiness score, strengths, gaps, suggestions
 */
exports.calculateReadinessScore = (metrics) => {
    let score = 50; // Base score
    const strengths = [];
    const gaps = [];
    const suggestions = [];

    // Revenue consistency
    if (metrics.annual_revenue > 10000000) { // > 10M Naira
        score += 15;
        strengths.push("Substantial annual revenue");
    } else {
        gaps.push("Low annual revenue scale");
        suggestions.push("Focus on scaling production to increase annual turnover");
    }

    // Profit margin
    if (metrics.profit_margin > 20) {
        score += 10;
        strengths.push("Healthy profit margins (>20%)");
    } else if (metrics.profit_margin < 5) {
        score -= 10;
        gaps.push("Thin profit margins");
        suggestions.push("Review operational costs to improve margins");
    }

    // Debt to revenue ratio
    const debtRatio = metrics.total_debt / (metrics.annual_revenue || 1);
    if (debtRatio < 0.2) {
        score += 10;
        strengths.push("Low debt-to-revenue ratio");
    } else if (debtRatio > 0.5) {
        score -= 10;
        gaps.push("High debt burden");
        suggestions.push("Consider debt restructuring or reducing liabilities");
    }

    // Team size & Business age
    if (metrics.business_age_years > 2) {
        score += 5;
        strengths.push("Established business operation (>2 years)");
    } else {
        gaps.push("Early stage business");
        suggestions.push("Document early wins and traction clearly for investors");
    }

    // Cap score at 100 and min 0
    score = Math.min(100, Math.max(0, score));

    return {
        score,
        strengths,
        gaps,
        suggestions
    };
};

/**
 * Simulated AI Risk & Resilience Detection
 */
exports.detectRiskAndResilience = (metrics, profile) => {
    let riskLevel = "Low";
    const indicators = [];
    let resilienceSummary = "Business shows stable operations with standard industry risks.";

    if (metrics.monthly_expenses > metrics.monthly_revenue) {
        riskLevel = "High";
        indicators.push("Negative monthly cashflow");
        resilienceSummary = "Critical financial risk detected due to expenses exceeding revenue.";
    } else if (metrics.total_debt > (metrics.annual_revenue * 0.8)) {
        riskLevel = "Medium";
        indicators.push("High leverage ratio");
        resilienceSummary = "Business is heavily leveraged which may impact long-term resilience.";
    }

    // Data anomaly check (simulated)
    if (metrics.annual_revenue < (metrics.monthly_revenue * 6)) {
        indicators.push("Revenue data inconsistency detected");
        riskLevel = riskLevel === "High" ? "High" : "Medium";
    }

    return {
        riskLevel,
        indicators,
        resilienceSummary,
        confidenceIndicator: "85%"
    };
};
