import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_style/core/helper/spacing.dart';
import 'package:tiktok_style/features/video_feed/presentation/cubit/video_feed_cubit.dart';
import '../../domain/entities/video_entity.dart';

class VideoActionsWidget extends StatelessWidget {
  final VideoEntity video;

  const VideoActionsWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            child: Text(video.username[0].toUpperCase()),
          ),

          verticalSpacing(20),
          IconButton(
            onPressed: () {
              context.read<VideoFeedCubit>().toggleLike(video.id);
            },  
            icon: Icon(
              Icons.favorite,
              color: video.isLiked ? Colors.red : Colors.white,
              size: 35,
            ),
          ),

          Text(
            '${video.likesCount}',
            style: const TextStyle(color: Colors.white),
          ),

          verticalSpacing(20),

          IconButton(
            onPressed: () {
              context.read<VideoFeedCubit>().increaseShareCount(video.id);
            },
            icon: const Icon(Icons.share, color: Colors.white, size: 35),
          ),

          Text(
            '${video.sharesCount}',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
