import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/global_widgets/bottom_nav.dart';
import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/build_menu_item.dart';
import 'package:feda_vest_group_project/widgets/funding_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFoodSelected = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        AuthHeader(
          color: Color(0xffB8CDBA),
          isSigninScreen: true,
          heading: "Aisha Isi",
          avatarText: "AI",
          textcolor: Colors.black,
          isprofile: true,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'SME Tools',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 16),

              BuildMenuItem(
                icon: Icons.verified_outlined,
                image: Image(image: AssetImage(AuthImages.smeToolsIcon1)),
                title: 'Business Verification',

                subtitle: 'Verify your business and get verified',
                onTap: () {},
              ),

              const SizedBox(height: 12),

              // Funding Profile
              BuildMenuItem(
                image: Image(image: AssetImage(AuthImages.smeToolsIcon2)),
                title: 'Funding Profile',
                subtitle: 'Get your funding, your way and access to loan',
            onTap: () async {
  final result = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return const FundingProfileDialog();
    },
  );
  
  if (result != null) {
    // Handle the saved data
    print('Funding Goal: ${result['fundingGoal']}');
    print('Category: ${result['category']}');
    print('Milestones: ${result['milestones']}');
  }
},
              ),

              const SizedBox(height: 12),

              // AI Scoring
              BuildMenuItem(
                image: Image(image: AssetImage(AuthImages.smeToolsIcon3)),
                title: 'AI Scoring',

                subtitle: 'Get your AI scoring to boost funding chances',
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // Account Section
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 16),

              // Sign Out
              BuildMenuItem(
                image: Image(image: AssetImage(AuthImages.smeToolsIcon4)),
                title: 'Sign Out',
                subtitle: '',
                titleColor: Color(0xFFFF0000),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
