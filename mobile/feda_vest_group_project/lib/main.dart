import 'package:feda_vest_group_project/global_widgets/bottom_nav.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/dashoard/verification.dart';
import 'package:feda_vest_group_project/widgets/verifcation/verificationcenter.dart';
import 'package:feda_vest_group_project/pages/auth/set_profile_screen.dart';
import 'package:feda_vest_group_project/pages/auth/signin.dart';
import 'package:feda_vest_group_project/pages/auth/signup.dart';
import 'package:feda_vest_group_project/pages/onboard/onboard_screen.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    //  showSemanticsDebugger: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
    //  initialRoute: '/onBoard1',
       initialRoute: '/verification',
      routes: {
        '/signUp':(context) => SignupScreen(),
        '/signIn':(context) => SignInScreen(),
        '/profileSetUp': (context)=> SetProfileScreen(),
        '/bottomNav':(context)=> BottomNav(),
        '/onBoard1':(context)=> OnboardingScreen(),
        '/verificationCenter':(context)=> VerificationCenterScreen(),
        '/verification':(context)=> VerificationFormScreen()
       
      }
    );
  }
}

