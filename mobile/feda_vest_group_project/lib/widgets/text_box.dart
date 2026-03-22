import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/funding_profile.dart';
import 'package:flutter/material.dart';



class TextBoxField extends StatelessWidget {
  const TextBoxField({
    super.key,
    required TextEditingController fundingGoalController,
  }) : _fundingGoalController = fundingGoalController;

  final TextEditingController _fundingGoalController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _fundingGoalController,
      decoration: InputDecoration(
        hintText: 'Enter your funding goal',
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
borderSide: BorderSide(
  color: Color(0xffb6b6b6)
)        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}

class Milestone {
  String label;
  int value;

  Milestone({required this.label, required this.value});
}

// Usage example:
void showFundingProfileDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const FundingProfileDialog(),
  );
}