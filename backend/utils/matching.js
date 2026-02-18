/**
 * AI Impact-Aware Investor Matching
 * Logic: Matches SMEs with Investors based on sector preferences, impact categories, and risk tolerance.
 */
exports.matchSmesToInvestor = (investorProfile, allSmes) => {
    const matchedSmes = allSmes.map(sme => {
        let matchScore = 0;
        const reasons = [];

        // Sector Match (Simplified: checking if SME description or stage matches)
        // In a real app, SME would have explicit sector tags
        const sectorMatch = investorProfile.sector_preferences.some(pref =>
            sme.business_description?.toLowerCase().includes(pref.toLowerCase()) ||
            sme.product_stage?.toLowerCase().includes(pref.toLowerCase())
        );
        if (sectorMatch) {
            matchScore += 40;
            reasons.push("Matches your preferred food sectors");
        }

        // Impact Match
        // Assuming impact categories are part of SME mission or business model
        const impactMatch = investorProfile.impact_preferences.some(pref =>
            sme.business_description?.toLowerCase().includes(pref.toLowerCase())
        );
        if (impactMatch) {
            matchScore += 30;
            reasons.push("Aligns with your impact goals");
        }

        // Risk Match
        if (investorProfile.risk_tolerance === 'High' ||
            (investorProfile.risk_tolerance === 'Medium' && (sme.risk_level === 'Low' || sme.risk_level === 'Medium')) ||
            (investorProfile.risk_tolerance === 'Low' && sme.risk_level === 'Low')) {
            matchScore += 30;
            reasons.push("Within your risk tolerance levels");
        } else {
            matchScore -= 10;
        }

        // Readiness weight
        matchScore += (sme.readiness_score / 10);

        return {
            ...sme,
            match_score: Math.min(100, matchScore),
            reasons
        };
    });

    // Sort by match score descending
    return matchedSmes.sort((a, b) => b.match_score - a.match_score);
};
