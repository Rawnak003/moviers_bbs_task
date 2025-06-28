import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../data/static_data/user/content_data.dart';

class CustomContentCard extends StatelessWidget {
  const CustomContentCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.baseColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(contentData[index].imagePath),
      ),
      title: Text(contentData[index].title, style: textTheme.bodyLarge,),
      subtitle: Text(contentData[index].description, style: textTheme.bodyMedium?.copyWith(color: AppColors.greyColor),),
    );
  }
}