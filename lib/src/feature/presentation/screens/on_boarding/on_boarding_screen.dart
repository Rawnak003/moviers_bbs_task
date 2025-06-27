import 'package:bbs_task/src/core/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_spacing.dart';
import '../../../../core/constant/assets_path.dart';
import '../../../../core/constant/colors.dart';
import '../../../data/providers/splash/on_boarding_provider.dart';
import '../../../data/static_data/on_boarding/item_data.dart';
import '../../common_widgets/custom_app_bar.dart';
import 'widgets/dot_indicator_widget.dart';
import 'widgets/on_boarding_item_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: SvgPicture.asset(AssetsPath.appLogoSVG, height: 28),
      ),
      body: Consumer<OnBoardingProvider>(
        builder: (_, provider, __) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: onBoardingItems.length,
                      controller: provider.pageController,
                      onPageChanged: provider.onPageChanged,
                      itemBuilder: (context, index) {
                        return OnBoardingItemWidget(
                          image: onBoardingItems[index].image,
                          title: onBoardingItems[index].title,
                          subtitle: onBoardingItems[index].subtitle,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(onBoardingItems.length, (index) => DotIndicatorWidget(isActive: index == provider.pageIndex,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  provider.isLastPage
                      ? _buildBottomBar(context)
                      : SizedBox(height: AppSpacing.screenHeight(context) * 0.12),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: AppSpacing.screenHeight(context) * 0.12,
      width: AppSpacing.screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(AppStrings.getStarted),
            ),
          ),
          const SizedBox(width: AppSpacing.horizontalPadding),
          Expanded(
            child: ElevatedButton(
              onPressed: () => Provider.of<OnBoardingProvider>(context, listen: false,).onTapLogin(context),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor,),
              child: Text(AppStrings.login),
            ),
          ),
        ],
      ),
    );
  }
}
