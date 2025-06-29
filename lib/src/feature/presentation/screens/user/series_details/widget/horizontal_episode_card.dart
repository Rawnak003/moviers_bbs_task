import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/assets_path.dart';

class HorizontalEpisodeCard extends StatelessWidget {
  const HorizontalEpisodeCard({super.key,
    required this.episode,
    required this.screenWidth,
    required this.textTheme,
  });

  final dynamic episode;
  final double screenWidth;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  episode.imagePath,
                  width: screenWidth * 0.75,
                  fit: BoxFit.cover,
                ),
              ),
              SvgPicture.asset(AssetsPath.playButtonIconSVG),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            episode.title,
            style: textTheme.bodyLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
