import 'package:flutter/material.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../data/static_data/user/popular_star_data.dart';

class CustomStarCard extends StatelessWidget {
  const CustomStarCard({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            popularStarData[index].imagePath,
            height: AppSpacing.screenHeight(context) * 0.14,
            width: AppSpacing.screenWidth(context) * 0.27,
            fit: BoxFit.cover,
          ),
        ),
        Text(popularStarData[index].starName, style: Theme.of(context).textTheme.bodyLarge,overflow: TextOverflow.ellipsis,maxLines: 1,),
      ],
    );
  }
}