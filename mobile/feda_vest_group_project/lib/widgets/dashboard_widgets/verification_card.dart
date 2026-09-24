import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/base_card_container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dashB_Mini_Container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dash_button_text.dart';
import 'package:flutter/material.dart';

class VerificationCard extends StatelessWidget {
  const VerificationCard({super.key});

  Widget verificationRow(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Utils.h(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
           Icon(
            Icons.check_circle_outline,
            color: AppColors.primaryColor,
            size: Utils.r(18),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "Verification Status",
                textSize: 16,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                onTap: (){
                 Navigator.pushReplacementNamed(context, RouteName.viewCenter);
                },
                child: DashBoardMiniContainer(text: "View Center")),
            ],
          ),
          SizedBox(height: Utils.h(12)),
          verificationRow("National ID"),
          verificationRow("CAC Registration"),
          verificationRow("Location Verification"),
          SizedBox(height: Utils.h(16)),
          DashButtonText(hasIcon: true, text: "Complete Verification", onTap:(){
              Navigator.pushReplacementNamed(context, RouteName.verification);
          } ,),
        ],
      ),
    );
  }
}
