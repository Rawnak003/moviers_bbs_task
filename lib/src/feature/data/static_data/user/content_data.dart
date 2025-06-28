import 'package:bbs_task/src/core/constant/strings.dart';

import '../../../../core/constant/assets_path.dart';
import '../../models/user/content_model.dart';

final List<ContentModel> contentData = [
  ContentModel(title: AppStrings.unlimitedContent, description: AppStrings.unlimitedContentDescription, imagePath: AssetsPath.contentPlaySVG),
  ContentModel(title: AppStrings.sharingAccount, description: AppStrings.sharingAccountDescription, imagePath: AssetsPath.contentUserSVG),
  ContentModel(title: AppStrings.fhdQuality, description: AppStrings.fhdQualityDescription, imagePath: AssetsPath.contentStarSVG),
];