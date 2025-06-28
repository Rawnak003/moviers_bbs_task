import 'package:flutter/material.dart';

import '../../../app/app_spacing.dart';
import '../../../core/constant/colors.dart';
import '../../data/static_data/user/movie_data.dart';
import '../screens/user/series_details/widget/episode_list_show_widget.dart';

class CustomEpisodeListBottomSheet extends StatelessWidget {
  const CustomEpisodeListBottomSheet({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: AppSpacing.screenHeight(context) * 0.9,
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
            child: Container(width: 40, height: 4,
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(color: AppColors.greyColor, borderRadius: BorderRadius.circular(4),),
            ),
          ),
          Text(movieList[8].movieName, style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: 16),
          Text(index < 1 ? 'Season 1' : 'Season 2', style: textTheme.bodyLarge),
          const SizedBox(height: 8),
          Expanded(child: EpisodeListShowWidget(index: index, isVertical: true,)),
        ],
      ),
    );
  }
}