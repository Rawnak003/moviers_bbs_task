import 'package:bbs_task/src/app/app_spacing.dart';
import 'package:bbs_task/src/feature/presentation/common_widgets/custom_parent_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constant/strings.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../data/providers/user/movie_provider.dart';
import '../../../../data/providers/user/parent_screen_provider.dart';
import '../../../common_widgets/custom_movie_info_tab.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ParentScreenProvider>();
    final searchProvider = context.watch<MovieProvider>();
    final movies = searchProvider.filteredMovies;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        provider.backToHome();
      },
      child: Scaffold(
        appBar: CustomParentAppBar(action: () => provider.backToHome(),child: Text(AppStrings.search),),
        body: Padding(
          padding: EdgeInsets.all(AppSpacing.horizontalPadding),
          child: Column(
            children: [
              TextField(
                onChanged: searchProvider.updateSearchQuery,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: AppStrings.searchByName,
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              movies.isEmpty
                  ? const Center(child: Text("No movies found."))
                  : Expanded(
                    child: GridView.builder(
                        itemCount: movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.53,
                          crossAxisSpacing: AppSpacing.verticalPadding *1.5,
                          mainAxisSpacing: AppSpacing.horizontalPadding,
                        ),
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, RoutesName.seriesDetails),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    movie.imagePath,
                                    height: AppSpacing.screenHeight(context) * 0.3,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(movie.movieName, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis, maxLines: 1,),
                              const SizedBox(height: 8),
                              CustomMovieInfoTab(index: index),
                            ],
                          );
                        }
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
