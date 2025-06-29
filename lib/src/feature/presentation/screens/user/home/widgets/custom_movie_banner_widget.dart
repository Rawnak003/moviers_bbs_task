import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constant/assets_path.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/strings.dart';
import '../../../../../data/static_data/user/movie_data.dart';
import 'custom_movie_info_tab.dart';

class CustomMovieBannerWidget extends StatelessWidget {
  const CustomMovieBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              child: Image.asset(
                movieList[0].imagePath,
                height: AppSpacing.screenHeight(context) * 0.48,
                width: double.infinity,
                fit: BoxFit.cover
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: AppSpacing.screenHeight(context) * 0.25,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.transparentColor,
                      AppColors.blackColor,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieList[0].movieName,
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          color: AppColors.blackColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontalPadding,),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.verticalPadding * 0.5),
                CustomMovieInfoTab(index: 0, showGenre: true,),
                const SizedBox(height: AppSpacing.verticalPadding * 2),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          SvgPicture.asset(AssetsPath.playIconSVG),
                          const SizedBox(width: 8),
                          Text(AppStrings.watchMovie),
                        ]),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.verticalPadding),
                    ElevatedButton(
                      onPressed: () {},
                      child: SvgPicture.asset(AssetsPath.watchListIconSVG, colorFilter: ColorFilter.mode(AppColors.lighterGreyColor, BlendMode.srcIn),),),
                  ],
                ),
                const SizedBox(height: AppSpacing.verticalPadding * 2),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
