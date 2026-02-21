import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/pages/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';

class IndexIndicator extends StatelessWidget {
  const IndexIndicator({
    super.key,
    required this.onboardingList,
    required this.size,
    required this.currentIndex,
  });

  final List<OnboardingData> onboardingList;
  final Size size;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingList.length,
        (dotIndex) => Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.01),
          height: size.width * 0.02,
          width: currentIndex == dotIndex
              ? size.width * 0.02
              : size.width * 0.02,
          decoration: BoxDecoration(
            color: currentIndex == dotIndex
                ? AppColors.primaryColor
                : Colors.grey.shade300,
            borderRadius:
                BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
