import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/funding_card.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/quick_section.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness_card.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/verification_card.dart';
import 'package:flutter/material.dart';

class SmeDashboardScreen extends StatelessWidget {
  const SmeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
             AuthHeader(
              isDashboard: true,
             isSignupScreen: true,
              subheading: "GreenHarvest Foods",
              heading: "Welcome,",
            ),
      
            const SizedBox(height: 16),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: const [
                  VerificationCard(),
                  SizedBox(height: 10),
                  InvestmentReadinessCard(),
                  SizedBox(height: 20),
                  FundingProgressCard(),
                  SizedBox(height: 16),
                  QuickActionsSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
