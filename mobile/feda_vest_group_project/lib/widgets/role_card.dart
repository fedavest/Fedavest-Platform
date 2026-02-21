import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleCard extends StatefulWidget {
  const RoleCard({super.key, required this.title, required this.subtitle, required this.icon, required this.selected, required this.onTap,  this.image,  this.hasImage = false});
    final String title;
    final String subtitle;
    final IconData icon;
     final bool hasImage;
    final bool selected;
    final Image? image;
    final VoidCallback onTap;
  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.selected ? const Color(0xFFE8F5E9) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.selected ? AppColors.primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
           
              backgroundColor:
                  widget.selected ? AppColors.primaryColor: Colors.grey.shade200,
              child: widget.hasImage?
                widget.selected ? Image(image: AssetImage(AuthImages.foodSmeLogoActive)) :Image(image: AssetImage(AuthImages.foodSmeLogoInactive))
              : Icon(
                widget.icon,
                color: widget.selected ? Colors.white : AppColors.primaryColor,
              ),
            ),
                SizedBox(height: size.width* 0.01),
            Text(
              widget.title,
              style:   GoogleFonts.poppins(fontWeight: FontWeight.w600, color:  AppColors.foodSmeFontColor, fontSize: 18),
            ),
         SizedBox(height: size.width* 0.001),
            Text(
              widget.subtitle,
              style:   GoogleFonts.inter(
                fontSize: 14,
                color:Color(0xff121212),
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ),
    );
  }
}