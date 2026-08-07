import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_style/app_root.dart';
import 'package:tiktok_style/core/di/dependency_injection.dart';
import 'package:tiktok_style/core/routing/app_router.dart';
import 'package:tiktok_style/core/routing/routes.dart';
import 'package:tiktok_style/features/video_feed/presentation/cubit/video_feed_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(
    BlocProvider(
      create: (context) => getIt<VideoFeedCubit>()..loadVideos(),
      child: TikTokStyle(
        appRouter: AppRouter(),
        initialRoute: Routes.mainBottomNav,
      ),
    ),
  );
}
