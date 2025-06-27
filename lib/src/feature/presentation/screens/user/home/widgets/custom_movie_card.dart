import 'package:flutter/material.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../data/static_data/user/movie_data.dart';
import 'custom_movie_info_tab.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacing.screenWidth(context) * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              movieList[index+1].imagePath,
              height: AppSpacing.screenHeight(context) * 0.20,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(movieList[index+1].movieName, style: Theme.of(context).textTheme.bodyLarge),
          CustomMovieInfoTab(index: index+1,),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}