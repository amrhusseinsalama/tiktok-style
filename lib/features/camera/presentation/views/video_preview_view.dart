import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_style/core/helper/extentions.dart';
import 'package:tiktok_style/core/helper/video_filters.dart';
import 'package:tiktok_style/core/widgets/video_progress_indicator.dart';
import 'package:tiktok_style/features/video_feed/domain/entities/video_entity.dart';
import 'package:tiktok_style/features/video_feed/presentation/cubit/video_feed_cubit.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewView extends StatefulWidget {
  final String videoPath;
  final int selectedFilter;
  const VideoPreviewView({
    super.key,
    required this.videoPath,
    required this.selectedFilter,
  });

  @override
  State<VideoPreviewView> createState() => _VideoPreviewViewState();
}

class _VideoPreviewViewState extends State<VideoPreviewView> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  Future<void> initializeVideo() async {
    videoController = VideoPlayerController.file(File(widget.videoPath));
    await videoController.initialize();
    await videoController.setLooping(true);
    await videoController.play();
    setState(() {});
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!videoController.value.isInitialized) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: ColorFiltered(
                colorFilter: getFilter(widget.selectedFilter),
                child: VideoPlayer(videoController),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                if (videoController.value.isPlaying) {
                  videoController.pause();
                } else {
                  videoController.play();
                }
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  videoController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildButton("Retake", () {
                  context.pop();
                }, Colors.red),
                buildButton("Publish", () {
                  context.read<VideoFeedCubit>().addVideo(
                    VideoEntity(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      videoUrl: "",
                      localVideoPath: widget.videoPath,
                      likesCount: 0,
                      sharesCount: 0,
                      isLiked: false,
                      username: 'Current User',
                      userAvatar: '',
                      caption: '#flutter #tiktok New Video 🚀',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Video Published Successfully"),
                    ),
                  );
                  context.pop();
                }, Colors.green),
              ],
            ),
          ),
          buildVideoProgressIndicator(videoController),
        ],
      ),
    );
  }
}

Widget buildButton(String text, VoidCallback onPressed, Color backgroundColor) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10.r),
      ),
      backgroundColor: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
    ),
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: Colors.white)),
  );
}
