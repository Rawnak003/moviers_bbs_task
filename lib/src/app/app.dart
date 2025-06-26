import 'package:bbs_task/src/core/constant/strings.dart';
import 'package:flutter/material.dart';

import '../core/routes/route_configs.dart';
import '../core/routes/route_names.dart';
import 'app_theme.dart';

class Moviers extends StatefulWidget {
  const Moviers({super.key});

  @override
  State<Moviers> createState() => _MoviersState();
}

class _MoviersState extends State<Moviers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: RoutesName.splash,
      onGenerateRoute: RouteConfigs.generateRoute,
    );
  }
}


