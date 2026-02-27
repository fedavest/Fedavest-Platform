import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
class SMEStatItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const SMEStatItem({
    super.key,
    required this.title,
    this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color:color??AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}