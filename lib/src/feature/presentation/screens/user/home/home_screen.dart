import 'package:bbs_task/src/core/routes/route_names.dart';
import 'package:bbs_task/src/feature/presentation/common_widgets/custom_section_background.dart';
import 'package:bbs_task/src/feature/presentation/screens/on_boarding/widgets/dot_indicator_widget.dart';
import 'package:bbs_task/src/feature/presentation/screens/user/home/widgets/trailer_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../data/providers/user/parent_screen_provider.dart';
import '../../../../data/static_data/user/popular_star_data.dart';
import '../../../common_widgets/custom_watch_button.dart';
import '../../../common_widgets/custom_movie_banner_widget.dart';
import 'widgets/custom_movie_card.dart';
import 'widgets/custom_star_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RoutesName.videoDetails),
              child: CustomMovieBannerWidget(index: 0,),
            ),
            CustomWatchButton(buttonTitle: AppStrings.watchMovie, onTapWatchButton: () => Navigator.pushNamed(context, RoutesName.videoDetails), index: 0,),
            const SizedBox(height: AppSpacing.verticalPadding * 2),
            CustomSectionBackground(
              title: AppStrings.topCharts,
              hasButton: true,
              action: () => context.read<ParentScreenProvider>().openTopCharts(),
              child: SizedBox(
                height: AppSpacing.screenHeight(context) * 0.28,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: AppSpacing.horizontalPadding, top: AppSpacing.verticalPadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {return CustomMovieCard(index: index);},
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                ),
              ),
            ),
            CustomSectionBackground(title: AppStrings.weeklyHighlights, child: TrailerPlayerWidget(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(3, (index) => DotIndicatorWidget(isActive: index == 0,),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.verticalPadding * 2),
            CustomSectionBackground(
              title: AppStrings.popularStar,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: AppSpacing.screenHeight(context) * 0.2,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: AppSpacing.horizontalPadding),
                    scrollDirection: Axis.horizontal,
                    itemCount: popularStarData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {return CustomStarCard(index: index);},
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
