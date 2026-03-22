import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dashB_Mini_Container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/progress_bar.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/verifcation/verificationcenter.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;

  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class FundingImpactScreen extends StatelessWidget {
  const FundingImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: Column(
        children: const [
          AppHeader(
            title: "Funding & Impact",
            subtitle: "Track your funding goals and milestones",
          ),
          Expanded(child: FundingImpactContent()),
        ],
      ),
    );
  }
}

class FundingImpactContent extends StatelessWidget {
  const FundingImpactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          ActiveGoalCard(),
          SizedBox(height: 16),
          MilestonesCard(),
          SizedBox(height: 16),
          ImpactReportCard(),
          SizedBox(height: 16),
          CredibilityCard(),
        ],
      ),
    );
  }
}

class ActiveGoalCard extends StatelessWidget {
  const ActiveGoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Active Funding Goal",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Image(image: AssetImage(AuthImages.fundingArrow)),
            ],
          ),

          const SizedBox(height: 5),
          // const ProgressBar(0.45),
          const SizedBox(height: 8),
          //const Text("8 investors • 45% funded"),
          AppText(
            text: "Greenhouse Expansion Project",
            textSize: 16,
            fontWeight: FontWeight.w500,
          ),
          AppText(
            text:
                "Funding to build 2 new greenhouses for year round production",
            textSize: 14,
            maxline: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "\$4.5M",
                fontWeight: FontWeight.bold,
                textSize: 24,
                color: AppColors.dashBoardYellow,
              ),
              AppText(
                text: "of \$10M",
                fontWeight: FontWeight.w500,
                textSize: 14,
              ),
            ],
          ),
          ProgressBar(isBiz: false, value: 0.5),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: "8 investors interested", textSize: 16),
              AppText(
                text: "45% Funded",
                color: AppColors.dashBoardYellow,
                textSize: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, RouteName.editFundingGoal);
              },
              child: DashBoardMiniContainer(
                hasIcon: true,
                text: "Edit Funding Goal",
                icon: Icons.arrow_forward,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MilestonesCard extends StatelessWidget {
  const MilestonesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: "Milestones",
              fontWeight: FontWeight.bold,
              textSize: 18,
            ),
            AppText(
              text: "View All",
              textSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        AppCard(
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Land Preparation",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      DashBoardMiniContainer(text: "Completed"),
                    ],
                  ),
                  AppText(
                    text: "Site cleared and foundation laid for greenhouses",
                    textSize: 12,
                  ),
                  Row(
                    children: [
                      Icon(Icons.description_outlined, size: 12),
                      AppText(
                        text: "3 evidence files uploaded",
                        textSize: 12,
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.flag_circle_sharp,

                            size: 20,
                            color: Color(0xff1E3DA4),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Material Procurement",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      DashBoardMiniContainer(text: "In Progress"),
                    ],
                  ),
                  AppText(
                    text:
                        "Ordering greenhouse frames and irrigation systems",
                    textSize: 12,
                  ),
                  ProgressBar(value: 20, isBiz: true),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.file_upload_outlined,
                        color: Color(0xff1E3DA4),
                        size: 20,
                      ),
                      AppText(
                        text: "Upload Evidence",
                        color: Color(0xff1E3DA4),
                        textSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 18,
                            height: 20,

                            decoration: BoxDecoration(
                              color: Color(0xffB57805),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.error_outline,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Construction Phase",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      DashBoardMiniContainer(text: "Pending"),
                    ],
                  ),
                  AppText(
                    text: "Build greenhouse structures",
                    textSize: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImpactReportCard extends StatelessWidget {
  const ImpactReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "Impact Report",
                textSize: 18,
                fontWeight: FontWeight.w600,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffE8EFE9),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.trending_up, size: 22),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffE8EFE9),
                  borderRadius: BorderRadius.circular(13),
                  // shape: BoxShape.circle
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Families Fed", style: TextStyle(fontSize: 16)),
                    Text("450", style: TextStyle(fontSize: 16, color:AppColors.primaryColor)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffE8EFE9),
                  borderRadius: BorderRadius.circular(13),
                  // shape: BoxShape.circle
                ),
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jobs Created", style: TextStyle(fontSize: 16)),
                    Text("12", style: TextStyle(fontSize: 16, color: Color(0xff1E3DA4))),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          AppText(
            text:
                "Your current operations are making a positive impact on food security in lagos.",
            maxline: 2,
            textSize: 16,
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: (){
              //  Navigator.p
              },
              child: DashBoardMiniContainer(
                hasIcon: true,
                
                icon: Icons.arrow_forward_outlined,
                text: "Generate Full Report",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CredibilityCard extends StatelessWidget {
  const CredibilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "Credibility Score",
                textSize: 16,
                fontWeight: FontWeight.w500,
              ),
              AppText(text: "94", textSize: 16, fontWeight: FontWeight.w500),
            ],
          ),
          AppText(
            text:
                "Excellent track record!. You’ve delivered on 100% of your milestones.",
            maxline: 2,
            textSize: 14,
          ),
             SizedBox(height: 7),
          Row(
            children: [
              const Icon(
                            Icons.check_circle,
                            size: 20,
                            color: AppColors.primaryColor,
                          ),
                          AppText(
                            text: "Trusted by 8 investors",
                             textSize: 14,
                          )
            ],
          )
        ],
      ),
    );
  }
}
