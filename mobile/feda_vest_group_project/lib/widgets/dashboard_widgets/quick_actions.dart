import 'package:flutter/material.dart';
class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
