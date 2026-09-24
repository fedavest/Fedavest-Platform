import 'package:feda_vest_group_project/cubits/auth_cubits.dart';
import 'package:feda_vest_group_project/repos/auth_repo.dart';
import 'package:feda_vest_group_project/repos/mock_auth_repo.dart';
import 'package:feda_vest_group_project/routes/app_route.dart';
import 'package:feda_vest_group_project/routes/route.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
 

final bool useMock = kDebugMode;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
            useMock ? MockAuthRepo() : AuthRepo(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.investorInterest,
      navigatorKey: AppRoute.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      builder: (context, child) {
        final width = MediaQuery.sizeOf(context).width;
        if (width <= 600 || child == null) return child;
        return ColoredBox(
          color: const Color(0xffF5F6F7),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: child,
            ),
          ),
        );
      },
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xffF5F6F7),
      ),
      //   routes: {
      //     '/signUp':(context) => SignupScreen(),
      //     '/signIn':(context) => SignInScreen(),
      //     '/profileSetUp': (context)=> SetProfileScreen(),
      //     '/bottomNav':(context)=> BottomNav(),
      //     '/onBoard1':(context)=> OnboardingScreen(),
      //     '/verificationCenter':(context)=> VerificationCenterScreen(),
      //     '/verification':(context)=> VerificationFormScreen(),
       //  '/Readiness':(context)=> InvestmentReadinessScreen(),
      //    '/notification':(context)=> NotificationScreen()
      //   }
    );
  }
}

