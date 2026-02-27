import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
class FilterChipButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterChipButton({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Color(0XffF4F4F4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
color: Color(0xff525252)
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}