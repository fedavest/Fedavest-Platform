import 'package:feda_vest_group_project/cubits/auth_cubits.dart';
import 'package:feda_vest_group_project/global_widgets/bottom_nav.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/dashoard/verification.dart';
import 'package:feda_vest_group_project/repos/auth_repo.dart';
import 'package:feda_vest_group_project/routes/app_route.dart';
import 'package:feda_vest_group_project/routes/route.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/notification.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/sme_readiness.dart';
import 'package:feda_vest_group_project/widgets/verifcation/verificationcenter.dart';
import 'package:feda_vest_group_project/pages/auth/set_profile_screen.dart';
import 'package:feda_vest_group_project/pages/auth/signin.dart';
import 'package:feda_vest_group_project/pages/auth/signup.dart';
import 'package:feda_vest_group_project/pages/onboard/onboard_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers:[
      BlocProvider(create: (_) => AuthCubit(AuthRepo())),
     ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.onboard,
      navigatorKey: AppRoute.navigatorKey,
      onGenerateRoute: Routes.generateRoute,

      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

      //   routes: {
      //     '/signUp':(context) => SignupScreen(),
      //     '/signIn':(context) => SignInScreen(),
      //     '/profileSetUp': (context)=> SetProfileScreen(),
      //     '/bottomNav':(context)=> BottomNav(),
      //     '/onBoard1':(context)=> OnboardingScreen(),
      //     '/verificationCenter':(context)=> VerificationCenterScreen(),
      //     '/verification':(context)=> VerificationFormScreen(),
      //    '/Readiness':(context)=> InvestmentReadinessScreen(),
      //    '/notification':(context)=> NotificationScreen()
      //   }
    );
  }
}

