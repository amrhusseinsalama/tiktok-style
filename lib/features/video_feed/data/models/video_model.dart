import 'package:tiktok_style/features/video_feed/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({
    required super.id,
    required super.username,
    required super.userAvatar,
    required super.caption,
    required super.videoUrl,
    required super.likesCount,
    required super.sharesCount,
    required super.isLiked,
    super.localVideoPath,
  });

  factory VideoModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return VideoModel(
      id: json['id'],
      username: json['username'],
      userAvatar: json['userAvatar'],
      caption: json['caption'],
      videoUrl: json['videoUrl'],
      likesCount: json['likesCount'],
      sharesCount: json['sharesCount'],
      isLiked: json['isLiked'],
      localVideoPath: json['localVideoPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'userAvatar': userAvatar,
      'caption': caption,
      'videoUrl': videoUrl,
      'likesCount': likesCount,
      'sharesCount': sharesCount,
      'isLiked': isLiked,
      'localVideoPath': localVideoPath,
    };
  }
}