import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
import 'package:flutter/material.dart';

class DashBoardMiniContainer extends StatelessWidget {
  const DashBoardMiniContainer({
    super.key,
    this.text = "View Details",
    this.icon,
    this.hasIcon = false, this.color, this.iconColor,
  });

  final String text;
  final IconData? icon;
  final bool hasIcon;
  final Color? color,iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Utils.w(12), vertical: Utils.h(6)),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(Utils.r(20)),
      ),
      child: hasIcon
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                Text(
                  text,
                  style: TextStyle(
                    color: color?? AppColors.primaryColor,
                    fontSize: Utils.sp(12),
                  ),
                ),
                  const SizedBox(width: 6),
                    if (icon != null) ...[
                  Icon(
                    icon,
                    size: Utils.r(14),
                    color: iconColor??AppColors.primaryColor,
                  ),
                
                ],
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: Utils.sp(12),
              ),
            ),
    );
  }
}