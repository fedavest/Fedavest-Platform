import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/base_card_container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dash_button_text.dart';
import 'package:flutter/material.dart';
class InvestmentReadinessCard extends StatelessWidget {
  const InvestmentReadinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Investment Readiness",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.trending_up, size: 18)
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "69",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.dashBoardYellow),
                ),
                TextSpan(
                  text: "/100",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.69,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          const Text("Strong financial data"),
          const Text("Update your business Plan",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          DashButtonText()
        ],
      ),
    );
  }
}
