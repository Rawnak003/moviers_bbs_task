import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoStreamingProvider extends ChangeNotifier {
  late YoutubePlayerController controller;
  bool isMuted = false;
  double progress = 0.0;

  VideoStreamingProvider() {
    _initController();
  }

  void _initController() {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("https://youtu.be/VO8Bk03Xv90")!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
      ),
    )..addListener(_updateProgress);
  }

  void _updateProgress() {
    final total = controller.metadata.duration.inMilliseconds;
    final current = controller.value.position.inMilliseconds;
    if (total > 0) {
      progress = current / total;
      notifyListeners();
    }
  }

  void togglePlayPause() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    notifyListeners();
  }

  void rewind10s() {
    final newPos = controller.value.position - const Duration(seconds: 10);
    controller.seekTo(newPos);
  }

  void forward10s() {
    final newPos = controller.value.position + const Duration(seconds: 10);
    controller.seekTo(newPos);
  }

  void seekTo(double value) {
    final newPosition = controller.metadata.duration * value;
    controller.seekTo(newPosition);
    progress = value;
    notifyListeners();
  }

  void toggleMute() {
    isMuted ? controller.unMute() : controller.mute();
    isMuted = !isMuted;
    notifyListeners();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$minutes:$seconds";
  }

  @override
  void dispose() {
    controller.removeListener(_updateProgress);
    controller.dispose();
    super.dispose();
  }
}
