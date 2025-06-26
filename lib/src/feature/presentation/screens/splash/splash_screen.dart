import 'package:bbs_task/src/core/constant/assets_path.dart';
import 'package:bbs_task/src/core/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/splash/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false).initializeApp(context);
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsPath.splashBackgroundPNG,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(child: SvgPicture.asset(AssetsPath.appLogoSVG, fit: BoxFit.cover,)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Text(AppStrings.appVersion, style: Theme.of(context).textTheme.bodySmall,),
            ),
          ),
        ],
      ),
    );
  }
}
