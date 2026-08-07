# TikTok Style Flutter App

A TikTok-style Flutter application built as a Flutter Developer Assessment using Flutter, Clean Architecture, and BLoC State Management.

---

## Features

### Video Feed

- Vertical scrolling video feed
- Auto-play active video
- Pause inactive videos while scrolling
- Loop video playback
- Like videos
- Share videos
- Video progress indicator
- Video scrubbing (seek forward/backward)

### Video Caching

- Cache videos after first playback
- Load cached videos when available
- Prevent duplicate downloads

### Camera

- Record videos up to 30 seconds
- Switch between front and back cameras
- Live camera filters
- Video preview before publishing
- Publish recorded videos directly to the feed

---

## Architecture

The project follows a simplified Clean Architecture approach with Feature-Based Structure.

- **Presentation Layer** → UI, Cubits, Widgets.
- **Domain Layer** → Business Logic, Entities, Repository Contracts.
- **Data Layer** → Repository Implementations, Models, Data Sources.
- **Core Layer** → Shared Utilities, Routing, Dependency Injection, Services.

### Presentation Layer

Responsible for UI and State Management.

- Flutter Widgets
- Screens / Views
- Reusable Components
- Cubit (flutter_bloc)
- BlocConsumer
- BlocProvider

### Domain Layer

Responsible for business rules and contracts.

- Entities
- Repository Contracts

### Data Layer

Responsible for data retrieval and management.

- Repository Implementations
- Models
- Local JSON Data Source
- Video Cache Service

### Core Layer

Shared utilities and app-wide services.

- Dependency Injection (GetIt)
- Routing System
- Navigation Extensions
- Video Filters
- Helpers & Utilities
- Reusable Widgets

---

## Packages Used

- flutter_bloc
- get_it
- equatable
- camera
- video_player
- flutter_screenutil
- cached_video_player_plus
- flutter_cache_manager

---

## Project Structure

```text
lib
├── core
│   ├── di
│   │   └── dependency_injection.dart
│   │
│   ├── helper
│   │   ├── extensions.dart
│   │   ├── spacing.dart
│   │   └── video_filters.dart
│   │
│   ├── routing
│   │   ├── app_router.dart
│   │   └── routes.dart
│   │
│   ├── services
│   │   └── video_cache_service.dart
│   │
│   └── widgets
│
├── features
│   ├── camera
│   │   └── presentation
│   │       ├── cubit
│   │       ├── views
│   │       └── widgets
│   │
│   └── video_feed
│       ├── data
│       │   ├── datasources
│       │   ├── models
│       │   └── repositories
│       │
│       ├── domain
│       │   ├── entities
│       │   └── repositories
│       │
│       └── presentation
│           ├── cubit
│           ├── views
│           └── widgets
│
├── bottom_nav_bar.dart
└── main.dart
```

## Setup

### 1. Clone Repository

```bash
git clone https://github.com/amrhusseinsalama/tiktok-style.git
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run Application

```bash
flutter run
```

---

## APK

APK file included in the submission.

---

## Author

**Amr Hussein**
Flutter Developer