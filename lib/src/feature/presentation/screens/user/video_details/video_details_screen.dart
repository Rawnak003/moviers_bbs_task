import 'package:bbs_task/src/app/app_spacing.dart';
import 'package:bbs_task/src/core/constant/assets_path.dart';
import 'package:bbs_task/src/feature/presentation/common_widgets/custom_section_background.dart';
import 'package:bbs_task/src/feature/presentation/common_widgets/custom_subscription_bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';
import '../../../common_widgets/custom_movie_banner_widget.dart';
import '../../../common_widgets/custom_movie_bottom_sheet.dart';
import '../../../common_widgets/custom_watch_button.dart';

class VideoDetailsScreen extends StatelessWidget {
  const VideoDetailsScreen({super.key});

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
                  CustomMovieBannerWidget(index: 0,),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.arrow_back, color: AppColors.whiteColor, size: 28,),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: RichText(
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(text: "${AppStrings.movieDetails.substring(0,175)}...", style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor),),
                      TextSpan(
                        text: AppStrings.more,
                        style: textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold,),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) {
                            return const CustomMovieBottomSheet();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CustomSectionBackground(
                title: AppStrings.trailers,
                action: (){},
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.horizontalPadding),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(AssetsPath.movieTrailerPNG,width: double.infinity,fit: BoxFit.fitWidth,),
                      SvgPicture.asset(AssetsPath.playButtonIconSVG,)
                    ],
                  ),
                ),
              ),
              CustomWatchButton(
                buttonTitle: AppStrings.watchMovie,
                onTapWatchButton: () {
                  showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) {
                    return const CustomSubscriptionBottomSheet();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
