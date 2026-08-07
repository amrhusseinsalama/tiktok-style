import 'package:tiktok_style/features/video_feed/data/datasources/local_json_data_source.dart';
import 'package:tiktok_style/features/video_feed/data/models/video_model.dart';
import 'package:tiktok_style/features/video_feed/domain/entities/video_entity.dart';
import 'package:tiktok_style/features/video_feed/domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final LocalVideoDataSource localJsonDataSource;

  VideoRepositoryImpl({required this.localJsonDataSource});
  @override
  Future<List<VideoEntity>> getVideos() async {
    final List<VideoModel> models = await localJsonDataSource.getVideos();
    return models.map<VideoEntity>((model) => model).toList();
  }
}
