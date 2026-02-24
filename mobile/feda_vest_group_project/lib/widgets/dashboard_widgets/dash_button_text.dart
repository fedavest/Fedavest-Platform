import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
class DashButtonText extends StatelessWidget {
  const DashButtonText({
    super.key,
    this.text,
    this.hasIcon = false,
  });

  final String? text;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? "Update Now",
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
            ),
          ),

          hasIcon
              ? Row(
                  children: [
                    const SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: AppColors.primaryColor,
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}