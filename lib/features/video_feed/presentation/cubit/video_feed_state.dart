part of 'video_feed_cubit.dart';

sealed class VideoFeedState extends Equatable {
  const VideoFeedState();

  @override
  List<Object> get props => [];
}

final class VideoFeedInitial extends VideoFeedState {}

class VideoFeedLoading extends VideoFeedState {}

class VideoFeedLoaded extends VideoFeedState {
  final List<VideoEntity> videos;

  const VideoFeedLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}

class VideoFeedError extends VideoFeedState {
  final String message;

  const VideoFeedError(this.message);
  @override
  List<Object> get props => [message];
}
