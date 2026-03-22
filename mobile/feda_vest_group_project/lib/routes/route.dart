import 'package:feda_vest_group_project/global_widgets/bottom_nav.dart';
import 'package:feda_vest_group_project/pages/auth/signin.dart';
import 'package:feda_vest_group_project/pages/auth/signup.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/dashoard/verification.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/profile_screen.dart';
import 'package:feda_vest_group_project/pages/onboard/onboard_screen.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/edit_funding_goal.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/funding_goal.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/funding/fundingdetails.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/readiness/run_analysis.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/sme_readiness.dart';
//import 'package:feda_vest_group_project/widgets/dashboard_widgets/verification_card.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/verifcation/verificationcenter.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.fundingDeets:
        return MaterialPageRoute(builder: (_) => FundingImpactScreen());
      case RouteName.fundingGoal:
        return MaterialPageRoute(builder: (_) => FundingGoalContent());
      case RouteName.readiness:
        return MaterialPageRoute(builder: (_) => InvestmentReadinessScreen());
      case RouteName.onboard:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case RouteName.viewCenter:
        return MaterialPageRoute(builder: (_) => VerificationCenterScreen());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case RouteName.verification:
        return MaterialPageRoute(builder: (_) => VerificationFormScreen());
      case RouteName.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteName.bottomNav:
        return MaterialPageRoute(builder: (_) => BottomNav());
      case RouteName.runAI:
        return MaterialPageRoute(builder: (_) => RunAnalysis());
      case RouteName.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
         case RouteName.editFundingGoal:
        return MaterialPageRoute(builder: (_) => EditFundingGoalScreen());

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
