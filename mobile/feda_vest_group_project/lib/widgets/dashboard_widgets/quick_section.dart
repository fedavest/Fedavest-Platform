import 'package:feda_vest_group_project/constants/asset_images.dart';
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
                  image: Image(image: AssetImage(AuthImages.uploadImage)),
                  title: "Upload Docs"),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                image: Image(image: AssetImage(AuthImages.updateImage)),
                  title: "Update Data"),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                 image: Image(image: AssetImage(AuthImages.fundingImage)),
                  title: "Funding Goal"),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
image: Image(image: AssetImage(AuthImages.riskImage)),
                  title: "Risk Insights"),
            ),
          ],
        ),
      ],
    );
  }
}
