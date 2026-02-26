
import 'package:feda_vest_group_project/global_widgets/bottom_nav.dart';
import 'package:feda_vest_group_project/pages/auth/signin.dart';
import 'package:feda_vest_group_project/pages/auth/signup.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/profile_screen.dart';
import 'package:feda_vest_group_project/pages/onboard/onboard_screen.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
        case RouteName.onboard:
        return MaterialPageRoute(builder: (_) => OnboardingScreen() );
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => SignupScreen() );
      case RouteName.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteName.bottomNav:
        return MaterialPageRoute(builder: (_) => BottomNav());
     

      case RouteName.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      // Add other routes here as needed
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
