import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/global_widgets/app_text_field.dart';
import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isFoodSelected = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(showIcon: true),
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I am...",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: size.width * 0.04),
                  Row(
                    children: [
                      Expanded(
                        child: RoleCard(
                          hasImage: true,
                          // image: Image(image: AssetImage(AuthImages.foodSmeLogoInactive)),
                          title: "A Food SME",
                          subtitle: "Business / NGO",
                          icon: Icons.inventory_2_outlined,
                          selected: isFoodSelected,
                          onTap: () {
                            setState(() => isFoodSelected = true);
                          },
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Expanded(
                        child: RoleCard(
                          title: "An Investor",
                          subtitle: "Fund projects",
                          icon: Icons.trending_up,
                          selected: !isFoodSelected,
                          onTap: () {
                            setState(() => isFoodSelected = false);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.06),
                  AppTextField(
                    hasImage: true,
                    image: Image.asset(AuthImages.personIcon),
                    label: "Name",
                    hint: "Enter your Name",
                    // icon: Icons.person_outline,
                  ),
                  AppTextField(
                    label: "Email",
                    hint: "Enter your email",
                    icon: Icons.email_outlined,
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
                  AppTextField(
                    label: "Confirm Password",
                    hint: "Min. 6 characters",
                    hasImage: true,
                    image: Image.asset(AuthImages.lock),
                    isPassword: true,
                    obscureText: obscureConfirmPassword,
                    onToggle: () {
                      setState(
                        () => obscureConfirmPassword = !obscureConfirmPassword,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: AppButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/profileSetUp');
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Already have an account? ",
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                        Navigator.pushNamed(context, '/signIn');
                      },
                        child: AppText(
                          text: "Log in",
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
      ),
    );
  }
}
