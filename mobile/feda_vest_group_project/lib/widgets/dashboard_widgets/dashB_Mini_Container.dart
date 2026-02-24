import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DashBoardMiniContainer extends StatelessWidget {
  const DashBoardMiniContainer({
    super.key, this.text,
  });
final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Text(
        style: TextStyle(color: AppColors.primaryColor, fontSize: 12 ),
        text??
        "View Details"),
    );
  }
}
