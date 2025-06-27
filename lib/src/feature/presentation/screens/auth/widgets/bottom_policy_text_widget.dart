import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';

class BottomPolicyTextWidget extends StatelessWidget {
  const BottomPolicyTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(text: AppStrings.createAccountMessage, style: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor)),
            TextSpan(
              text: AppStrings.privacyPolicy,
              style: textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w400,),
            ),
            TextSpan(text: AppStrings.and, style: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor)),
            TextSpan(
              text: AppStrings.termsOfUse,
              style: textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w400,),
            ),
          ],
        ),
      ),
    );
  }
}