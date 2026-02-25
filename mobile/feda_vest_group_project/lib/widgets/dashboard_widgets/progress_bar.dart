import 'package:flutter/material.dart';
class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.value,  this.isBiz = false});

  final double value;
  final bool isBiz;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        backgroundColor: Colors.grey.shade200,
        valueColor:
             AlwaysStoppedAnimation<Color>(isBiz?const Color(0xff1E3DA4):const Color(0xFF103813)),
      ),
    );
  }
}