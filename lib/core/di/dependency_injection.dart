import 'package:get_it/get_it.dart';
import 'package:tiktok_style/features/camera/presentation/cubit/camera_cubit.dart';
import 'package:tiktok_style/features/video_feed/data/datasources/local_json_data_source.dart';
import 'package:tiktok_style/features/video_feed/data/repositories/video_repository_impl.dart';
import 'package:tiktok_style/features/video_feed/domain/repositories/video_repository.dart';
import 'package:tiktok_style/features/video_feed/presentation/cubit/video_feed_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // CameraCubit
  getIt.registerFactory(() => CameraCubit());

  // Data Source
  getIt.registerLazySingleton(() => LocalVideoDataSource());

  // Repository
  getIt.registerLazySingleton<VideoRepository>(
    () => VideoRepositoryImpl(localJsonDataSource: getIt()),
  );

  // Cubit
  getIt.registerFactory(() => VideoFeedCubit(videoRepository: getIt()));
}
