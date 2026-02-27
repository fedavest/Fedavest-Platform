import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String text;
  final bool isHighlighted;

  const TagContainer({
    super.key,
    required this.text,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            isHighlighted ?  Colors.white : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: isHighlighted ? AppColors.dashBoardYellow : Colors.black,
        ),
      ),
    );
  }
}