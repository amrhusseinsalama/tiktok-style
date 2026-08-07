import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tiktok_style/features/video_feed/data/models/video_model.dart';

class LocalVideoDataSource {
  Future<List<VideoModel>> getVideos() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/videos.json',
    );

    final List<dynamic> jsonData = jsonDecode(jsonString);

    return jsonData
        .map((video) => VideoModel.fromJson(video))
        .toList();
  }
}