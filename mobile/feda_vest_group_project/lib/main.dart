import 'package:feda_vest_group_project/cubits/auth_cubits.dart';
import 'package:feda_vest_group_project/repos/auth_repo.dart';
import 'package:feda_vest_group_project/routes/app_route.dart';
import 'package:feda_vest_group_project/routes/route.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
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

