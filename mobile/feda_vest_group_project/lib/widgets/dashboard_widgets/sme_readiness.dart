import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class InvestmentReadinessScreen extends StatelessWidget {
  const InvestmentReadinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: Column(
        children: [
          /// HEADER SECTION
          AuthHeader(
            avatarText: "69/\n100" ,
           onTap: (){
            Navigator.pushReplacementNamed(context, '/bottomNav');
           },
            isReadiness: true,
            showIcon: true,
            isSigninScreen: true,
            heading: "Good Investment Readiness",
          ),
          const SizedBox(height: 6),
          const Text(
            "You're on the right track! A few improvements\nwill boost your score.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ProgressBar(value: 0.1),
          ),

          /// BODY
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Strength/Gaps/Potential Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SmallStatCard(
                        image: Image(image: AssetImage(AuthImages.check)),
                        title: "Strengths",
                        value: "5",
                    
                   
                      ),
                      SmallStatCard(
                        image: Image(image: AssetImage(AuthImages.error)),
                        title: "Gaps",
                        value: "3",
                     
                   
                      ),
                      SmallStatCard(
                        image: Image(image: AssetImage(AuthImages.arrow)),
                        title: "Potential",
                        value: "90+",
                     
                 
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Category Breakdown",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  /// REUSABLE BREAKDOWN CARDS
                  BreakdownCard(
                    title: "Financial data",
                    score: 85,
                    subtitle: "Strong financial records and projections",
                    image: Image(image: AssetImage(AuthImages.dollar)),
                  ),
                  BreakdownCard(
                    title: "Business Plan",
                    isBiz: true,
                    score: 65,
                    subtitle: "Strong financial records and projections",
                   image: Image(image: AssetImage(AuthImages.bookmark)),
                  ),
                  BreakdownCard(
                    title: "Team & Operation",
                    score: 78,
                    subtitle: "Experience team with clear roles",
                  image: Image(image: AssetImage(AuthImages.teams)),
                  ),
                  BreakdownCard(
                    title: "Market Opportunity",
                    score: 70,
                    subtitle: "Growing market with competition",
image: Image(image: AssetImage(AuthImages.arrow)),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "AI Recommendations",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  const RecommendationItem(
                    title: "Expand your business plan",
                    description:
                        "Add more details about your target market, competitive analysis and go-to-market strategy.",
                  ),
                  const RecommendationItem(
                    title: "Upload Financial statements",
                    description:
                        "Add your latest profit & loss statement and balance sheet to boost credibility.",
                  ),
                  const RecommendationItem(
                    title: "Define growth milestones",
                    description:
                        "Set clear quarterly goals for revenue, production and team expansion.",
                  ),

                  const SizedBox(height: 24),

                  /// BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Update Readiness Data",
                      
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "Last updated Feb 12, 2026. AI analysis refreshes weekly",
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// ONE REUSABLE BREAKDOWN CONTAINER
////////////////////////////////////////////////////////////

class BreakdownCard extends StatelessWidget {
  final String title;
  final int score;
  final String subtitle;
  final IconData? icon;
  final Image image;
   final bool isBiz;

  const BreakdownCard({
    super.key,
       this.isBiz = false,
    required this.title,
    required this.score,
    required this.subtitle,
     this.icon, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
             image,
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                score.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 6,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(
          isBiz
              ? const Color(0xff1E3DA4)
              : const Color(0xFF103813),)
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// SMALL STAT CARD
////////////////////////////////////////////////////////////

class SmallStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final Color? color;
  final Image image;

  const SmallStatCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
 this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          image,
          const SizedBox(height: 6),

          Text(title, style: const TextStyle(fontSize: 12, color: Colors.black)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// RECOMMENDATION ITEM
////////////////////////////////////////////////////////////

class RecommendationItem extends StatelessWidget {
  final String title;
  final String description;

  const RecommendationItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
