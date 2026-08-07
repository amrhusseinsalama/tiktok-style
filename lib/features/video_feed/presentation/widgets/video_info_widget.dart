import 'package:flutter/material.dart';
import 'package:tiktok_style/core/helper/spacing.dart';
import '../../domain/entities/video_entity.dart';

class VideoInfoWidget extends StatelessWidget {
  final VideoEntity video;

  const VideoInfoWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      bottom: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${video.username}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpacing(8),
          Text(video.caption, style: const TextStyle(color: Colors.white)),
          verticalSpacing(4),
          Text(
            '🎵 Original Sound - Flutter TikTok Clone',
            style: TextStyle(color: Colors.white, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
