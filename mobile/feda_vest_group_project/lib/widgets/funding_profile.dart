import 'package:feda_vest_group_project/global_widgets/app_text.dart';
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
  List<Milestone> milestones = [
    Milestone(label: 'High', value: 5565),
  ];

  @override
  void dispose() {
    _fundingGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
      ),
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
               text:  'Funding Profile',
                
                  textSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E3A),
                
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 32),
                onPressed: () => Navigator.of(context).pop(),
                color: const Color(0xFF2C3E3A),
              ),
            ],
          ),
          const SizedBox(height: 32),
    
          // Funding Goal
          const AppText(
          text: 'Funding Goal(\u20A6)',
           
              textSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E3A),
            
          ),
          const SizedBox(height: 12),
          TextBoxField(fundingGoalController: _fundingGoalController),
          const SizedBox(height: 32),
    
       
          const AppText(
            text:'Impact Category',
              textSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E3A),
            
          ),
          const SizedBox(height: 12),
          Row(
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
          const SizedBox(height: 12),
    
          // Milestone List
          ...milestones.map((milestone) => _buildMilestoneRow(milestone)),
    
          const SizedBox(height: 32),
    
          // Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle save action
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A5249),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Save Funding Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
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
              ? const Color(0xFF3A5249)
              : Colors.white.withOpacity(0.7),
          foregroundColor: isSelected ? Colors.white : const Color(0xFF6B7C77),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          category,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              milestone.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF3A5249),
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
