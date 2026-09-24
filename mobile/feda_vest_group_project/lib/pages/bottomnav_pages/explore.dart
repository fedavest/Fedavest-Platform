import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
import 'package:feda_vest_group_project/widgets/explore_widgets/filter_chip.dart';
import 'package:feda_vest_group_project/widgets/explore_widgets/search_field.dart';
import 'package:feda_vest_group_project/widgets/explore_widgets/sme_card.dart';
import 'package:flutter/material.dart';

class ExploreSmesScreen extends StatelessWidget {
  const ExploreSmesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6F7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
       // leading: const BackButton(color: Colors.black),
        title: const Text(
          "Explore SMEs",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utils.w(16)),
        child: ListView(
          children: [
            SizedBox(height: Utils.h(12)),
            ReusableSearchField(
              image: Image(image: AssetImage(AuthImages.arrow)),
            ),
            SizedBox(height: Utils.h(14)),

            /// Filters Row
            Row(
              children: [
                FilterChipButton(text: "Meal Gap", isSelected: false),
                SizedBox(width: Utils.w(8)),
                FilterChipButton(text: "Distribution", isSelected: false),
                SizedBox(width: Utils.w(8)),
                FilterChipButton(text: "Production", isSelected: true),
              ],
            ),

            SizedBox(height: Utils.h(16)),

            /// SME CARDS
            SMECardContainer(),
            SizedBox(height: Utils.h(14)),
            SMECardContainer(
              name: "SunBake Co-op",
              initials: "SB",
              readiness: "81",
              risk: "2.4",
              goal: "\$2.0M",
              industry: "Bakery & Confectionery",
            ),

            SizedBox(height: Utils.h(14)),
            SMECardContainer(
              name: "SunBake Co-op",
              initials: "SB",
              readiness: "81",
              risk: "2.4",
              goal: "\$2.0M",
              industry: "Bakery & Confectionery",
            ),
          ],
        ),
      ),
    );
  }
}