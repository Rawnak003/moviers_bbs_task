import 'package:bbs_task/src/core/constant/colors.dart';
import 'package:bbs_task/src/feature/data/providers/user/parent_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constant/assets_path.dart';
import '../../../../../core/constant/strings.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ParentScreenProvider>(
      builder: (_, provider, __) {
        return SafeArea(
          top: false,
          child: Scaffold(
            body: provider.screens[provider.selectedIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.blackColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGreyColor,
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: Colors.transparent,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states,) {
                    if (states.contains(WidgetState.selected)) {
                      return TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold,);
                    }
                    return TextStyle(color: AppColors.lightGreyColor);
                  }),
                ),
                child: NavigationBar(
                  elevation: 8,
                  selectedIndex: provider.selectedIndex,
                  onDestinationSelected: provider.changeIndex,
                  backgroundColor: AppColors.blackColor,
                  destinations: [
                    _buildNavDestination(iconPath: AssetsPath.homeIconSVG, selectedIconPath: AssetsPath.homeFilledIconSVG, label: AppStrings.home, index: 0, selectedIndex: provider.selectedIndex,),
                    _buildNavDestination(iconPath: AssetsPath.watchListIconSVG, selectedIconPath: AssetsPath.watchListFilledIconSVG, label: AppStrings.watchList, index: 1, selectedIndex: provider.selectedIndex,),
                    _buildNavDestination(iconPath: AssetsPath.searchIconSVG, label: AppStrings.search, index: 2, selectedIndex: provider.selectedIndex,),
                    NavigationDestination(icon: Image.asset(AssetsPath.accountIconPNG, height: 24, width: 24,), label: AppStrings.accounts,),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  NavigationDestination _buildNavDestination({
    required String iconPath,
    required String label,
    required int index,
    required int selectedIndex,
    String? selectedIconPath,
  }) {
    final isSelected = selectedIndex == index;
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primaryColor : AppColors.lightGreyColor,
          BlendMode.srcIn,
        ),
      ),
      selectedIcon: SvgPicture.asset(
        selectedIconPath ?? iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primaryColor : AppColors.lightGreyColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
