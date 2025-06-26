import 'package:bbs_task/src/feature/presentation/screens/user/personalization/widgets/custom_genre_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/strings.dart';
import '../../../../data/providers/user/genre_provider.dart';
import '../../../../data/static_data/user/genre_data.dart';
import '../../../common_widgets/custom_app_bar.dart';

class PersonalizationScreen extends StatelessWidget {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<GenreProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: CustomAppBar(child: Text(AppStrings.personalization)),
          body: Padding(
            padding: const EdgeInsets.all(AppSpacing.horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.chooseYourGenre, style: textTheme.bodyLarge?.copyWith(color: AppColors.greyColor)),
                    Text("${provider.selectedCount} from ${genreData.length}", style: textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: genreData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: AppSpacing.verticalPadding,
                      mainAxisSpacing: AppSpacing.horizontalPadding,
                    ),
                    itemBuilder: (context, index) {
                      final genre = genreData[index];
                      return GestureDetector(
                        onTap: () => provider.toggleSelection(index),
                        child: Stack(
                          children: [
                            CustomGenreCardWidget(genre: genre),
                            if (genre.isSelected)
                              Positioned(
                                top: 16,
                                right: 16,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSpacing.horizontalPadding),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => provider.onTapContinue(context),
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                    child: Text(AppStrings.continueTo, style: textTheme.bodyLarge?.copyWith(color: AppColors.whiteColor),),
                  ),
                ),
                const SizedBox(height: AppSpacing.horizontalPadding),
              ],
            ),
          ),
        );
      },
    );
  }
}