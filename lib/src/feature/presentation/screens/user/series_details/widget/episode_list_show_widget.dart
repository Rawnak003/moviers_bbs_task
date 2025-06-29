import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constant/assets_path.dart';
import '../../../../../data/static_data/user/episode_data.dart';

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
    return ListView.separated(
      scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, ind) {
        return isVertical
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        episodeData[index + ind].imagePath,
                        height: AppSpacing.screenHeight(context) * 0.1,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SvgPicture.asset(
                      AssetsPath.playButtonIconSVG,
                      height: 35,
                      width: 35,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    episodeData[index + ind].title,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:16.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          episodeData[index + ind].imagePath,
                          width: AppSpacing.screenWidth(context) * 0.75,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SvgPicture.asset(
                        AssetsPath.playButtonIconSVG,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  episodeData[index + ind].title,
                  style: textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16,);
      },
    );
  }
}
