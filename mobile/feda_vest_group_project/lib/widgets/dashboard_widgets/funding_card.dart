import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/base_card_container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dashB_Mini_Container.dart';
import 'package:flutter/material.dart';
class FundingProgressCard extends StatelessWidget {
  const FundingProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Funding Progress",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, RouteName.fundingDeets);
                },
                child: DashBoardMiniContainer())
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "\$4.5M",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.dashBoardYellow),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.45,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("8 investors interested"),
               const Text("45% Funded",
              style: TextStyle(color: AppColors.primaryColor)),
            ],
          ),
         
        ],
      ),
    );
  }
}
