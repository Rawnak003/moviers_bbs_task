import 'package:bbs_task/src/feature/data/providers/user/movie_provider.dart';
import 'package:bbs_task/src/feature/data/providers/user/subscription_provider.dart';
import 'package:bbs_task/src/feature/data/providers/user/trailer_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'feature/data/providers/auth/login_provider.dart';
import 'feature/data/providers/auth/otp_verification_provider.dart';
import 'feature/data/providers/auth/register_provider.dart';
import 'feature/data/providers/auth/text_field_focus_provider.dart';
import 'feature/data/providers/splash/on_boarding_provider.dart';
import 'feature/data/providers/splash/splash_provider.dart';
import 'feature/data/providers/user/genre_provider.dart';
import 'feature/data/providers/user/parent_screen_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => OtpVerificationProvider()),
        ChangeNotifierProvider(create: (_) => TextFieldFocusProvider()),
        ChangeNotifierProvider(create: (_) => GenreProvider()),
        ChangeNotifierProvider(create: (_) => ParentScreenProvider()),
        ChangeNotifierProvider(create: (_) => TrailerPlayerProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: const Moviers(),
    ),
  );
}
