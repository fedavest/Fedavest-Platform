import 'package:flutter/material.dart';

class TagContainer extends StatelessWidget {
  final String text;
  final bool isHighlighted;

  const TagContainer({
    super.key,
    required this.text,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            isHighlighted ? const Color(0xffE8F5E9) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: isHighlighted ? Colors.green : Colors.black,
        ),
      ),
    );
  }
}