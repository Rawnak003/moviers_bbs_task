import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/app_spacing.dart';
import '../../../core/constant/assets_path.dart';
import '../../../core/constant/colors.dart';

class CustomWatchButton extends StatelessWidget {
  const CustomWatchButton({
    super.key, required this.buttonTitle, this.onTapWatchButton, this.onTapBookmarkButton,
  });

  final String buttonTitle;
  final VoidCallback? onTapWatchButton;
  final VoidCallback? onTapBookmarkButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: onTapWatchButton,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(AssetsPath.playIconSVG),
                const SizedBox(width: 8),
                Text(buttonTitle),
              ]),
            ),
          ),
          const SizedBox(width: AppSpacing.verticalPadding),
          ElevatedButton(
            onPressed: onTapBookmarkButton,
            child: SvgPicture.asset(AssetsPath.watchListIconSVG, colorFilter: ColorFilter.mode(AppColors.lighterGreyColor, BlendMode.srcIn),),),
        ],
      ),
    );
  }
}