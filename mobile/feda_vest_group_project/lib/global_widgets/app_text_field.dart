import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/dismiss_keyboard.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
     this.icon,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggle,  this.hasImage =false, this.image, this.initValue, this.onChanged, this.controller, this.focusNode, this.errorText,
  });
  final String label;
  final String? hint,errorText, initValue;
  final IconData? icon;
     final bool hasImage;
  final Image? image;
    final Function? onChanged;
  final TextEditingController? controller;
 final bool isPassword;
  final FocusNode? focusNode;
 final bool obscureText;
 final VoidCallback? onToggle;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _internalFocusNode;
  bool _isFocused = false;
  TextEditingController? _internalController;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode;
  TextEditingController get _effectiveController =>
      widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = FocusNode();

    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.initValue ?? '');
    } else if (widget.initValue != null) {
      widget.controller!.text = widget.initValue!;
    }

    _effectiveFocusNode.addListener(() {
      setState(() {
        _isFocused = _effectiveFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _internalFocusNode.dispose();
    if (widget.controller == null) _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label),
          const SizedBox(height: 8),
          TextField(
               onTapOutside: (_) => dismissKeyboard(context),
      onChanged: (value) => widget.onChanged?.call(value),
            obscureText: widget.obscureText,
            controller: _effectiveController,
            focusNode: _effectiveFocusNode,
            decoration: InputDecoration(
                errorText: widget.errorText,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 10,
        ),
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
                    focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(
                  color: AppColors.borderColor
                ),
          borderRadius: BorderRadius.circular(12),
        ),
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
