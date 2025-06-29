import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TrailerPlayerProvider extends ChangeNotifier {
  late VideoPlayerController _controller;

  VideoPlayerController get controller => _controller;
  bool get isInitialized => _controller.value.isInitialized;
  bool get isPlaying => _controller.value.isPlaying;
  double get volume => _controller.value.volume;
  Duration get position => _controller.value.position;
  Duration get duration => _controller.value.duration;

  Future<void> initializePlayer(String assetPath) async {
    _controller = VideoPlayerController.asset(assetPath);
    await _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _controller.addListener(notifyListeners);
    _controller.setVolume(0);
    notifyListeners();
  }

  void togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    notifyListeners();
  }

  void toggleVolume() {
    if (_controller.value.volume > 0) {
      _controller.setVolume(0);
    } else {
      _controller.setVolume(1);
    }
    notifyListeners();
  }

  double get progress {
    if (_controller.value.duration.inSeconds == 0) return 0.0;
    return _controller.value.position.inSeconds /
        _controller.value.duration.inSeconds;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void disposePlayer() {
    _controller.removeListener(notifyListeners);
    _controller.dispose();
  }
}
