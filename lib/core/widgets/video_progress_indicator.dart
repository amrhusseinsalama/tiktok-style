import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget buildVideoProgressIndicator(VideoPlayerController controller) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: VideoProgressIndicator(
      controller,
      allowScrubbing: true,
      padding: EdgeInsets.zero,
      colors: const VideoProgressColors(
        playedColor: Colors.white,
        bufferedColor: Colors.white24,
        backgroundColor: Colors.grey,
      ),
    ),
  );
}
