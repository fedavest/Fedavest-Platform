import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
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
      padding: EdgeInsets.all(Utils.w(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Utils.r(16)),
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
                    style: TextStyle(color: Colors.white, fontSize: Utils.sp(14))),
              ),
              SizedBox(width: Utils.w(10)),
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
                    SizedBox(height: Utils.h(2)),
                    Text(
                      "Port Harcourt, Nigeria",
                      style: TextStyle(fontSize: Utils.sp(12), color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Icon(Icons.shield_sharp, color: Colors.green, size: Utils.r(20)),
            ],
          ),

          SizedBox(height: Utils.h(12)),

          /// Stats
          Container(
            padding: EdgeInsets.all(Utils.w(15)),
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(Utils.r(16)),
              
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

          SizedBox(height: Utils.h(10)),

          const ProgressBar(
            value: 3.0,
          ),

          SizedBox(height: Utils.h(10)),

          Row(
            children: [
              const TagContainer(text: "Production"),
              SizedBox(width: Utils.w(6)),
              TagContainer(text: industry, isHighlighted: true),
            ],
          ),
        ],
      ),
    );
  }
}