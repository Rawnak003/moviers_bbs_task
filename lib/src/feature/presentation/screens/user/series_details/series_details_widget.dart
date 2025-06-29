import 'package:bbs_task/src/app/app_spacing.dart';
import 'package:bbs_task/src/feature/presentation/common_widgets/custom_episode_list_bottom_sheet.dart';
import 'package:bbs_task/src/feature/presentation/common_widgets/custom_section_background.dart';
import 'package:bbs_task/src/feature/presentation/screens/user/series_details/widget/episode_list_show_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';
import '../../../common_widgets/custom_movie_banner_widget.dart';
import '../../../common_widgets/custom_watch_button.dart';

class SeriesDetailsScreen extends StatelessWidget {
  const SeriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomMovieBannerWidget(index: 8, isSeries: true),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(height: 40, width: 40,
                        decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(8),),
                        child: Icon(Icons.arrow_back, color: AppColors.whiteColor, size: 28,),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(AppStrings.seriesDetails, style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor,),),
              ),
              SizedBox(
                height: AppSpacing.screenHeight(context) * 0.33,
                child: PageView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _buildSeasonEpisodeList(context, index: index, title: 'Season ${index + 1}');
                  },
                ),
              ),
              CustomWatchButton(
                index: 8,
                buttonTitle: AppStrings.continueWatch,
                onTapWatchButton: () {
                  // TODO : implement watch video
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeasonEpisodeList(context, {required int index, required String title}) {
    final actualIndex = index == 1 ? 9 : 0;
    return Expanded(
      child: CustomSectionBackground(
        title: title,
        hasButton: true,
        action: () {
          showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) {return CustomEpisodeListBottomSheet(index: actualIndex);},);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontalPadding),
          child: SizedBox(height: AppSpacing.screenHeight(context) * 0.24,
            child: EpisodeListShowWidget(index: actualIndex, isVertical: false),
          ),
        ),
      ),
    );
  }
}
