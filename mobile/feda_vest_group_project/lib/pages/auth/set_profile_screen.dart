import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';

import 'package:feda_vest_group_project/widgets/auth_header.dart';

import 'package:flutter/material.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AuthHeader(
            isSignupScreen: true,
            heading: "Welcome Back,",
            subheading: "Aisha",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.13,
              vertical: size.width * 0.13,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: AppColors.setProfileContainerColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                spacing: 15.0,
                children: [
                  Image(image: AssetImage(AuthImages.setProfileIcon)),

                  AppText(
                    text: "Set up your Profile",
                    textSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    textAlign: TextAlign.center,
                    text: "Complete verification to start Receiving funding",
                    maxline: 2,
                    textSize: 16,
                    color: Color(0XFF525252),
                  ),

                  SizedBox(
                    width: 200,
                    height: 50,
                    child: AppButton(
                      showIcon: true,
                      text: "rted",
                      onTap: () {
                        Navigator.pushNamed(context, '/signIn');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
