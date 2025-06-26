import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';
import '../../data/providers/splash/on_boarding_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingProvider>(context, listen: false);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: child,
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