import 'package:bbs_task/src/feature/presentation/screens/auth/login_screen.dart';
import 'package:bbs_task/src/feature/presentation/screens/auth/register_screen.dart';
import 'package:bbs_task/src/feature/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:bbs_task/src/feature/presentation/screens/user/home/home_screen.dart';
import 'package:bbs_task/src/feature/presentation/screens/user/personalization/personalization_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/presentation/screens/auth/otp_verification_screen.dart';
import '../../feature/presentation/screens/splash/splash_screen.dart';
import 'route_names.dart';

class RouteConfigs {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.onBoard:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case RoutesName.otpVerification:
        return MaterialPageRoute(
          builder: (context) => const OtpVerificationScreen(),
        );
      case RoutesName.personalization:
        return MaterialPageRoute(
          builder: (context) => const PersonalizationScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}