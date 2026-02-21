import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/global_widgets/app_text_field.dart';
import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/role_card.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isFoodSelected = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AuthHeader(
            isSigninScreen: true,
            heading: "FedaVest",
            subheading: "Invest in food Security",
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Welcome Back",
                  color: AppColors.appTextColor,
                  textSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: "Log in to continue",
                  color: AppColors.appTextColor,
                  textSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: size.width * 0.03),
                AppTextField(
                  icon: Icons.email_outlined,

                  label: "Email",
                  hint: "Enter your email",
                ),
                AppTextField(
                  label: "Password",
                  hint: "Min. 6 characters",
                  hasImage: true,
                  image: Image.asset(AuthImages.lock),
                  isPassword: true,
                  obscureText: obscurePassword,
                  onToggle: () {
                    setState(() => obscurePassword = !obscurePassword);
                  },
                ),
                SizedBox(height: size.width * 0.04),
                AppButton(
                  text: "Log In",
                  onTap: () {
                    Navigator.pushNamed(context, '/bottomNav');
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(text: "Don’t Have an accoun? ", color: Colors.grey),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signUp');
                      },
                      child: AppText(
                        text: " Sign Up",

                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
