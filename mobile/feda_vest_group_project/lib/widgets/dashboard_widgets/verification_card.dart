import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/base_card_container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dashB_Mini_Container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dash_button_text.dart';
import 'package:flutter/material.dart';
class VerificationCard extends StatelessWidget {
  const VerificationCard({super.key});

  Widget verificationRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Icon(Icons.check_circle_outline,
       color: AppColors.primaryColor,
             size: 18),
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
               text:  "Verification Status",
               textSize: 16,
                fontWeight: FontWeight.bold,
                         ),
                         DashBoardMiniContainer(text: "View Center",)
             ],
           ),
          const SizedBox(height: 12),
          verificationRow("National ID",),
          verificationRow("CAC Registration"),
          verificationRow("Location Verification"),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: (){
                Navigator.pushReplacementNamed(context, '/verification');
            },
            child: DashButtonText(
              hasIcon: true,
              text: "Complete Verification",)
          )
        ],
      ),
    );
  }
}
