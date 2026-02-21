import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatefulWidget {
  const AuthHeader({
    super.key,
    this.heading,
    this.subheading,
    this.isSignupScreen = false,
        this.isDashboard = false,
    this.isSigninScreen = false,
    this.color,
    this.textcolor,
    this.avatarText,
    this.showIcon = false,
    this.isprofile = false,
  });
  final String? heading;
  final String? subheading;
  final Color? color;
  final Color? textcolor;
  final String? avatarText;
  final bool isSignupScreen;
  final bool isSigninScreen;
    final bool isDashboard;
  final bool showIcon;
  final bool isprofile;

  @override
  State<AuthHeader> createState() => _AuthHeaderState();
}

class _AuthHeaderState extends State<AuthHeader> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        size.width * 0.05,
        size.width * 0.05,
        size.width * 0.05,
        size.width * 0.10,
      ),

      decoration: const BoxDecoration(
        color: Color(0xFF103813),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: widget.isSignupScreen
                ? SizedBox.shrink()
                : widget.showIcon
                ? Icon(Icons.arrow_back, color: Colors.white)
                : SizedBox.shrink(),
          ),
          SizedBox(height: 20),
          widget.isSigninScreen
              ? Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: widget.color ?? Color(0xff144718),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AppText(
                            text: widget.avatarText ?? "FD",
                            textSize: 32,
                            color: widget.textcolor ?? Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    AppText(
                      text: widget.heading ?? "FedaVest",
                      textSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ],
                )

              : 
              Text(
                  widget.heading ?? "Create Account",

                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: widget.isSignupScreen
                        ? FontWeight.w500
                        : FontWeight.bold,
                    fontSize: widget.isSignupScreen ? 14 : 24,
                  ),
                ),
          SizedBox(height: 6),
          widget.isprofile
              ? Center(
                child: Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical:  size.width * 0.004,),
                //  height: 100,
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                    ),
                    
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage(AuthImages.profileHeaderImage)),
                        AppText(
                          text: "Food SME",
                          textSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
              )
              : widget.isSigninScreen
              ? Center(
                  child: Text(
                    widget.subheading ?? "Join the food security revolution",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: widget.isSignupScreen
                          ? FontWeight.bold
                          : FontWeight.w400,
                      fontSize: widget.isSignupScreen ? 24 : 16,
                    ),
                  ),
                )
                
              : widget.isDashboard ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      widget.subheading ?? "Join the food security revolution",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: widget.isSignupScreen
                            ? FontWeight.bold
                            : FontWeight.w400,
                        fontSize: widget.isSignupScreen ? 24 : 16,
                      ),
                    ),
                    Icon(Icons.notifications_outlined, color: Colors.white,)
                ],
              ):               Text(
                  widget.subheading ?? "Join the food security revolution",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: widget.isSignupScreen
                        ? FontWeight.bold
                        : FontWeight.w400,
                    fontSize: widget.isSignupScreen ? 24 : 16,
                  ),
                ),
        ],
      ),
    );
  }
}
