import 'package:bbs_task/src/feature/presentation/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

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

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}