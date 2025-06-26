import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constant/assets_path.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../data/models/user/genre_model.dart';

class CustomGenreCardWidget extends StatelessWidget {
  const CustomGenreCardWidget({
    super.key,
    required this.genre,
  });

  final GenreModel genre;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: genre.isSelected ? AppColors.primaryColor : AppColors.transparentColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                genre.imagePath,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.horizontalPadding * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(genre.name, style: textTheme.bodyLarge),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(AssetsPath.userIconSVG, height: 14, width: 14),
                    const SizedBox(width: 4),
                    Text("${genre.likeCount} like this", style: textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}