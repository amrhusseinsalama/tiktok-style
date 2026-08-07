import 'package:tiktok_style/features/video_feed/domain/entities/video_entity.dart';

abstract class VideoRepository {
  Future<List<VideoEntity>> getVideos();
}