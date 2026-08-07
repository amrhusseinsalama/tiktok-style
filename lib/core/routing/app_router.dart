import 'package:flutter/material.dart';
import 'package:tiktok_style/bottom_nav_bar.dart';
import 'package:tiktok_style/core/routing/routes.dart';
import 'package:tiktok_style/features/camera/presentation/views/video_preview_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainBottomNav:
        return MaterialPageRoute(builder: (_) => const MainBottomNavBar());
      case Routes.videoPreview:
        final args = settings.arguments as Map<String, dynamic>;

        final videoPath = args['videoPath'];
        final selectedFilter = args['selectedFilter'];
        return MaterialPageRoute(
          builder: (_) => VideoPreviewView(
            videoPath: videoPath,
            selectedFilter: selectedFilter,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this path')),
          ),
        );
    }
  }
}
