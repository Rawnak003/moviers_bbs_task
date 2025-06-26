import 'package:bbs_task/src/feature/data/models/on_boarding/on_boarding_item_model.dart';

import '../../../../core/constant/assets_path.dart';
import '../../../../core/constant/strings.dart';


final List<OnBoardingItemModel> onBoardingItems = [
  OnBoardingItemModel(
    image: AssetsPath.movieImagesPNG,
    title: AppStrings.movieTitle,
    subtitle: AppStrings.movieSubtitle,
  ),
  OnBoardingItemModel(
    image: AssetsPath.movieImagesPNG,
    title: AppStrings.seriesTitle,
    subtitle: AppStrings.seriesSubtitle,
  ),
  OnBoardingItemModel(
    image: AssetsPath.playerImagesPNG,
    title: AppStrings.playerTitle,
    subtitle: AppStrings.playerSubtitle,
  ),
];