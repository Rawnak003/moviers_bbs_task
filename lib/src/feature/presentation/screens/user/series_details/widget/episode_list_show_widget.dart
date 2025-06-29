import 'package:flutter/material.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../data/static_data/user/episode_data.dart';
import 'horizontal_episode_card.dart';
import 'vertical_episode_card.dart';

class EpisodeListShowWidget extends StatelessWidget {
  const EpisodeListShowWidget({
    super.key,
    required this.index,
    required this.isVertical,
  });

  final int index;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = AppSpacing.screenHeight(context);
    final screenWidth = AppSpacing.screenWidth(context);

    return ListView.separated(
      scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
      itemCount: 9,
      padding: EdgeInsets.zero,
      itemBuilder: (context, ind) {
        final episode = episodeData[index + ind];

        return isVertical
            ? VerticalEpisodeCard(
          episode: episode,
          screenHeight: screenHeight,
          textTheme: textTheme,
        )
            : HorizontalEpisodeCard(
          episode: episode,
          screenWidth: screenWidth,
          textTheme: textTheme,
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16, width: 16),
    );
  }
}
