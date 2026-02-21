import 'package:flutter/material.dart';

class BuildMenuItem extends StatefulWidget {
  const BuildMenuItem({super.key,  this.icon, required this.title, required this.subtitle, required this.onTap, this.iconColor, this.titleColor, required this.image});
    final IconData? icon;
    final Image image;
    final String title;
    final String subtitle;
    final VoidCallback onTap;
   final Color? iconColor;
   final Color? titleColor;
  @override
  State<BuildMenuItem> createState() => _BuildMenuItemState();
}

class _BuildMenuItemState extends State<BuildMenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: widget.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),

   child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
               // color: widget.iconColor != null
                 //   ? widget.iconColor.withAlpha(255)
                   // : const Color(0xFFe3f2fd),
                borderRadius: BorderRadius.circular(12),
              ),
              child: widget.image
             
              
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: widget.titleColor ?? const Color(0xFF101010),
                    ),
                  ),
                  if (widget.subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF525252),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF9ca3af),
            ),
          ],
        ),
      ),
    );
  }
}