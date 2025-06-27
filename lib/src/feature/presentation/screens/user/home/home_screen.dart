import 'package:bbs_task/src/feature/data/static_data/user/popular_star_data.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';
import 'widgets/custom_movie_banner_widget.dart';
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
            CustomMovieBannerWidget(),
            _buildSectionContainer(context: context, child: Column(
              children: [
                _buildSectionHeader(context: context, title: AppStrings.topCharts, hasButton: true,),
                SizedBox(
                  height: AppSpacing.screenHeight(context) * 0.27,
                  child: ListView.separated(
                    padding: EdgeInsets.only(left: AppSpacing.horizontalPadding),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {return CustomMovieCard(index: index);},
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                  ),
                ),
              ],
            ),),
            _buildSectionContainer(context: context, child: Column(
              children: [
                _buildSectionHeader(context: context, title: AppStrings.weeklyHighlights,),

              ],
            ),),
            _buildSectionHeader(context: context, title: AppStrings.popularStar,),
            SizedBox(
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
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required BuildContext context, required String title, bool hasButton = false,}) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          Text(title, style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
          Spacer(),
          if (hasButton)
            TextButton(
              onPressed: () {},
              child: Text(AppStrings.viewAll, style: textTheme.bodyMedium?.copyWith(color: AppColors.lighterGreyColor,),),
            ),
        ],
      ),
    );
  }
  Widget _buildSectionContainer({required BuildContext context, required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.baseColor, AppColors.blackColor,],
        ),
      ),
      child: child,
    );
  }
}
