import 'package:flutter/material.dart';
import 'package:tiktok_style/features/camera/presentation/views/camera_view.dart';
import 'package:tiktok_style/features/video_feed/presentation/views/video_feed_view.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  late final List<Widget> pages;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = [const VideoFeedView(), const CameraView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: [
          buildNavBarItem(Icons.video_library, 'Video Feed'),
          buildNavBarItem(Icons.camera_alt, 'Camera'),
        ],
      ),
    );
  }
}

BottomNavigationBarItem buildNavBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
