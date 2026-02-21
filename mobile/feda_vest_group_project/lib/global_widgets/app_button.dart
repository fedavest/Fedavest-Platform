import 'package:flutter/material.dart';
import 'package:feda_vest_group_project/constants/app_colors.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.text,
    this.icon,
    this.showIcon = false,
    this.onTap,
    this.height = 50,
  });

  final String? text;
  final IconData? icon;
  final bool showIcon;
  final VoidCallback? onTap;
  final double height;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text ?? "Create Account",
                style:  TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: widget.showIcon ? FontWeight.w500 : FontWeight.w600,

                ),
              ),

              if (widget.showIcon) ...[
                const SizedBox(width: 8),
                Icon(
                  widget.icon ?? Icons.arrow_forward,
                  color: Colors.white,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

