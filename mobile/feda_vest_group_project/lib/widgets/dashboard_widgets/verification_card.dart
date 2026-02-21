import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/base_card_container.dart';
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
          const Icon(Icons.check_circle,
       
              color: AppColors.primaryColor, size: 18),
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
          const Text(
            "Verification Status",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          verificationRow("National ID"),
          verificationRow("CAC Registration"),
          verificationRow("Location Verification"),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Complete Verification"),
                SizedBox(width: 6),
                Icon(Icons.arrow_forward, size: 18)
              ],
            ),
          )
        ],
      ),
    );
  }
}
