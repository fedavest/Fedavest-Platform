import 'package:flutter/material.dart';
class QuickActionButton extends StatelessWidget {
  final Image image;
  final String title;

  const QuickActionButton({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 13),
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
          image,
          Text(title),
        ],
      ),
    );
  }
}
