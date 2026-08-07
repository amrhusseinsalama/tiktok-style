import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tiktok_style/core/helper/time_format.dart';
import 'package:tiktok_style/core/services/video_cache_service.dart';
import 'package:tiktok_style/core/widgets/video_progress_indicator.dart';
import 'package:tiktok_style/features/video_feed/domain/entities/video_entity.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final VideoEntity video;
  final bool isActive;

  const VideoItem({super.key, required this.isActive, required this.video});

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController? controller;
  bool isPaused = false;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  Future<void> initializeVideo() async {
    if (widget.video.localVideoPath != null) {
      controller = VideoPlayerController.file(
        File(widget.video.localVideoPath!),
      );
    } else {
      final file = await VideoCacheService.getVideoFile(widget.video.videoUrl);
      controller = VideoPlayerController.file(file);
    }
    await controller?.initialize();
    controller?.addListener(() {
      if (mounted) {
        setState(() {
          position = controller!.value.position;
        });
      }
    });
    await controller?.setLooping(true);
    if (widget.isActive) {
      await controller?.play();
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isActive) {
      controller?.play();
    } else {
      controller?.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (controller!.value.isPlaying) {
          controller!.pause();
          isPaused = true;
        } else {
          controller!.play();
          isPaused = false;
        }
        setState(() {});
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller?.value.size.width,
                height: controller?.value.size.height,
                child: VideoPlayer(controller!),
              ),
            ),
          ),
          if (isPaused) Icon(Icons.play_arrow, color: Colors.white, size: 80),
          buildVideoProgressIndicator(controller!),
          Positioned(
            right: 6,
            bottom: 6,
            child: Text(
              "${formatDuration(position)} / ${formatDuration(controller!.value.duration)}",
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
