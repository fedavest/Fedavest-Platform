import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
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
          SizedBox(height: Utils.h(12)),
          Text(
            "\$4.5M",
            style: TextStyle(
                fontSize: Utils.sp(18),
                fontWeight: FontWeight.bold,
                color: AppColors.dashBoardYellow),
          ),
          SizedBox(height: Utils.h(6)),
          ClipRRect(
            borderRadius: BorderRadius.circular(Utils.r(10)),
            child: LinearProgressIndicator(
              value: 0.45,
              minHeight: Utils.h(8),
              backgroundColor: Colors.grey.shade200,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: Utils.h(8)),
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
