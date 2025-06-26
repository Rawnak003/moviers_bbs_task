import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'feature/data/providers/auth/login_provider.dart';
import 'feature/data/providers/auth/otp_verification_provider.dart';
import 'feature/data/providers/auth/register_provider.dart';
import 'feature/data/providers/splash/on_boarding_provider.dart';
import 'feature/data/providers/splash/splash_provider.dart';
import 'feature/data/providers/user/genre_provider.dart';

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
        ChangeNotifierProvider(create: (_) => GenreProvider()),
      ],
      child: const Moviers(),
    ),
  );
}
