import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';

class CustomParentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomParentAppBar({super.key, required this.child, required this.action});

  final Widget child;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: action,
        child: Icon(Icons.arrow_back, color: AppColors.whiteColor),
      ),
      title: child,
      actions: [
        TextButton(
          onPressed: () {},
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
