import 'package:bbs_task/src/core/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_spacing.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: AppSpacing.screenHeight(context) * 0.22,
          width: AppSpacing.screenWidth(context) * 0.8,
          fit: BoxFit.cover,
        ),
        SizedBox(height: AppSpacing.screenHeight(context) * 0.1),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: AppSpacing.horizontalPadding),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.greyColor),
        ),
        Spacer(),
      ],
    );
  }
}