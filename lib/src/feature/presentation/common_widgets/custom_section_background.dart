import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';
import '../../data/providers/user/parent_screen_provider.dart';

class CustomSectionBackground extends StatelessWidget {
  const CustomSectionBackground({
    super.key,
    required this.child,
    required this.title,
    this.hasButton = false,
  });

  final Widget child;
  final String title;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.baseColor, AppColors.blackColor],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                Text(title, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,),),
                Spacer(),
                if (hasButton)
                  Consumer<ParentScreenProvider>(
                    builder: (_, provider, __) {
                      return TextButton(
                        onPressed: () => context.read<ParentScreenProvider>().openTopCharts(),
                        child: Text(
                          AppStrings.viewAll,
                          style: textTheme.bodyMedium?.copyWith(color: AppColors.lighterGreyColor,),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
