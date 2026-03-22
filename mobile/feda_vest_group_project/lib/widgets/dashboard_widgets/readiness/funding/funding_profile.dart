import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/dashB_Mini_Container.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/funding_success.dart';
import 'package:feda_vest_group_project/widgets/text_box.dart';
import 'package:flutter/material.dart';

class FundingProfileDialog extends StatefulWidget {
  const FundingProfileDialog({Key? key}) : super(key: key);

  @override
  State<FundingProfileDialog> createState() => _FundingProfileDialogState();
}

class _FundingProfileDialogState extends State<FundingProfileDialog> {
  final TextEditingController _fundingGoalController = TextEditingController();
  String selectedCategory = 'Production';
  List<Milestone> milestones = [Milestone(label: 'High', value: 5565)];

  @override
  void dispose() {
    _fundingGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),

          height: 550,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),

          //  constraints: const BoxConstraints(maxWidth: 300),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      text: 'Funding Profile',

                      textSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Funding Goal
                const AppText(
                  text: 'Funding Goal(\u20A6)',

                  textSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E3A),
                ),
                const SizedBox(height: 10),
                TextBoxField(fundingGoalController: _fundingGoalController),
                const SizedBox(height: 32),

                const AppText(
                  text: 'Impact Category',
                  textSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E3A),
                ),
                const SizedBox(height: 12),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryButton('Meal Gap'),
                    const SizedBox(width: 12),
                    _buildCategoryButton('Distribution'),
                    const SizedBox(width: 12),
                    _buildCategoryButton('Production'),
                  ],
                ),
                const SizedBox(height: 32),

                // Milestones
                const Text(
                  'Milestones',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E3A),
                  ),
                ),
                // const SizedBox(height: 12),

                // Milestone List
                ...milestones.map((milestone) => _buildMilestoneRow(milestone)),

                const SizedBox(height: 10),

                // Save Button
                AppButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return FundingSuccess();
                      },
                    );
                  },
                  text: "Save Funding Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    final isSelected = selectedCategory == category;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = category;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? AppColors.primaryColor
              : Color(0xffb6b6b6),
          foregroundColor: isSelected ? Colors.white : Colors.black,
          padding: const EdgeInsets.all(7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          textAlign: TextAlign.center,

          category,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildMilestoneRow(Milestone milestone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              milestone.label,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              milestone.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                // Handle add milestone action
                setState(() {
                  milestones.add(Milestone(label: 'Medium', value: 0));
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
