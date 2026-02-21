import 'package:feda_vest_group_project/widgets/dashboard_widgets/quick_actions.dart';
import 'package:flutter/material.dart';
class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Quick Actions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                  icon: Icons.upload_file,
                  title: "Upload Docs"),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                  icon: Icons.update,
                  title: "Update Data"),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                  icon: Icons.show_chart,
                  title: "Funding Goal"),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                  icon: Icons.warning_amber_outlined,
                  title: "Risk Insights"),
            ),
          ],
        ),
      ],
    );
  }
}
