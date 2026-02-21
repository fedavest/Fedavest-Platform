import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
     this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggle,  this.hasImage =false, this.image,
  });
  final String label;
  final String hint;
  final IconData? icon;
     final bool hasImage;
  final Image? image;
 final bool isPassword;
 final bool obscureText;
 final VoidCallback? onToggle;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          const SizedBox(height: 8),
          TextField(
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hint,
              prefixIcon: widget.hasImage? widget.image : Icon(widget.icon),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        color: Colors.black,
                        widget.obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                            
                      ),
                      onPressed: widget.onToggle,
                    )
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.borderColor
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
