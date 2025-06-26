
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/assets_path.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';
import '../../data/providers/splash/on_boarding_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingProvider>(context, listen: false);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: SvgPicture.asset(
        AssetsPath.appLogoSVG,
        height: 28,
      ),
      actions: [
        TextButton(
          onPressed: provider.skipToLastPage,
          child: const Text(
            AppStrings.skip,
            style: TextStyle(color: AppColors.greyColor),
          ),
        ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}