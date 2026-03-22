import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/fundingdetails.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/verifcation/verificationcenter.dart';
import 'package:flutter/material.dart';

class FundingGoalScreen extends StatelessWidget {
  const FundingGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: const [
          AppHeader(
            title: "Funding Goal",
            subtitle: "Define your funding needs and use of funds",
          ),
          Expanded(child: FundingGoalContent()),
        ],
      ),
    );
  }
}

class FundingGoalContent extends StatelessWidget {
  const FundingGoalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          ActiveGoalCard(),
          SizedBox(height: 16),
          FundingDetailsCard(),
          SizedBox(height: 16),
          UseOfFundsCard(),
          SizedBox(height: 16),
          DocumentsCard(),
          SizedBox(height: 16),
          SaveButton(),
        ],
      ),
    );
  }
}

class FundingDetailsCard extends StatelessWidget {
  const FundingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: const [
          SectionTitle("Funding Details"),
          ListTile(title: Text("Total Amount"), trailing: Text("10M")),
          ListTile(title: Text("Timeline"), trailing: Text("12 months")),
          ListTile(title: Text("Investment Type"), trailing: Text("Equity")),
        ],
      ),
    );
  }
}

class UseOfFundsCard extends StatelessWidget {
  const UseOfFundsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: const [
          SectionTitle("Use of Funds"),
          ListTile(title: Text("Greenhouse"), trailing: Text("6M")),
          ListTile(title: Text("Irrigation"), trailing: Text("2M")),
          ListTile(title: Text("Equipment"), trailing: Text("1M")),
          ListTile(title: Text("Working Capital"), trailing: Text("0.5M")),
        ],
      ),
    );
  }
}

class DocumentsCard extends StatelessWidget {
  const DocumentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: const [
          SectionTitle("Supporting Documents"),
          ListTile(title: Text("Business Plan"), trailing: Text("View")),
          ListTile(title: Text("Financial Projection"), trailing: Text("View")),
          ListTile(title: Text("Site Plans"), trailing: Text("View")),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0B5D2E),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {},
        child: const Text("Save Changes"),
      ),
    );
  }
}
