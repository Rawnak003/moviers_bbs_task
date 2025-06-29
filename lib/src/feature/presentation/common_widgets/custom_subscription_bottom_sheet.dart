import 'package:bbs_task/src/feature/data/providers/user/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_spacing.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/strings.dart';
import '../../data/static_data/user/content_data.dart';
import '../screens/user/video_details/widgets/custom_content_card.dart';
import '../screens/user/video_details/widgets/subscription_option.dart';

class CustomSubscriptionBottomSheet extends StatelessWidget {
  const CustomSubscriptionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: AppSpacing.screenHeight(context) * 0.9,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(width: 40, height: 4,
              margin: const EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(color: AppColors.greyColor, borderRadius: BorderRadius.circular(4),),
            ),
          ),
          Text(AppStrings.subscription, style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: 16),
          Text(AppStrings.subscribeDetails, textAlign: TextAlign.center, style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor),),
          const SizedBox(height: 40),
          Consumer<SubscriptionProvider>(
            builder: (_, provider, __) {
              return Row(
                children: [
                  Expanded(
                    child: SubscriptionOption(title: AppStrings.annually, price: AppStrings.priceAnnually, details: AppStrings.billAnnually, isSelected: provider.isSubscribedAnnually, onTap: provider.toggleSubscriptionAnnually,),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SubscriptionOption(title: AppStrings.monthly, price: AppStrings.priceMonthly, details: AppStrings.billMonthly, isSelected: provider.isSubscribedMonthly, onTap: provider.toggleSubscriptionMonthly,),
                  ),
                ],
              );
            }
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              itemCount: contentData.length,
              itemBuilder: (context, index) {return CustomContentCard(index: index,);}
            ),
          ),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor), child: Text('Start Your 14-days trial'))),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

