import 'package:flutter/material.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constant/colors.dart';

class SubscriptionOption extends StatelessWidget {
  final String title;
  final String price;
  final String details;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionOption({
    super.key,
    required this.title,
    required this.price,
    required this.details,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSpacing.screenHeight(context) * 0.16,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
              height: AppSpacing.screenHeight(context) * 0.12,
              decoration: const BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: textTheme.titleLarge?.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    details,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
