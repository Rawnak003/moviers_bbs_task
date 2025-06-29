import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/assets_path.dart';

class VerticalEpisodeCard extends StatelessWidget {
  const VerticalEpisodeCard({super.key,
    required this.episode,
    required this.screenHeight,
    required this.textTheme,
  });

  final dynamic episode;
  final double screenHeight;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                episode.imagePath,
                height: screenHeight * 0.1,
                fit: BoxFit.cover,
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              episode.title,
              style: textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
