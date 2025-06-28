import 'package:bbs_task/src/app/app_spacing.dart';
import 'package:bbs_task/src/core/routes/route_names.dart';
import 'package:bbs_task/src/feature/presentation/screens/user/top_charts/widget/custom_top_chart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constant/strings.dart';
import '../../../../data/providers/user/parent_screen_provider.dart';
import '../../../../data/static_data/user/movie_data.dart';
import '../../../common_widgets/custom_movie_info_tab.dart';

class TopChartsScreen extends StatelessWidget {
  const TopChartsScreen({super.key});

  void goToSeriesDetailsScreenFromTopCharts(context, index) {
    if (index == 7) {
      Navigator.pushNamed(context, RoutesName.seriesDetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        context.read<ParentScreenProvider>().closeTopCharts();
      },
      child: Scaffold(
        appBar: CustomTopChartAppBar(child: Text(AppStrings.topCharts)),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.horizontalPadding),
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.53,
                crossAxisSpacing: AppSpacing.verticalPadding *1.5,
                mainAxisSpacing: AppSpacing.horizontalPadding,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => goToSeriesDetailsScreenFromTopCharts(context, index),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          movieList[index+1].imagePath,
                          height: AppSpacing.screenHeight(context) * 0.3,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(movieList[index+1].movieName, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis, maxLines: 1,),
                    const SizedBox(height: 8),
                    CustomMovieInfoTab(index: index+1),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
