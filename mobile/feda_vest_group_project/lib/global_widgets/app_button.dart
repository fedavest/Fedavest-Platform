import 'package:flutter/material.dart';
import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/utils/utils.dart';
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.text,
    this.icon,
    this.showIcon = false,
    this.onTap,
    this.isAi = false,
    this.suffixIcon,
    this.height = 50,
    this.child,
    this.isEnabled = true, // 👈 NEW
  });

  final String? text;
  final Widget? child;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool showIcon;
  final bool isAi;
  final VoidCallback? onTap;
  final double height;
  final bool isEnabled; // 👈 NEW

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.isEnabled;

    return GestureDetector(
      onTap: isDisabled ? null : widget.onTap, // 👈 disable tap
      child: Container(
        height: Utils.h(widget.height),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDisabled
              ? Colors.grey.shade400 // 👈 grey when disabled
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(Utils.r(12)),
        ),
        alignment: Alignment.center,
        child: Opacity(
          opacity: isDisabled ? 0.7 : 1, // 👈 subtle UX improvement
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Utils.w(16)),
            child: widget.child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.isAi) ...[
                      const SizedBox(width: 8),
                      Icon(
                        widget.suffixIcon ?? Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                    const SizedBox(width: 5),
                    Text(
                      widget.text ?? "Create Account",
                      style: TextStyle(
                        fontSize: Utils.sp(16),
                        color: Colors.white,
                        fontWeight: widget.showIcon
                            ? FontWeight.w500
                            : FontWeight.w600,
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
      ),
    );
  }
}