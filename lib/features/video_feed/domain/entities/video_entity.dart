import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String id;
  final String username;
  final String userAvatar;
  final String caption;
  final String videoUrl;
  final int likesCount;
  final int sharesCount;
  final bool isLiked;
  final String? localVideoPath;

  const VideoEntity({
    required this.id,
    required this.username,
    required this.userAvatar,
    required this.caption,
    required this.videoUrl,
    required this.likesCount,
    required this.sharesCount,
    required this.isLiked, this.localVideoPath,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    userAvatar,
    caption,
    videoUrl,
    likesCount,
    sharesCount,
    isLiked,
    localVideoPath,
  ];

  VideoEntity copyWith({
    String? id,
    String? username,
    String? userAvatar,
    String? caption,
    String? videoUrl,
    int? likesCount,
    int? sharesCount,
    bool? isLiked,
    String? localVideoPath,
  }) {
    return VideoEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      caption: caption ?? this.caption,
      videoUrl: videoUrl ?? this.videoUrl,
      likesCount: likesCount ?? this.likesCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isLiked: isLiked ?? this.isLiked,
      localVideoPath: localVideoPath ?? this.localVideoPath,
    );
  }
}
