import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.all(4),
      height: isActive ? 12 : 5,
      width: 5,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
