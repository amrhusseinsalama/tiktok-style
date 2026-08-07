import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_style/features/video_feed/presentation/widgets/video_actions_widget.dart';
import 'package:tiktok_style/features/video_feed/presentation/widgets/video_info_widget.dart';
import 'package:tiktok_style/features/video_feed/presentation/widgets/video_item_widget.dart';
import '../cubit/video_feed_cubit.dart';

class VideoFeedView extends StatelessWidget {
  const VideoFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoFeedBody();
  }
}

class VideoFeedBody extends StatefulWidget {
  const VideoFeedBody({super.key});

  @override
  State<VideoFeedBody> createState() => _VideoFeedBodyState();
}

class _VideoFeedBodyState extends State<VideoFeedBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideoFeedCubit, VideoFeedState>(
        builder: (context, state) {
          if (state is VideoFeedLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is VideoFeedLoaded) {
            return PageView.builder(
              allowImplicitScrolling: true,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              scrollDirection: Axis.vertical,
              itemCount: state.videos.length,
              itemBuilder: (context, index) {
                final video = state.videos[index];
                return Stack(
                  children: [
                    VideoItem(isActive: currentIndex == index, video: video),
                    VideoActionsWidget(video: video),
                    VideoInfoWidget(video: video),
                  ],
                );
              },
            );
          }

          if (state is VideoFeedError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
