import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> initializeApp(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, RoutesName.onBoard);
  }
}
