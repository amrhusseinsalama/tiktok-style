import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_style/core/routing/app_router.dart';

class TikTokStyle extends StatelessWidget {
  final String initialRoute;
  final AppRouter appRouter;
  const TikTokStyle({super.key, required this.initialRoute, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(
            color: Colors.black,
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            onGenerateRoute: appRouter.generateRoute,
            ),
    );
  }
}
