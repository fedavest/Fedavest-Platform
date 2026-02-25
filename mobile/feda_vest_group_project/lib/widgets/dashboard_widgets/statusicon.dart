import 'package:flutter/material.dart';
class StatusIcon extends StatelessWidget {
  const StatusIcon({super.key, required this.isVerified});

  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isVerified
            ? const Color(0xFFE6F4EA)
            : const Color(0xFFFFF4D6),
      ),
      child: Icon(
        isVerified
            ? Icons.check_outlined
            : Icons.error_outline,
        color: isVerified
            ? Colors.green
            : const Color(0xFFD4AF37),
      ),
    );
  }
}