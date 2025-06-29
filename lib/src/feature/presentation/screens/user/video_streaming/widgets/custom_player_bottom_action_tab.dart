import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/app_spacing.dart';
import '../../../../../../core/constant/assets_path.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../data/providers/user/video_streaming_provider.dart';

class CustomPlayerBottomActionTab extends StatelessWidget {
  const CustomPlayerBottomActionTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoStreamingProvider>(
        builder: (_, provider, __) {
          final current = provider.controller.value.position;
          final total = provider.controller.metadata.duration;
          final remaining = total - current;
          return SizedBox(
            width: AppSpacing.screenWidth(context) * 0.94,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                        onTap: provider.togglePlayPause,
                        child: Icon(
                          provider.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: AppColors.whiteColor,
                          size: 32,
                        ),
                      ),
                      GestureDetector(
                        onTap: provider.rewind10s,
                        child: SvgPicture.asset(AssetsPath.rewindSVG,
                            colorFilter:
                            const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)),
                      ),
                      GestureDetector(
                        onTap: provider.forward10s,
                        child: SvgPicture.asset(AssetsPath.fastForwardSVG,
                            colorFilter:
                            const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)),
                      ),
                      Text(
                        provider.formatTime(current),
                        style: const TextStyle(color: AppColors.whiteColor),
                      ),
                      SizedBox(
                        width: AppSpacing.screenWidth(context) * 0.6,
                        child: Slider(
                          value: provider.progress,
                          onChanged: provider.seekTo,
                          activeColor: AppColors.whiteColor,
                          inactiveColor: Colors.white38,
                        ),
                      ),
                      Text(
                        "-${provider.formatTime(remaining)}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: provider.toggleMute,
                        child: SvgPicture.asset(
                          AssetsPath.volumeButtonSVG,
                          colorFilter: ColorFilter.mode(
                            provider.isMuted ? AppColors.redColor : AppColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}