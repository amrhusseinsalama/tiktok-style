import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VideoCacheService {
  static Future<File> getVideoFile(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);

    return file;
  }
}