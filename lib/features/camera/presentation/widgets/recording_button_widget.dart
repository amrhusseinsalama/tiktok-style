import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildRecordingButton(
  VoidCallback onTap,
  double width,
  double height,
  double borderRadius,
) {
  return Positioned(
    bottom: 25,
    left: 0,
    right: 0,
    child: Center(
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5),
        ),
        child: Center(
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}