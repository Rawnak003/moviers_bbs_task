import 'package:bbs_task/src/core/constant/colors.dart';
import 'package:bbs_task/src/core/constant/strings.dart';
import 'package:flutter/material.dart';

import '../../../app/app_spacing.dart';
import '../../data/static_data/user/movie_data.dart';

class CustomMovieBottomSheet extends StatelessWidget {
  const CustomMovieBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: AppSpacing.screenHeight(context) * 0.7,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Text(movieList[0].movieName, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text(AppStrings.movieDetails, style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor),)
        ],
      ),
    );
  }
}
