import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/strings.dart';
import '../../../../../data/providers/user/parent_screen_provider.dart';

class CustomTopChartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTopChartAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ParentScreenProvider>();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => provider.closeTopCharts(),
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
