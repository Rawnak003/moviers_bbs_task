import 'dart:ui';
import 'package:bbs_task/src/core/constant/assets_path.dart';
import 'package:bbs_task/src/core/constant/colors.dart';
import 'package:bbs_task/src/feature/presentation/screens/user/home/widgets/custom_movie_info_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../app/app_spacing.dart';
import '../../../../../data/providers/user/trailer_player_provider.dart';
import '../../../../../data/static_data/user/movie_data.dart';
import 'custom_progress_bar.dart';

class TrailerPlayerWidget extends StatefulWidget {
  const TrailerPlayerWidget({super.key});

  @override
  State<TrailerPlayerWidget> createState() => _TrailerPlayerWidgetState();
}

class _TrailerPlayerWidgetState extends State<TrailerPlayerWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TrailerPlayerProvider>().initializePlayer("assets/videos/trailer.mp4");
    });
  }

  @override
  void dispose() {
    context.read<TrailerPlayerProvider>().disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrailerPlayerProvider>(
      builder: (_, provider, __) {
        final controller = provider.controller;

        if (!provider.isInitialized) {
          return SizedBox(
            height: AppSpacing.screenHeight(context) * 0.25,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(AppSpacing.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: provider.togglePlayPause,
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 8,
                    right: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.blurWhiteColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: provider.toggleVolume,
                                child: SvgPicture.asset(
                                  AssetsPath.volumeIconSVG,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    provider.volume > 0
                                        ? AppColors.whiteColor
                                        : AppColors.redColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              CustomProgressBar(
                                progress: provider.progress,
                                width: AppSpacing.screenWidth(context) * 0.6,
                              ),
                              Text(
                                provider.formatDuration(provider.position),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(movieList[7].movieName, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 4),
              CustomMovieInfoTab(index: 7, showGenre: true,)
            ],
          ),
        );
      },
    );
  }
}
