# TikTok Style Flutter App

A TikTok-style Flutter application built as a Flutter Developer Assessment.

## Features

### Video Feed
- Vertical scrolling feed
- Auto-play visible video
- Pause previous video when scrolling
- Loop videos
- Like button
- Share button
- Video progress indicator
- Scrubbing support (seek forward/backward)

### Video Caching
- Cache videos after first playback
- Play cached videos when available
- Prevent duplicate downloads

### Camera
- Record video up to 30 seconds
- Switch front/back camera
- Live camera filters
- Video preview before publishing
- Publish recorded videos to feed

### Architecture
- Clean Architecture
- Cubit (flutter_bloc)
- Dependency Injection using GetIt

## Packages Used

- flutter_bloc
- get_it
- camera
- video_player
- cached_video_player_plus
- flutter_cache_manager
- flutter_screenutil
- equatable

## Project Structure

```text
lib/
├── core/
├── features/
│   ├── camera/
│   └── video_feed/
├── routing/
└── main.dart
```

## Setup

1. Clone repository

```bash
git clone YOUR_REPO_LINK
```

2. Install dependencies

```bash
flutter pub get
```

3. Run application

```bash
flutter run
```

## APK

APK included in submission.

## Author

Amr Hussein