import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_style/features/video_feed/domain/entities/video_entity.dart';
import 'package:tiktok_style/features/video_feed/domain/repositories/video_repository.dart';

part 'video_feed_state.dart';

class VideoFeedCubit extends Cubit<VideoFeedState> {
  final VideoRepository videoRepository;
  List<VideoEntity> videos = [];
  VideoFeedCubit({required this.videoRepository}) : super(VideoFeedInitial());

  Future<void> loadVideos() async {
    emit(VideoFeedLoading());
    try {
      videos = await videoRepository.getVideos();
      emit(VideoFeedLoaded(videos));
    } catch (e) {
      emit(VideoFeedError(e.toString()));
    }
  }

  void increaseShareCount(String videoId) {
    videos = videos.map((video) {
      if (video.id == videoId) {
        final updatedVideo = video.copyWith(sharesCount: video.sharesCount + 1);
        return updatedVideo;
      }

      return video;
    }).toList();

    emit(VideoFeedLoaded(videos));
  }

  void toggleLike(String videoId) {
    videos = videos.map((video) {
      if (video.id == videoId) {
        return video.copyWith(
          isLiked: !video.isLiked,
          likesCount: video.isLiked
              ? video.likesCount - 1
              : video.likesCount + 1,
        );
      }

      return video;
    }).toList();

    emit(VideoFeedLoaded(videos));
  }

  void addVideo(VideoEntity video) {
    videos = List<VideoEntity>.from(videos)..insert(0, video);
    emit(VideoFeedLoaded(List<VideoEntity>.from(videos)));
  }
}
