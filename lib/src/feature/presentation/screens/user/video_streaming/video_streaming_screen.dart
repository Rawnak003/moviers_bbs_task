import 'package:bbs_task/src/feature/data/providers/user/video_streaming_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../app/app_spacing.dart';
import '../../../../../core/constant/assets_path.dart';
import '../../../../../core/constant/colors.dart';
import 'widgets/custom_player_bottom_action_tab.dart';

class VideoStreamingScreen extends StatefulWidget {
  const VideoStreamingScreen({super.key});

  @override
  State<VideoStreamingScreen> createState() => _VideoStreamingScreenState();
}

class _VideoStreamingScreenState extends State<VideoStreamingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: Provider.of<VideoStreamingProvider>(context).controller,
        aspectRatio: 16 / 9,
        topActions: [
          Container(
            padding: const EdgeInsets.only(top: 16),
            width: AppSpacing.screenWidth(context) * 0.94,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AssetsPath.playerLogoSVG,
                  colorFilter: const ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  "PG |",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ],
        bottomActions: [CustomPlayerBottomActionTab()],
      ),
        builder: (context, player) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, __) async {
              if (!didPop) {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                });
              }
            },
            child: Scaffold(
              body: Center(child: player),
            ),
          );
        }

    );
  }
}
