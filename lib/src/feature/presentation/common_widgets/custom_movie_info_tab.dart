import 'package:flutter/material.dart';

import '../../../app/app_spacing.dart';
import '../../../core/constant/colors.dart';
import '../../data/static_data/user/movie_data.dart';

class CustomMovieInfoTab extends StatelessWidget {
  const CustomMovieInfoTab({
    super.key,
    required this.index,
    this.showGenre = false,
    this.isSeries = false,
  });

  final int index;
  final bool showGenre;
  final bool isSeries;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Wrap(
          children: [
            Icon(Icons.star, color: AppColors.yellowColor, size: 18),
            const SizedBox(width: 4),
            Text('${movieList[index].rating}', style: textTheme.bodyMedium?.copyWith(color: AppColors.yellowColor,),),
          ],
        ),
        SizedBox(width: AppSpacing.screenWidth(context) * 0.05),
        _buildMovieInfo(context, movieList[index].releaseYear.toString()),
        SizedBox(width: AppSpacing.screenWidth(context) * 0.05),
        isSeries
            ? Row(
              children: [
                _buildMovieInfo(context, "${movieList[index].seasonCount.toString()} season",),
                SizedBox(width: AppSpacing.screenWidth(context) * 0.05),
                _buildMovieInfo(context,
                  "${movieList[index].episodeCount.toString()} episodes",),
              ],
            )
            : _buildMovieInfo(context, movieList[index].duration,),
        if (showGenre) ...[
          SizedBox(width: AppSpacing.screenWidth(context) * 0.05),
          _buildMovieInfo(context, movieList[index].movieGenre),
        ],
      ],
    );
  }

  Text _buildMovieInfo(context, String info) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      info,
      style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor),
    );
  }
}
