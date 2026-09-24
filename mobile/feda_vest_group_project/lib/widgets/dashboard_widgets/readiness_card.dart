import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
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
            children:  [
              Text(
                " Readiness",
                
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: Utils.sp(18)),
              ),
              Icon(Icons.trending_up, size: Utils.r(22))
            ],
          ),
          SizedBox(height: Utils.h(12)),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "69",
                  style: TextStyle(
                      fontSize: Utils.sp(20),
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
          SizedBox(height: Utils.h(10)),
          ClipRRect(
            borderRadius: BorderRadius.circular(Utils.r(10)),
            child: LinearProgressIndicator(
              value: 0.69,
              minHeight: Utils.h(8),
              backgroundColor: Colors.grey.shade200,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: Utils.h(12)),
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
