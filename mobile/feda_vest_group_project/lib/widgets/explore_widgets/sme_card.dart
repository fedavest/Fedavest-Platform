import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/progress_bar.dart';
import 'package:feda_vest_group_project/widgets/explore_widgets/sme+stat_item.dart';
import 'package:feda_vest_group_project/widgets/explore_widgets/tag_container.dart';
import 'package:flutter/material.dart';

class SMECardContainer extends StatelessWidget {
  final String name;
  final String initials;
  final String readiness;
  final String risk;
  final String goal;
  final String industry;

  const SMECardContainer({
    super.key,
    this.name = "AquaFresh Fisheries",
    this.initials = "AI",
    this.readiness = "94",
    this.risk = "1.5",
    this.goal = "\$3.5M",
    this.industry = "Fisheries & Aquaculture",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              CircleAvatar(
                backgroundColor:  AppColors.primaryColor,
                child: Text(initials,
                    style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Port Harcourt, Nigeria",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.shield_sharp, color: Colors.green, size: 20),
            ],
          ),

          const SizedBox(height: 12),

          /// Stats
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(16),
              
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SMEStatItem(title: "Readiness", value: readiness),
                  VerticalDivider(thickness: 2,color: Colors.black,),
                  SMEStatItem(title: "Risk", value: risk),
                   VerticalDivider(thickness: 2,color: Colors.grey,),
                  SMEStatItem(title: "Goal", value: goal, color: AppColors.dashBoardYellow,),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          const ProgressBar(
            value: 3.0,
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const TagContainer(text: "Production"),
              const SizedBox(width: 6),
              TagContainer(text: industry, isHighlighted: true),
            ],
          ),
        ],
      ),
    );
  }
}